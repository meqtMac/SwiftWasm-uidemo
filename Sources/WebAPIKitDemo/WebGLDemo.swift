// Copyright 2021-2022, GFXFundamentals and WebAPIKit contributors.
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//     * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//     * Neither the name of GFXFundamentals. nor the names of his
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import DOM
import WebAPIBase
import WebGL1
import WebGL2

let vertexShaderSource =
"""
#version 300 es
  
// an attribute is an input (in) to a vertex shader.
// It will receive data from a buffer
in vec4 a_position;
  
// all shaders have a main function
void main() {
    // gl_Position is a special variable a vertex shader
    // is responsible for setting
    gl_Position = a_position;
}
"""

let fragmentShaderSource =
"""
#version 300 es
  
// fragment shaders don't have a default precision so we need
// to pick one. highp is a good default. It means "high precision"
precision highp float;
  
// we need to declare an output for the fragment shader
out vec4 outColor;
  
void main() {
    // Just set the output to a constant redish-purple
    outColor = vec4(1, 0, 0, 1);
}
"""

struct WebGLDemo: HTMDSL {
    let element: HTMLElement
    
    init(parent: HTMLElement) {
        let button = Button(title: "WebGL") {
            parent.removeChilds()
            let canvas = Canvas(width: 800, height: 800)
            _ = parent.jsValue.appendChild(canvas.element.jsValue)
            
            guard let gl = canvas.element.getContext(WebGL2RenderingContext.self) else {
                console.error(data: "Failed to create WebGL2 rendering context")
                return
            }
            
            guard let vShader = gl.createShader(type: .VERTEX_SHADER, source: vertexShaderSource),
                  let fShader = gl.createShader(type: .FRAGMENT_SHADER, source: fragmentShaderSource),
                  let program = gl.createProgram(vShader: vShader, fShader: fShader)
            else {
                console.error(data: "Failed to create or link shaders")
                return
            }
            
            // look up where the vertex data needs to go.
            let positionAttributeLocation = GLuint(gl.getAttribLocation(program: program, name: "a_position"))
            
            // Create a buffer and put three 2d clip space points in it
            let positionBuffer = gl.createBuffer()
            
            // Bind it to ARRAY_BUFFER (think of it as ARRAY_BUFFER = positionBuffer)
            let sourceData: [GLfloat] = 
            [0.0, 0.0,
             0.0, 0.5,
             0.5, 0.0,
             0.0, 0.5,
             0.5, 0.0,
             0.5, 0.5]
            gl.bindBuffer(target: .ARRAY_BUFFER, buffer: positionBuffer)
            gl.bufferData(
                target: .ARRAY_BUFFER,
                srcData: sourceData,
                usage: .STATIC_DRAW
            )
            
            // Create a vertex array object (attribute state)
            guard let vao = gl.createVertexArray() else {
                console.error(data: "Failed to create VAO")
                return
            }
            
            // and make it the one we're currently working with
            gl.bindVertexArray(array: vao)
            
            // Turn on the attribute
            gl.enableVertexAttribArray(index: positionAttributeLocation)
            
            gl.vertexAttribPointer(
                index: positionAttributeLocation,
                size: 2, // 2 components per iteration
                type: .FLOAT, // the data is 32bit floats
                normalized: false, // don't normalize the data
                stride: 0, // 0 = move forward size * sizeof(type) each iteration to get the next position
                offset: 0 // start at the beginning of the buffer
            )
            
            // Tell WebGL how to convert from clip space to pixels
            gl.viewport(x: 0, 
                        y: 0,
                        width: GLsizei(canvas.element.width),
                        height: GLsizei(canvas.element.height)
            )
            
            // Clear the canvas
            gl.clearColor(red: 0, 
                          green: 1,
                          blue: 0,
                          alpha: 1)
            gl.clear(mask: .COLOR_BUFFER_BIT)
            
            // Tell it to use our program (pair of shaders)
            gl.useProgram(program: program)
            
            // Bind the attribute/buffer set we want.
            gl.bindVertexArray(array: vao)
            
            // draw
            gl.drawArrays(mode: .TRIANGLES, first: 0, count: 6)
        }
        
        self.element = button.element
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
    
    func createProgram(vShader: WebGLShader, fShader: WebGLShader) -> WebGLProgram? {
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

extension HTMLCanvasElement {
    func resizeToDisplaySize() {
        if (width != UInt32(clientWidth)) {
            width = UInt32(clientWidth)
        }
        
        if (height != UInt32(clientHeight)) {
            height = UInt32(clientHeight)
        }
        
    }
}
