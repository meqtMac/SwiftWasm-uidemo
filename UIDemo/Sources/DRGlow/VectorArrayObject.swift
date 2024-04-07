//
//  VectorArrayObject.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

// This is for WebGL 2.0 only

// import Foundation

import DOM
import JavaScriptKit

import WebGL1
import WebGL2

public struct BufferInfo {
    var location: GLuint // Attribute location in the shader
    var vectorSize:  GLint // Number of components (e.g., 3 for vec3)
    var dataType: GLenum // Data type (e.g., .float32)
    var normalized: GLboolean
    let stride: GLsizei // Distance between consecutive elements
    let offset: GLintptr // Offset from the beginning of the buffer
}

public struct VertexArrayObject {
    // let vao: WebGLVertexArrayObject
    let vao: WebGLVertexArrayObject
    let vbo: WebGLBuffer // Vertex buffer object
    let bufferInfos: [BufferInfo]
    
    init(gl: WebGL2RenderingContext, vbo: WebGLBuffer, bufferInfos: [BufferInfo]) {
        guard let vao = gl.createVertexArray() else {
            fatalError("vertex array not supported")
        }

        // TODO: check for error
        gl.bindVertexArray(array: vao)
        gl.bindBuffer(target: .ARRAY_BUFFER, buffer: vbo)
        
        for attribute in bufferInfos {
            gl.vertexAttribPointer(
                index: attribute.location,
                size: attribute.vectorSize,
                type: attribute.dataType,
                normalized: attribute.normalized,
                stride: attribute.stride,
                offset: attribute.offset
            )
            // TODO: check gl error
            gl.enableVertexAttribArray(index: attribute.location)
        }
        
        gl.bindVertexArray(array: nil)
        self.vao = vao
        self.vbo = vbo
        self.bufferInfos = bufferInfos
    }
    
    func bind(gl: WebGL2RenderingContext) {
        gl.bindVertexArray(array: vao)
    }
    
    func unbind(gl: WebGL2RenderingContext) {
        gl.bindVertexArray(array: nil)
    }
}

fileprivate func supports_vao(gl: WebGL2RenderingContext) -> Bool {
    return true
}