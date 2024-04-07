//
//  Painter.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

import Foundation

import WebGL1
import WebGL2
import WebAPIBase
import DRUI
import DRColor
import DRPaint
import DRMath

protocol TextureFilterExt {
    func glow_code() -> GLenum
}

extension TextureFilter: TextureFilterExt {
    func glow_code() -> GLenum {
        return switch self {
            case .linear:
                .LINEAR
            case .nearest:
                .NEAREST
        }
    }
}

protocol TextureWrapModeExt {
    func glow_code() -> GLenum
}

extension TextureWrapMode: TextureWrapModeExt {
    func glow_code() -> GLenum {
        return switch self {
            case .clampToEdge:
                .CLAMP_TO_EDGE
            case .repeat:
                .REPEAT
            case .mirroredRepeat:
                .MIRRORED_REPEAT
        }
    }
}



/// A callback function that can be used to compose an [`egui::PaintCallback`] for custom rendering
/// with [`glow`].
///
/// The callback is passed, the [`egui::PaintCallbackInfo`] and the [`Painter`] which can be used to
/// access the OpenGL context.
///
/// # Example
///
/// See the [`custom3d_glow`](https://github.com/emilk/egui/blob/master/crates/egui_demo_app/src/apps/custom3d_wgpu.rs) demo source for a detailed usage example.
public struct RcCallBackFn{
    var f: (PaintCallbackInfo, Painter) -> Void

    public init(callback: consuming @escaping (PaintCallbackInfo, Painter) -> Void) {
        self.f = callback
    }

}

public struct Painter: ~Copyable {
    let gl: ArcGLowContext
    var maxTextureSide: Int
    var uSampler: WebGLUniformLocation
    var srgbTextures: Bool
    var supportsSrgbFrameBuffer: Bool = false
    var program: WebGLProgram
    var screenSize: WebGLUniformLocation
    let is_webgl_1: Bool
    var vao: VertexArrayObject
    var vbo: WebGLBuffer
    var elementArrayBuffer: WebGLBuffer
    var textures: Dictionary<TextureId, WebGLTexture>
    var nextNativeTexId: UInt64
    var texturesToDestory: [WebGLTexture]
    var destoryed: Bool
    
