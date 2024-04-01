//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

import Foundation

import WebGL1
import WebGL2

public struct Painter {
    public let gl: WebGL2RenderingContext
    //    var maxTextureSide
    //    var uSampler
    //    var srgbTextures
    var supportsSrgbFrameBuffer: Bool = false
    var program: WebGLProgram
    var screenSize: WebGLUniformLocation
    var vao: VertexArrayObject
    var vbo: WebGLBuffer
    var elementArrayBuffer: WebGLBuffer
    //    var textures
    //    var nextNativeTexId
    //    var texturesToDestory
    //    var destoryed
    
    public init?(gl: WebGL2RenderingContext) {
        self.gl = gl
        //        self.program = program
        //        self.screenSize = screenSize
        //        self.vao = vao
        //        self.vbo = vbo
        //        self.elementArrayBuffer = elementArrayBuffer
        //        let
        guard let vShader = gl.createShader(type: .VERTEX_SHADER, source: vertexShaderSource),
              let fShader = gl.createShader(type: .FRAGMENT_SHADER, source: fragmentShaderSource),
              let program = gl.linkProgram(vShader: vShader, fShader: fShader)
        else {
            console.error(data: "Failed to create or link shaders")
            return nil
        }
        
        gl.detachShader(program: program, shader: vShader)
        gl.detachShader(program: program, shader: fShader)
        gl.deleteShader(shader: vShader)
        gl.deleteShader(shader: fShader)
        
        self.program = program
        
        guard let uScreenSize = gl.getUniformLocation(program: program, name: uScreenSize) else {
            console.error(data: "Failed to get uScreenSize Location")
            return nil
        }
        
        self.screenSize = uScreenSize
        guard let vbo = gl.createBuffer() else {
            console.error(data: "Failed to createBuffer")
            return nil
        }
        self.vbo = vbo
        
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
        self.vao = vao

        guard let elementArrayBuffer = gl.createBuffer() else {
                        console.error(data: "Failed to createBuffer")
            return nil
        }
        self.elementArrayBuffer = elementArrayBuffer
        
    }
    
    mutating private func preparePaint(widthInPixels: UInt32, heightInPixels: UInt32, pixelsPerPoint: Float32) {
        gl.enable(cap: .SCISSOR_TEST)
        // egui outputs mesh in both winding orders
        gl.enable(cap: .CULL_FACE)
        gl.enable(cap: .DEPTH_TEST)
        
        gl.colorMask(red: true, green: true, blue: true, alpha: true)
        
        gl.enable(cap: .BLEND)
        
        gl.blendEquationSeparate(
            modeRGB: .FUNC_ADD,
            modeAlpha: .FUNC_ADD
        )
        
        gl.blendFuncSeparate(
            srcRGB: .ONE,
            dstRGB: .ONE_MINUS_SRC_COLOR,
            srcAlpha: .ONE_MINUS_DST_ALPHA,
            dstAlpha: .ONE
        )
        
        // determine whether support srgb framebuffer
//        if supportsSrgbFrameBuffer {
//            gl.disable(cap: .FRAMEBUFFER_BINDING)
//        }
        let width_in_points = Float32(widthInPixels) / pixelsPerPoint;
        let height_in_points = Float32(heightInPixels) / pixelsPerPoint;
        gl.viewport(x: 0, y: 0, width: GLsizei(widthInPixels), height: GLsizei(heightInPixels))
        gl.useProgram(program: program)
        
        gl.uniform2f(location: screenSize, x: GLfloat(width_in_points), y: GLfloat(height_in_points))

        vao.bind(gl: gl)
        gl.bindBuffer(target: .ELEMENT_ARRAY_BUFFER, buffer: elementArrayBuffer)
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

fileprivate let uScreenSize = "u_screen_size"
fileprivate let aPos = "a_pos"
fileprivate let attributeColor = "a_srgba"
fileprivate let aTc = "a_tc"


fileprivate let vertexShaderSource =
"""
#version 300 es
  
precision mediump float;

// an attribute is an input (in) to a vertex shader.
// It will receive data from a buffer
uniform vec2 \(uScreenSize);
in vec2 \(aPos);
in vec4 \(attributeColor);
in vec2 \(aTc);
out vec4 v_rgba_in_gamma;
out vec2 v_tc;


// all shaders have a main function
void main() {
    // gl_Position is a special variable a vertex shader
    // is responsible for setting
    gl_Position = vec4(
                      2.0 * \(aPos).x / \(uScreenSize).x - 1.0,
                      1.0 - 2.0 * \(aPos).y / \(uScreenSize).y,
                      0.0,
                      1.0);
    v_rgba_in_gamma = a_srgba / 255.0;
    v_tc = a_tc;
}
"""

fileprivate let fragmentShaderSource =
"""
#version 300 es
  
// fragment shaders don't have a default precision so we need
// to pick one. highp is a good default. It means "high precision"
//precision highp float;
precision mediump float;


  
// we need to declare an output for the fragment shader
in vec4 v_rgba_in_gamma;
in vec2 v_tc;
//out vec4 f_color;
 
out vec4 outColor;

// 0-1 sRGB gamma  from  0-1 linear
vec3 srgb_gamma_from_linear(vec3 rgb) {
    bvec3 cutoff = lessThan(rgb, vec3(0.0031308));
    vec3 lower = rgb * vec3(12.92);
    vec3 higher = vec3(1.055) * pow(rgb, vec3(1.0 / 2.4)) - vec3(0.055);
    return mix(higher, lower, vec3(cutoff));
}

// 0-1 sRGBA gamma  from  0-1 linear
vec4 srgba_gamma_from_linear(vec4 rgba) {
    return vec4(srgb_gamma_from_linear(rgba.rgb), rgba.a);
}


  
void main() {
    // Just set the output to a constant redish-purple
    outColor = vec4(1, 0, 0, 1);
}
"""

