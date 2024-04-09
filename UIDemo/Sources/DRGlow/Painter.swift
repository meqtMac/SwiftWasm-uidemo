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

import ECMAScript


typealias GL = WebGL2RenderingContext

protocol TextureFilterExt {
    func glow_code() -> GLenum
}

extension TextureFilter: TextureFilterExt {
    func glow_code() -> GLenum {
        return switch self {
        case .linear:
            GL.LINEAR
        case .nearest:
            GL.NEAREST
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
            GL.CLAMP_TO_EDGE
        case .repeat:
            GL.REPEAT
        case .mirroredRepeat:
            GL.MIRRORED_REPEAT
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
    var f: (PaintCallbackInfo, borrowing Painter) -> Void
    
    public init(callback: consuming @escaping (PaintCallbackInfo, Painter) -> Void) {
        self.f = callback
    }
}

public struct Painter: ~Copyable {
    let gl: ArcGLowContext
    var maxTextureSide: Int
    var uSampler: WebGLUniformLocation
    var program: WebGLProgram
    var screenSize: WebGLUniformLocation
    var vao: VertexArrayObject
    var vbo: WebGLBuffer
    var elementArrayBuffer: WebGLBuffer
    var textures: Dictionary<TextureId, WebGLTexture>
    var nextNativeTexId: UInt64
    var texturesToDestory: [WebGLTexture]
    var destoryed: Bool
    
    public init(gl: WebGL2RenderingContext) {
        guard let version = gl.getParameter(pname: GL.VERSION).string,
              let renderer = gl.getParameter(pname: GL.RENDERER).string,
              let vendor = gl.getParameter(pname: GL.VENDOR).string,
              let shading_lang_version = gl.getParameter(pname: GL.SHADING_LANGUAGE_VERSION).string,
              let max_texture_side: Int = gl.getParameter(pname: GL.MAX_TEXTURE_SIZE).fromJSValue()
        else {
            fatalError("Can't get gl version")
        }
        
        debugPrint("""
        opengl version: \(version)
        opengl renderer: \(renderer)
        opengl vendor: \(vendor)
        shading language version: \(shading_lang_version)
        """)
        
        guard let vShader = gl.createShader(
            type: GL.VERTEX_SHADER,
            source: vertexShaderSource
        ),
              let fShader = gl.createShader(
                type: GL.FRAGMENT_SHADER,
                source: fragmentShaderSource
              ),
              let program = gl.linkProgram(
                vShader: vShader,
                fShader: fShader
              )
        else {
            fatalError("Failed to create or link shaders")
        }
        
        gl.detachShader(program: program, shader: vShader)
        gl.detachShader(program: program, shader: fShader)
        gl.deleteShader(shader: vShader)
        gl.deleteShader(shader: fShader)
        
        // self.program = program
        guard let uScreenSize = gl.getUniformLocation(program: program, name: uScreenSize) else {
            fatalError("Failed to get uScreenSize Location")
        }
        guard let u_sampler = gl.getUniformLocation(program: program, name: u_sampler_name) else {
            fatalError("Failed to get u_sampler Location")
        }
        
        guard let vbo = gl.createBuffer() else {
            fatalError("Failed to createBuffer")
        }
        
        let aPosLocations = gl.getAttribLocation(program: program, name: aPos)
        let acolorLocations = gl.getAttribLocation(program: program, name: attributeColor)
        let aTcLocations = gl.getAttribLocation(program: program, name: aTc)
        
        let stride = MemoryLayout<Vertex>.stride
        let bufferInfos: [BufferInfo] = [
            BufferInfo(
                location: GLuint(aPosLocations),
                vectorSize: 2,
                dataType: GL.FLOAT,
                normalized: false,
                stride: GLsizei(stride),
                offset: GLintptr(MemoryLayout<Vertex>.offset(of: \.pos)!)
            ),
            BufferInfo(
                location: GLuint(aTcLocations),
                vectorSize: 2,
                dataType: GL.FLOAT,
                normalized: false,
                stride: GLsizei(stride),
                offset: GLintptr(MemoryLayout<Vertex>.offset(of: \.uv)!)
            ),
            BufferInfo(
                location: GLuint(acolorLocations),
                vectorSize: 4,
                dataType: GL.UNSIGNED_BYTE,
                normalized: false,
                stride: GLsizei(stride),
                offset: GLintptr(MemoryLayout<Vertex>.offset(of: \.color)!)
            )
        ]
        
        let vao = VertexArrayObject(gl: gl, vbo: vbo, bufferInfos: bufferInfos)
        
        guard let elementArrayBuffer = gl.createBuffer() else {
            fatalError("Failed to createBuffer")
        }
        
        self.gl = gl
        self.maxTextureSide = max_texture_side
        self.program = program
        self.screenSize = uScreenSize
        self.uSampler = u_sampler
        self.vao = vao
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
        gl.enable(cap: GL.SCISSOR_TEST)
        // egui outputs mesh in both winding orders
        gl.disable(cap: GL.CULL_FACE)
        gl.disable(cap: GL.DEPTH_TEST)
        
        gl.colorMask(red: true, green: true, blue: true, alpha: true)
        
        gl.enable(cap: GL.BLEND)
        
        gl.blendEquationSeparate(
            modeRGB: GL.FUNC_ADD,
            modeAlpha: GL.FUNC_ADD
        )
        
        gl.blendFuncSeparate(
            // egui outputs colors with premultiplied alpha:
            srcRGB: GL.ONE,
            dstRGB: GL.ONE_MINUS_SRC_COLOR,
            // Less important, but this is technically the correct alpha blend function
            // when you want to make use of the framebuffer alpha (for screenshots, compositing, etc).
            srcAlpha: GL.ONE_MINUS_DST_ALPHA,
            dstAlpha: GL.ONE
        )
        
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
        gl.activeTexture(texture: GL.TEXTURE0)
        
        vao.bind(gl: gl)
        gl.bindBuffer(
            target: GL.ELEMENT_ARRAY_BUFFER,
            buffer: elementArrayBuffer
        )
    }
    
    public func clear(
        screen_size_in_pixels: (UInt32, UInt32),
        clear_color: (Float32, Float32, Float32, Float32)
    ) {
        DRGlow.clear(gl: self.gl, screen_size_in_pixels: screen_size_in_pixels, clear_color: clear_color)
    }
    
    /// You are expected to have cleared the color buffer before calling this.
    public mutating func paint_and_update_textures(
        screen_size_px: (UInt32, UInt32),
        pixels_per_point: Float32,
        clipped_primitives: [ClippedPrimitive],
        textures_delta: TexturesDelta
    ) {
        
        for (id, image_delta) in textures_delta.set {
            self.set_texture(tex_id: id, delta: image_delta);
        }
        
        self.paint_primitives(screen_size_px: screen_size_px, pixels_per_point: pixels_per_point, clipped_primitives: clipped_primitives)
        
        for id in textures_delta.free {
            self.free_texture(tex_id: id)
        }
    }
    
    /// Main entry-point for painting a frame.
    ///
    /// You should call `target.clear_color(..)` before
    /// and `target.finish()` after this.
    ///
    /// The following OpenGL features will be set:
    /// - Scissor test will be enabled
    /// - Cull face will be disabled
    /// - Blend will be enabled
    ///
    /// The scissor area and blend parameters will be changed.
    ///
    /// As well as this, the following objects will be unset:
    /// - Vertex Buffer
    /// - Element Buffer
    /// - Texture (and active texture will be set to 0)
    /// - Program
    ///
    /// Please be mindful of these effects when integrating into your program, and also be mindful
    /// of the effects your program might have on this code. Look at the source if in doubt.
    public mutating func paint_primitives(
        screen_size_px: (UInt32, UInt32),
        pixels_per_point: Float32,
        clipped_primitives: [ClippedPrimitive]
    ) {
        self.assert_not_destroyed();
        
        self.preparePaint(
            widthInPixels: screen_size_px.0,
            heightInPixels: screen_size_px.1,
            pixelsPerPoint: pixels_per_point
        )
        
        for clipped_primitive in clipped_primitives {
            let clip_rect = clipped_primitive.clip_rect
            let primitive = clipped_primitive.primitive
            set_clip_rect(gl: self.gl, width_px: screen_size_px.0, height_px: screen_size_px.1, pixels_per_point: pixels_per_point, clip_rect: clip_rect)
            
            switch primitive {
            case let .mesh(mesh):
                self.paint_mesh(mesh: mesh);
            case let .callback(callback):
                if callback.rect.isPositive() {
                    let info = PaintCallbackInfo(
                        viewport: callback.rect,
                        clip_rect: clip_rect,
                        pixels_per_point: pixels_per_point,
                        screen_size_px: screen_size_px
                    )
                    
                    let viewport_px = info.viewport_in_pixels();
                    self.gl.viewport(x: GLint(viewport_px.left_px), y: GLint(viewport_px.from_bottom_px), width: GLint(viewport_px.width_px), height: GLint(viewport_px.height_px))
                    
                    if let callback = callback.callback as? RcCallBackFn {
                        callback.f(info, self)
                    } else {
                        console.warn(data: "Warning: Unsupported render callback. Expected egui_glow::CallbackFn");
                    }
                    
                    
                    self.preparePaint(widthInPixels: screen_size_px.0, heightInPixels: screen_size_px.1, pixelsPerPoint: pixels_per_point)
                }
            }
        }
        
        self.vao.unbind(gl: self.gl)
        self.gl.bindBuffer(target: GL.ELEMENT_ARRAY_BUFFER, buffer: nil)
        
        self.gl.disable(cap: GL.SCISSOR_TEST)
    }
    
    @inline(never)
    mutating func paint_mesh(mesh: Mesh) {
        if let texture = self.texture(texture_id: mesh.texture_id) {
            self.gl.bindBuffer(target: GL.ARRAY_BUFFER, buffer: self.vbo)
            self.gl.bufferData(
                target: GL.ARRAY_BUFFER,
                srcData: .arrayBufferView(mesh.vertices.jsu8View()),
                usage: GL.STREAM_DRAW
            )
            
            self.gl.bindBuffer(target: GL.ELEMENT_ARRAY_BUFFER, buffer: self.elementArrayBuffer)
            self.gl.bufferData(
                target: GL.ELEMENT_ARRAY_BUFFER,
                srcData: .arrayBufferView(mesh.indices.jsu8View()),
                usage: GL.STREAM_DRAW
            )
            
            self.gl.bindTexture(target: GL.TEXTURE_2D, texture: texture)
            self.gl.drawElements(mode: GL.TRIANGLES, count: GLsizei(mesh.indices.count), type: GL.UNSIGNED_INT, offset: 0)
        } else {
            console.warn(data: "Failed to find texture \(mesh.texture_id)".jsValue)
            
        }
        
    }
    
    
    
    public mutating func set_texture(tex_id: TextureId, delta: ImageDelta) {
        self.assert_not_destroyed();
        
        let glow_texture = self.textures[tex_id, default: gl.createTexture()!]
        gl.bindTexture(target: GL.TEXTURE_2D, texture: glow_texture)
        
        switch delta.image {
        case let .color(image):
            assert(
                image.pixels.count == image.size.0 * image.size.1 ,
                "Mismatch between texture size and texel count"
            )
            let data = image.pixels.withUnsafeBytes { Array($0) }
            self.upload_texture_srgb(
                pos: delta.pos,
                w: image.size.0,
                h: image.size.1,
                options: delta.options,
                data: data)
        case let .font(image):
            assert(image.width * image.height == image.pixels.count, "Mismatch between texture size and texel count")
            // TODO: implementaion
        }
    }
    
    
    
    internal mutating func upload_texture_srgb(
        pos: (Int, Int)?,
        w: Int,
        h: Int,
        options: TextureOptions,
        data: [UInt8]
    ) {
        assert(data.count == w * h * 4);
        assert(
            w <= self.maxTextureSide && h <= self.maxTextureSide,
            "Got a texture image of size \(w)x\(h), but the maximum supported texture side is only \(self.maxTextureSide)"
        );
        
        
        self.gl.texParameteri(
            target: GL.TEXTURE_2D,
            pname: GL.TEXTURE_MAG_FILTER,
            param: GLint(options.magnification.glow_code())
        )
        self.gl.texParameteri(
            target: GL.TEXTURE_2D,
            pname: GL.TEXTURE_MIN_FILTER,
            param: GLint(options.minification.glow_code())
        )
        self.gl.texParameteri(
            target: GL.TEXTURE_2D,
            pname: GL.TEXTURE_WRAP_S,
            param: GLint(options.wrapMode.glow_code())
        )
        self.gl.texParameteri(
            target: GL.TEXTURE_2D,
            pname: GL.TEXTURE_WRAP_T,
            param: GLint(options.wrapMode.glow_code())
        )
        
        let internal_format: GLenum = GL.SRGB8_ALPHA8
        let scr_format: GLenum = GL.RGBA
        
        self.gl.pixelStorei(pname: GL.UNPACK_ALIGNMENT, param: 1)
        
        let level: GLint = 0;
        if let (x, y) = pos {
            self.gl.texSubImage2D(
                target: GL.TEXTURE_2D,
                level: level,
                xoffset: GLint(x),
                yoffset: GLint(y),
                width: GLsizei(w),
                height: GLsizei(h),
                format: scr_format,
                type: GL.UNSIGNED_BYTE,
                pixels: data.jsu8View())
            
            console.log(data: gl.getError().jsValue)
        } else {
            let border: GLint = 0;
            self.gl.texImage2D(
                target: GL.TEXTURE_2D,
                level: level,
                internalformat: GLint(internal_format),
                width: GLsizei(w),
                height: GLsizei(h),
                border: border,
                format: scr_format,
                type: GL.UNSIGNED_BYTE,
                pixels: data.jsu8View())
        }
    }
    
    public mutating func free_texture(tex_id: TextureId) {
        if let old_text = self.textures[tex_id] {
            self.gl.deleteTexture(texture: old_text)
        }
        self.textures.removeValue(forKey: tex_id)
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
        //        var pixels = [UInt8](repeating: 0, count:  Int(w * h * 4) )
        let dataView = ArrayBufferView.uint8Array(.init(length: Int(w * h) * 4))
        self.gl.readPixels(
            x: 0,
            y: 0,
            width: GLsizei(w),
            height: GLsizei(h),
            format: GL.RGBA,
            type: GL.UNSIGNED_BYTE,
            dstData: dataView
        )
        guard case let .uint8Array(uint8Array) = dataView else {
            fatalError()
        }
        let flipped: [Color32] = .init(unsafeUninitializedCapacity: Int(w * h)) { buffer, initializedCount in
            uint8Array.withUnsafeBytes { pixelPtr in
                for i in 0..<Int(h) {
                    // Calculate start index of current row in flipped array
                    let startIndex = (Int(h) - 1 - i) * Int(w) * 4
                    let colorStartIndex = i * Int(w)
                    // Copy pixels of current row into flipped array
                    let sourceIndex = i * Int(w) * 4
                    for x in 0..<Int(w) {
                        buffer[colorStartIndex] = Color32(
                            r: pixelPtr[startIndex + 0],
                            g: pixelPtr[startIndex + 1],
                            b: pixelPtr[startIndex + 2],
                            a: pixelPtr[startIndex + 3]
                        )
                    }
                }
            }
            
            initializedCount = Int(w * h)
        }
        
        return ColorImage(size: (Int(w),Int(h)), pixels: flipped)
    }
    
    
    public func read_screen_rgb(w: UInt32, h: UInt32) -> [UInt8] {
        let dataView = ArrayBufferView.uint8Array(.init(length: Int(w * h) * 3))
        
        //  FIXME: load pixel
        self.gl.readPixels(
            x: 0,
            y: 0,
            width: GLsizei(w),
            height: GLsizei(h),
            format: GL.RGB,
            type: GL.UNSIGNED_BYTE,
            dstData: dataView
        )
        //        return pixels
        guard case let .uint8Array(uint8Array) = dataView else {
            fatalError()
        }
        
        return uint8Array.withUnsafeBytes { ptr in
            Array(ptr)
        }
        
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

extension GL {
    func createShader(type: GLenum, source: String) -> WebGLShader? {
        guard let shader = createShader(type: type) else { return nil }
        
        shaderSource(shader: shader, source: source)
        compileShader(shader: shader)
        
        switch getShaderParameter(shader: shader, pname: GL.COMPILE_STATUS) {
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
        
        switch getProgramParameter(program: program, pname: GL.LINK_STATUS) {
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

fileprivate func clear(gl: ArcGLowContext, screen_size_in_pixels: (UInt32, UInt32), clear_color: (Float32, Float32, Float32, Float32)) {
    // gl.disable(glow::SCISSOR_TEST);
    gl.disable(cap: GL.SCISSOR_TEST)
    
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
    gl.clear(mask: GL.COLOR_BUFFER_BIT)
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

extension Array {
    func jsu8View() -> ArrayBufferView {
        let bytes = self.withUnsafeBytes { Array<UInt8>($0) }
        return ArrayBufferView.uint8Array(Uint8Array(bytes))
    }
}

extension Array where Element == UInt8 {
    func jsu8View() -> ArrayBufferView {
        return ArrayBufferView.uint8Array(Uint8Array(self))
    }
}