    public init(
        gl: WebGL2RenderingContext,
        shader_prefix: StaticString,
        shader_version: ShaderVersion?
        ) {
        guard let version = gl.getParameter(pname: .VERSION).string,
            let renderer = gl.getParameter(pname: .RENDERER).string,
            let vendor = gl.getParameter(pname: .VENDOR).string,
            let max_texture_side: Int = gl.getParameter(pname: .MAX_TEXTURE_SIZE).fromJSValue()
        else {
            fatalError()
        }

        debugPrint("""
        opengl version: \(version)
        opengl renderer: \(renderer)
        opengl vendor: \(vendor)
        """)

        let shader_version = shader_version ?? ShaderVersion.get(gl: gl)
        let is_webgl_1 = shader_version == .es100
        let shader_version_declaration = shader_version.version_declaration()
        debugPrint("Shader header: \(shader_version_declaration)")

        let supported_extensions = gl.getSupportedExtensions() ?? []
        debugPrint("OpenGl extensions: \(supported_extensions)")

        // let srgb_textures = shader_version == .es300 || supported_extensions.an
        let srgb_textures = true // WebGL2 always support sRGB

        let supports_srgb_framebuffer = false

        guard let vShader = gl.createShader(
            type: .VERTEX_SHADER, 
            source: """
                \(shader_version_declaration)
                #define NEW_SHADER_INTERFACE \(shader_version.is_new_shader_interface() ? 1 : 0)
                \(shader_prefix) 
                \(vertexShaderSource)
                """
            ),
            let fShader = gl.createShader(
                type: .FRAGMENT_SHADER, 
                source: """
                \(shader_version_declaration)
                #define NEW_SHADER_INTERFACE \(shader_version.is_new_shader_interface() ? 1 : 0)
                #define SRGB_TEXTURES \(srgb_textures ? 1 : 0)
                \(shader_prefix)
                \(fragmentShaderSource)
                """
            ),
            let program = gl.linkProgram(
                vShader: vShader, 
                fShader: fShader
                )
        else {
            console.error(data: "Failed to create or link shaders")
            // return nil
            fatalError()
        }
        
        gl.detachShader(program: program, shader: vShader)
        gl.detachShader(program: program, shader: fShader)
        gl.deleteShader(shader: vShader)
        gl.deleteShader(shader: fShader)
        
        // self.program = program
        
        guard let uScreenSize = gl.getUniformLocation(program: program, name: uScreenSize) else {
            console.error(data: "Failed to get uScreenSize Location")
        //     return nil
        fatalError()
        }
        guard let u_sampler = gl.getUniformLocation(program: program, name: u_sampler_name) else {
            console.error(data: "Failed to get uScreenSize Location")
            // return nil
            fatalError()
        }
        
        guard let vbo = gl.createBuffer() else {
            console.error(data: "Failed to createBuffer")
            // return nil
            fatalError()
        }
        
        let aPosLocations = gl.getAttribLocation(program: program, name: aPos)
        let acolorLocations = gl.getAttribLocation(program: program, name: attributeColor)
        let aTcLocations = gl.getAttribLocation(program: program, name: aTc)

        
        let stride = MemoryLayout<Vertex>.stride
        let bufferInfos: [BufferInfo] = [
            BufferInfo(
                location: GLuint(aPosLocations),
                vectorSize: 2,
                dataType: .FLOAT,
                normalized: false,
                stride: GLsizei(stride),
                offset: GLintptr(MemoryLayout<Vertex>.offset(of: \.pos)!)
            ),
            BufferInfo(
                location: GLuint(aTcLocations),
                vectorSize: 2,
                dataType: .FLOAT,
                normalized: false,
                stride: GLsizei(stride),
                offset: GLintptr(MemoryLayout<Vertex>.offset(of: \.uv)!)
            ),
            BufferInfo(
                location: GLuint(acolorLocations),
                vectorSize: 4,
                dataType: .UNSIGNED_BYTE,
                normalized: false,
                stride: GLsizei(stride),
                offset: GLintptr(MemoryLayout<Vertex>.offset(of: \.color)!)
            )
        ]
        
        let vao = VertexArrayObject(gl: gl, vbo: vbo, bufferInfos: bufferInfos)

        guard let elementArrayBuffer = gl.createBuffer() else {
                        console.error(data: "Failed to createBuffer")
            // return nil
            fatalError()
        }

        self.gl = gl
        self.maxTextureSide = max_texture_side
        self.program = program
        self.screenSize = uScreenSize
        self.uSampler = u_sampler 
        self.is_webgl_1 = is_webgl_1
        self.vao = vao
        self.srgbTextures = srgb_textures
        self.supportsSrgbFrameBuffer = supports_srgb_framebuffer
        self.vbo = vbo
        self.elementArrayBuffer = elementArrayBuffer
        self.textures = [:]
        self.nextNativeTexId = 1 << 32
        self.texturesToDestory = []
        self.destoryed = false
    }
    
