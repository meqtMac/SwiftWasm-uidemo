//
//  VectorArrayObject.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

import Foundation

import DOM
import JavaScriptKit
import WebAPIBase

import WebGL1
import WebGL2

struct BufferInfo {
    let location: GLuint // Attribute location in the shader
    let vectorSize:  GLint // Number of components (e.g., 3 for vec3)
    let dataType: GLenum // Data type (e.g., .float32)
    let normalized: GLboolean
    let stride: GLsizei // Distance between consecutive elements
    let offset: GLintptr // Offset from the beginning of the buffer
}

class VertexArrayObject {
    
    private let vao: WebGLVertexArrayObject? // Metal vertex descriptor
    private let vbo: WebGLBuffer // Vertex buffer object
    private let bufferInfos: [BufferInfo]
    
    init(gl: WebGL2RenderingContext, vbo: WebGLBuffer, bufferInfos: [BufferInfo]) {
        let vao = gl.createVertexArray()
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
        if let vao {
            gl.bindVertexArray(array: vao)
            // TODO: check gl error
        } else {
            gl.bindBuffer(target: .ARRAY_BUFFER, buffer: vbo)
            // TODO: check gl error
            
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
            
        }
    }
    
    func unbind(gl: WebGL2RenderingContext) {
        if let vao {
            gl.bindVertexArray(array: nil)
        } else {
            gl.bindBuffer(target: .ARRAY_BUFFER, buffer: nil)
            for attribute in bufferInfos {
                gl.disableVertexAttribArray(index: attribute.location)
            }
        }
    }
    
}