    mutating private func preparePaint(
        widthInPixels: UInt32, 
        heightInPixels: UInt32, 
        pixelsPerPoint: Float32
    ) {
        gl.enable(cap: .SCISSOR_TEST)
        // egui outputs mesh in both winding orders
        gl.disable(cap: .CULL_FACE)
        gl.disable(cap: .DEPTH_TEST)
        
        gl.colorMask(red: true, green: true, blue: true, alpha: true)
        
        gl.enable(cap: .BLEND)
        
        gl.blendEquationSeparate(
            modeRGB: .FUNC_ADD,
            modeAlpha: .FUNC_ADD
        )
        
        gl.blendFuncSeparate(
            // egui outputs colors with premultiplied alpha:
            srcRGB: .ONE,
            dstRGB: .ONE_MINUS_SRC_COLOR,
            // Less important, but this is technically the correct alpha blend function
            // when you want to make use of the framebuffer alpha (for screenshots, compositing, etc).
            srcAlpha: .ONE_MINUS_DST_ALPHA,
            dstAlpha: .ONE
        )
        
        // determine whether support srgb framebuffer
//    if self.supportsSrgbFrameBuffer {
//         // DO Nothing
//     }
        // always false
        let width_in_points = Float32(widthInPixels) / pixelsPerPoint;
        let height_in_points = Float32(heightInPixels) / pixelsPerPoint;
        gl.viewport(
            x: 0, 
            y: 0, 
            width: GLsizei(widthInPixels), 
            height: GLsizei(heightInPixels)
        )
        gl.useProgram(program: program)
        
        gl.uniform2f(
            location: screenSize, 
            x: GLfloat(width_in_points), 
            y: GLfloat(height_in_points)
        )
        gl.uniform1i(location: self.uSampler, x: 0)
        gl.activeTexture(texture: .TEXTURE0)

        vao.bind(gl: gl)
        gl.bindBuffer(
            target: .ELEMENT_ARRAY_BUFFER, 
            buffer: elementArrayBuffer
        )
    }

    internal mutating func upload_texture_srgb(
        // &mut self,
        pos: (Int, Int)?,
        w: Int,
        h: Int,
        options: TextureOptions,
        data: [UInt8] 
    ) {
        // crate::profile_function!();
        assert(data.count == w * h * 4);
        assert(
            w <= self.maxTextureSide && h <= self.maxTextureSide,
            "Got a texture image of size \(w)x\(h), but the maximum supported texture side is only \(self.maxTextureSide)"
       );


        self.gl.texParameteri(
            target: .TEXTURE_2D, 
            pname: .TEXTURE_MAG_FILTER, 
            param: GLint(options.magnification.glow_code())
        )
        self.gl.texParameteri(
            target: .TEXTURE_2D, 
            pname: .TEXTURE_MIN_FILTER, 
            param: GLint(options.minification.glow_code())
        )
        self.gl.texParameteri(
            target: .TEXTURE_2D, 
            pname: .TEXTURE_WRAP_S, 
            param: GLint(options.wrapMode.glow_code())
        )
        self.gl.texParameteri(
            target: .TEXTURE_2D, 
            pname: .TEXTURE_WRAP_T, 
            param: GLint(options.wrapMode.glow_code())
        )

        let internal_format: GLenum
        let scr_format: GLenum
        if self.is_webgl_1 {
            let format = if self.srgbTextures {
                GLenum.SRGB8_ALPHA8
            } else {
                GLenum.RGBA
            };
            internal_format = format
            scr_format = format
        } else if self.srgbTextures {
            internal_format = .SRGB8_ALPHA8
            scr_format = .RGBA
        } else {
            internal_format = .RGBA8
            scr_format = .RGBA
        }

            // self.gl.pixel_store_i32(glow::UNPACK_ALIGNMENT, 1);
            self.gl.pixelStorei(pname: .UNPACK_ALIGNMENT, param: 1)

            let level = 0;
            if let (x, y) = pos {
                // crate::profile_scope!("gl.tex_sub_image_2d");
                // self.gl.tex_sub_image_2d(
                //     glow::TEXTURE_2D,
                //     level,
                //     x as _,
                //     y as _,
                //     w as _,
                //     h as _,
                //     src_format,
                //     glow::UNSIGNED_BYTE,
                //     glow::PixelUnpackData::Slice(data),
                // );
                // self.gl.texSubImage2D(target: .TEXTURE_2D, level: level, xoffset: GLint(x), yoffset: GLint(y), format: GLenum, type: GLenum, source: HTMLCanvasElement)
                // self.gl.texsubimage2dtlxywhf
                // self.gl.texsubimagetargetlevelxoffsetyoffsetforma
                self.gl.texSubImage2D(
                    target: .TEXTURE_2D, 
                    level: GLint(level), 
                    xoffset: GLint(x), 
                    yoffset: GLint(y), 
                    width: GLsizei(x), 
                    height: GLsizei(h), 
                    format: scr_format, 
                    type: .UNSIGNED_BYTE, 
                    pboOffset: data.ptr)

                // check_for_gl_error!(&self.gl, "tex_sub_image_2d");
            } else {
                let border = 0;
                // crate::profile_scope!("gl.tex_image_2d");
                // self.gl.tex_image_2d(
                //     glow::TEXTURE_2D,
                //     level,
                //     internal_format as _,
                //     w as _,
                //     h as _,
                //     border,
                //     src_format,
                //     glow::UNSIGNED_BYTE,
                //     Some(data),
                // );
                // self.gl.texImage
                // check_for_gl_error!(&self.gl, "tex_image_2d");
            }
    }



    /// Get the [`glow::Texture`] bound to a [`egui::TextureId`].
    public func texture(texture_id: TextureId) -> WebGLTexture? {
        // self.textures.get(&texture_id).copied()
        return self.textures[texture_id]
    }


    public mutating func register_native_texture(native: WebGLTexture) -> TextureId {
        self.assert_not_destroyed();
        let id = TextureId.user(self.nextNativeTexId)
        self.nextNativeTexId += 1
        self.textures[id] = native
        return id
    }


    public mutating func replace_native_texture(id: TextureId, replacing: WebGLTexture) {
       if let old_tex = self.textures[id] {
            self.texturesToDestory.append(old_tex)
        }
        self.textures[id] = replacing
    }




    public func read_screen_rgba(w: UInt32,  h: UInt32) -> ColorImage {
        // crate::profile_function!();

        // let mut pixels = vec![0_u8; (w * h * 4) as usize];
        var pixels = [UInt8](repeating: 0, count:  Int(w * h * 4) )
        self.gl.readPixels(
            x: 0, 
            y: 0, 
            width: GLsizei(w), 
            height: GLsizei(h), 
            format: .RGBA, 
            type: .UNSIGNED_BYTE, 
            dstData: pixels
        )
        let flipped = [Color32].init(unsafeUninitializedCapacity: Int(w * h)) { ptr, capacity in
            for i in 0..<Int(h) {
                // Calculate start index of current row in flipped array
                let startIndex = (Int(h) - 1 - i) * Int(w) * 4
                let colorStartIndex = i * Int(w)
                // Copy pixels of current row into flipped array
                let sourceIndex = i * Int(w) * 4
                for x in 0..<Int(w) {
                    ptr[colorStartIndex] = Color32(
                        r: pixels[startIndex + 0], 
                        g: pixels[startIndex + 1], 
                        b: pixels[startIndex + 2], 
                        a: pixels[startIndex + 3]
                        )
                }
            }
            capacity = Int(w * h)
        }
        return ColorImage(size: (Int(w),Int(h)), pixels: flipped)
    }


    public func read_screen_rgb(w: UInt32, h: UInt32) -> [UInt8] {
        let pixels = [UInt8](repeating: 0, count: Int(w * h * 3))

        //  FIXME: load pixel
        self.gl.readPixels(
            x: 0, 
            y: 0, 
            width: GLsizei(w), 
            height: GLsizei(h), 
            format: .RGB, 
            type: .UNSIGNED_BYTE, 
            dstData: pixels )

        return pixels
    }

    func destory_gl() {
        self.gl.deleteProgram(program: self.program)
        for tex in self.textures.values {
            self.gl.deleteTexture(texture: tex)
        }
        self.gl.deleteBuffer(buffer: self.vbo)
        self.gl.deleteBuffer(buffer: self.elementArrayBuffer)
        for t in self.texturesToDestory {
            self.gl.deleteTexture(texture: t)
        }
    }

    public consuming func destory() {
        if !self.destoryed {
            self.destory_gl()
        }
        self.destoryed = true
    }

    func assert_not_destroyed() {
        assert(!self.destoryed, "the egui glow has already been destroyed!")
    }

    deinit {
        if !self.destoryed {
            console.warn(data: "You forgot to call destroy() on the egui glow painter. Resources will leak!")
        }
    }
}

extension Painter {
    public func clear(
        screen_size_in_pixels: (UInt32, UInt32), 
        clear_color: (Float32, Float32, Float32, Float32)
    ) {
        // clear(&self.gl, screen_size_in_pixels, clear_color);

    }

}

extension WebGL2RenderingContext {
    func createShader(type: GLenum, source: String) -> WebGLShader? {
        guard let shader = createShader(type: type) else { return nil }
        
        shaderSource(shader: shader, source: source)
        compileShader(shader: shader)
        
        switch getShaderParameter(shader: shader, pname: .COMPILE_STATUS) {
        case .undefined, .boolean(false):
            if let log = getShaderInfoLog(shader: shader) {
                console.log(data: log.jsValue)
            }
            deleteShader(shader: shader)
            return nil
            
        default:
            return shader
        }
    }
    
    func linkProgram(vShader: WebGLShader, fShader: WebGLShader) -> WebGLProgram? {
        guard let program = createProgram() else { return nil }
        
        attachShader(program: program, shader: vShader)
        attachShader(program: program, shader: fShader)
        linkProgram(program: program)
        
        switch getProgramParameter(program: program, pname: .LINK_STATUS) {
        case .undefined, .boolean(false):
            if let log = getProgramInfoLog(program: program) {
                console.log(data: log.jsValue)
            }
            deleteProgram(program: program)
            return nil
            
        default:
            return program
        }
    }
}

func clear(gl: ArcGLowContext, screen_size_in_pixels: (UInt32, UInt32), clear_color: (Float32, Float32, Float32, Float32)) {
    // gl.disable(glow::SCISSOR_TEST);
    gl.disable(cap: .SCISSOR_TEST)

    gl.viewport(
        x: 0, 
        y: 0, 
        width: GLsizei(screen_size_in_pixels.0), 
        height: GLsizei(screen_size_in_pixels.1)
    )
    gl.clearColor(
        red: GLclampf(clear_color.0), 
        green: GLclampf(clear_color.1), 
        blue: GLclampf(clear_color.2), 
        alpha: GLclampf(clear_color.3)
    )
    gl.clear(mask: .COLOR_BUFFER_BIT)
}

fileprivate func set_clip_rect(
    gl: ArcGLowContext,
    width_px: UInt32,
    height_px: UInt32,
    pixels_per_point: Float32,
    clip_rect: Rect
) {
    // Transform clip rect to physical pixels:
    let clip_min_x = GLint((pixels_per_point * clip_rect.min.x).rounded())
        .clamped(min: 0, max: GLint(width_px))
    let clip_min_y = GLint((pixels_per_point * clip_rect.min.y).rounded())
        .clamped(min: 0, max: GLint(height_px))
    let clip_max_x = GLint((pixels_per_point * clip_rect.max.x).rounded())
        .clamped(min: clip_min_x, max: GLint(width_px))
    let clip_max_y = GLint((pixels_per_point * clip_rect.max.y).rounded())
        .clamped(min: clip_min_y, max: GLint(height_px))

    gl.scissor(
        x: clip_min_x, 
        y: clip_min_y, 
        width: clip_max_x - clip_min_x, 
        height:clip_max_y - clip_min_y 
    )
}

extension GLint {
    @inlinable
    func clamped(min: Self, max: Self) -> Self {
        if self < min {
            min
        } else if self > max {
            max
        } else {
            self
        }
    }
}