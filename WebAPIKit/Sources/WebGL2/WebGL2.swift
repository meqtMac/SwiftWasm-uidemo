import DOM
import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAnimations
import WebAPIBase
import WebGL1

public typealias GLint64 = Int64
public typealias GLuint64 = UInt64

public class WebGL2RenderingContext: JSBridgedClass, 
                                        WebGLRenderingContextBase,
                                        WebGL2RenderingContextBase,
                                        WebGL2RenderingContextOverloads {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.WebGL2RenderingContext].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
}

public protocol WebGL2RenderingContextBase: JSBridgedClass {}
public extension WebGL2RenderingContextBase {
    @inlinable func copyBufferSubData(readTarget: GLenum, writeTarget: GLenum, readOffset: GLintptr, writeOffset: GLintptr, size: GLsizeiptr) {
        let this = jsObject
        _ = this[.copyBufferSubData].function!(this: this, arguments: [_toJSValue(readTarget), _toJSValue(writeTarget), _toJSValue(readOffset), _toJSValue(writeOffset), _toJSValue(size)])
    }

    @inlinable func getBufferSubData(target: GLenum, srcByteOffset: GLintptr, dstBuffer: [some TypedArrayElement], dstOffset: GLuint? = nil, length: GLuint? = nil) {
        let this = jsObject
        _ = this[.getBufferSubData].function!(this: this, arguments: [_toJSValue(target), _toJSValue(srcByteOffset), JSTypedArray(dstBuffer).arrayBuffer.jsValue, _toJSValue(dstOffset), _toJSValue(length)])
    }

    @inlinable func blitFramebuffer(srcX0: GLint, srcY0: GLint, srcX1: GLint, srcY1: GLint, dstX0: GLint, dstY0: GLint, dstX1: GLint, dstY1: GLint, mask: GLbitfield, filter: GLenum) {
        let this = jsObject
        _ = this[.blitFramebuffer].function!(this: this, arguments: [_toJSValue(srcX0), _toJSValue(srcY0), _toJSValue(srcX1), _toJSValue(srcY1), _toJSValue(dstX0), _toJSValue(dstY0), _toJSValue(dstX1), _toJSValue(dstY1), _toJSValue(mask), _toJSValue(filter)])
    }

    @inlinable func framebufferTextureLayer(target: GLenum, attachment: GLenum, texture: WebGLTexture?, level: GLint, layer: GLint) {
        let this = jsObject
        _ = this[.framebufferTextureLayer].function!(this: this, arguments: [_toJSValue(target), _toJSValue(attachment), _toJSValue(texture), _toJSValue(level), _toJSValue(layer)])
    }

    @inlinable func invalidateFramebuffer(target: GLenum, attachments: [GLenum]) {
        let this = jsObject
        _ = this[.invalidateFramebuffer].function!(this: this, arguments: [_toJSValue(target), _toJSValue(attachments)])
    }

    @inlinable func invalidateSubFramebuffer(target: GLenum, attachments: [GLenum], x: GLint, y: GLint, width: GLsizei, height: GLsizei) {
        let this = jsObject
        _ = this[.invalidateSubFramebuffer].function!(this: this, arguments: [_toJSValue(target), _toJSValue(attachments), _toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height)])
    }

    @inlinable func readBuffer(src: GLenum) {
        let this = jsObject
        _ = this[.readBuffer].function!(this: this, arguments: [_toJSValue(src)])
    }

    @inlinable func getInternalformatParameter(target: GLenum, internalformat: GLenum, pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getInternalformatParameter].function!(this: this, arguments: [_toJSValue(target), _toJSValue(internalformat), _toJSValue(pname)]).fromJSValue()!
    }

    @inlinable func renderbufferStorageMultisample(target: GLenum, samples: GLsizei, internalformat: GLenum, width: GLsizei, height: GLsizei) {
        let this = jsObject
        _ = this[.renderbufferStorageMultisample].function!(this: this, arguments: [_toJSValue(target), _toJSValue(samples), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height)])
    }

    @inlinable func texStorage2D(target: GLenum, levels: GLsizei, internalformat: GLenum, width: GLsizei, height: GLsizei) {
        let this = jsObject
        _ = this[.texStorage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(levels), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height)])
    }

    @inlinable func texStorage3D(target: GLenum, levels: GLsizei, internalformat: GLenum, width: GLsizei, height: GLsizei, depth: GLsizei) {
        let this = jsObject
        _ = this[.texStorage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(levels), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth)])
    }

    @inlinable func texImage3D(target: GLenum, 
                               level: GLint,
                               internalformat: GLint,
                               width: GLsizei,
                               height: GLsizei,
                               depth: GLsizei,
                               border: GLint,
                               format: GLenum,
                               type: GLenum,
                               pboOffset: GLintptr) {
        let this = jsObject
        _ = this[.texImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(pboOffset)])
    }

   @inlinable func texImage3D(target: GLenum,
                                level: GLint,
                                internalformat: GLint,
                                width: GLsizei,
                                height: GLsizei,
                                depth: GLsizei,
                                border: GLint,
                                format: GLenum,
                                type: GLenum,
                                source: HTMLCanvasElement) {
         let this = jsObject
         _ = this[.texImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
     }


    @inlinable func texImage3D(target: GLenum,
                                level: GLint,
                                internalformat: GLint,
                                width: GLsizei,
                                height: GLsizei,
                                depth: GLsizei,
                                border: GLint,
                                format: GLenum,
                                type: GLenum,
                                source: HTMLImageElement) {
         let this = jsObject
         _ = this[.texImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
     }


    @inlinable func texImage3D(target: GLenum,
                                level: GLint,
                                internalformat: GLint,
                                width: GLsizei,
                                height: GLsizei,
                                depth: GLsizei,
                                border: GLint,
                                format: GLenum,
                                type: GLenum,
                                source: HTMLVideoElement) {
         let this = jsObject
         _ = this[.texImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
     }


    @inlinable func texImage3D(target: GLenum,
                                level: GLint,
                                internalformat: GLint,
                                width: GLsizei,
                                height: GLsizei,
                                depth: GLsizei,
                                border: GLint,
                                format: GLenum,
                                type: GLenum,
                                source: ImageBitmap) {
         let this = jsObject
         _ = this[.texImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
     }


    @inlinable func texImage3D(target: GLenum,
                                level: GLint,
                                internalformat: GLint,
                                width: GLsizei,
                                height: GLsizei,
                                depth: GLsizei,
                                border: GLint,
                                format: GLenum,
                                type: GLenum,
                                source: ImageData) {
         let this = jsObject
         _ = this[.texImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
     }


    @inlinable func texImage3D(target: GLenum,
                                level: GLint,
                                internalformat: GLint,
                                width: GLsizei,
                                height: GLsizei,
                                depth: GLsizei,
                                border: GLint,
                                format: GLenum,
                                type: GLenum,
                                source: OffscreenCanvas) {
         let this = jsObject
         _ = this[.texImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
     }


    @inlinable func texImage3D(target: GLenum,
                                level: GLint,
                                internalformat: GLint,
                                width: GLsizei,
                                height: GLsizei,
                                depth: GLsizei,
                                border: GLint,
                                format: GLenum,
                                type: GLenum,
                                source: VideoFrame) {
         let this = jsObject
         _ = this[.texImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
     }

    @inlinable func texImage3D(target: GLenum, level: GLint, internalformat: GLint, width: GLsizei, height: GLsizei, depth: GLsizei, border: GLint, format: GLenum, type: GLenum, srcData: [some TypedArrayElement]) {
        let this = jsObject
        _ = this[.texImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(border), _toJSValue(format), _toJSValue(type), JSTypedArray(srcData).arrayBuffer.jsValue])
    }


   
    @inlinable func texImage3D(target: GLenum, level: GLint, internalformat: GLint, width: GLsizei, height: GLsizei, depth: GLsizei, border: GLint, format: GLenum, type: GLenum, srcData: [some TypedArrayElement], srcOffset: GLuint) {
        let this = jsObject
        _ = this[.texImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(border), _toJSValue(format), _toJSValue(type), JSTypedArray(srcData).arrayBuffer.jsValue, _toJSValue(srcOffset)])
    }
 
    @inlinable func texSubImage3D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, zoffset: GLint, width: GLsizei, height: GLsizei, depth: GLsizei, format: GLenum, type: GLenum, pboOffset: GLintptr) {
        let this = jsObject
        _ = this[.texSubImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(zoffset), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(format), _toJSValue(type), _toJSValue(pboOffset)])
    }

   @inlinable func texSubImage3D(target: GLenum,
                                 level: GLint,
                                 xoffset: GLint,
                                 yoffset: GLint,
                                 zoffset: GLint,
                                 width: GLsizei,
                                 height: GLsizei,
                                 depth: GLsizei,
                                 format: GLenum,
                                 type: GLenum,
                                 source: HTMLCanvasElement) {
       let this = jsObject
       _ = this[.texSubImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(zoffset), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
   }
    
    @inlinable func texSubImage3D(target: GLenum,
                                 level: GLint,
                                 xoffset: GLint,
                                 yoffset: GLint,
                                 zoffset: GLint,
                                 width: GLsizei,
                                 height: GLsizei,
                                 depth: GLsizei,
                                 format: GLenum,
                                 type: GLenum,
                                 source: HTMLImageElement) {
       let this = jsObject
       _ = this[.texSubImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(zoffset), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
   }
    
    @inlinable func texSubImage3D(target: GLenum,
                                 level: GLint,
                                 xoffset: GLint,
                                 yoffset: GLint,
                                 zoffset: GLint,
                                 width: GLsizei,
                                 height: GLsizei,
                                 depth: GLsizei,
                                 format: GLenum,
                                 type: GLenum,
                                 source: HTMLVideoElement) {
       let this = jsObject
       _ = this[.texSubImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(zoffset), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
   }
    
    @inlinable func texSubImage3D(target: GLenum,
                                 level: GLint,
                                 xoffset: GLint,
                                 yoffset: GLint,
                                 zoffset: GLint,
                                 width: GLsizei,
                                 height: GLsizei,
                                 depth: GLsizei,
                                 format: GLenum,
                                 type: GLenum,
                                 source: ImageBitmap) {
       let this = jsObject
       _ = this[.texSubImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(zoffset), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
   }
    
    @inlinable func texSubImage3D(target: GLenum,
                                 level: GLint,
                                 xoffset: GLint,
                                 yoffset: GLint,
                                 zoffset: GLint,
                                 width: GLsizei,
                                 height: GLsizei,
                                 depth: GLsizei,
                                 format: GLenum,
                                 type: GLenum,
                                 source: ImageData) {
       let this = jsObject
       _ = this[.texSubImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(zoffset), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
   }
    
    @inlinable func texSubImage3D(target: GLenum,
                                 level: GLint,
                                 xoffset: GLint,
                                 yoffset: GLint,
                                 zoffset: GLint,
                                 width: GLsizei,
                                 height: GLsizei,
                                 depth: GLsizei,
                                 format: GLenum,
                                 type: GLenum,
                                 source: OffscreenCanvas) {
       let this = jsObject
       _ = this[.texSubImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(zoffset), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
   }
    
    @inlinable func texSubImage3D(target: GLenum,
                                 level: GLint,
                                 xoffset: GLint,
                                 yoffset: GLint,
                                 zoffset: GLint,
                                 width: GLsizei,
                                 height: GLsizei,
                                 depth: GLsizei,
                                 format: GLenum,
                                 type: GLenum,
                                 source: VideoFrame) {
       let this = jsObject
       _ = this[.texSubImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(zoffset), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
   }
    @inlinable func texSubImage3D(target: GLenum, 
                                  level: GLint,
                                  xoffset: GLint,
                                  yoffset: GLint,
                                  zoffset: GLint,
                                  width: GLsizei,
                                  height: GLsizei,
                                  depth: GLsizei,
                                  format: GLenum, 
                                  type: GLenum,
                                  srcData: [some TypedArrayElement],
                                  srcOffset: GLuint? = nil) {
        let this = jsObject
        _ = this[.texSubImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(zoffset), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(format), _toJSValue(type), JSTypedArray(srcData).arrayBuffer.jsValue, _toJSValue(srcOffset)])
    }

    @inlinable func copyTexSubImage3D(target: GLenum, 
                                      level: GLint,
                                      xoffset: GLint,
                                      yoffset: GLint,
                                      zoffset: GLint,
                                      x: GLint,
                                      y: GLint,
                                      width: GLsizei,
                                      height: GLsizei) {
        let this = jsObject
        _ = this[.copyTexSubImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(zoffset), _toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height)])
    }

    @inlinable func compressedTexImage3D(target: GLenum, 
                                         level: GLint,
                                         internalformat: GLenum,
                                         width: GLsizei,
                                         height: GLsizei,
                                         depth: GLsizei,
                                         border: GLint,
                                         imageSize: GLsizei,
                                         offset: GLintptr) {
        let this = jsObject
        _ = this[.compressedTexImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(border), _toJSValue(imageSize), _toJSValue(offset)])
    }

    @inlinable func compressedTexImage3D(target: GLenum, 
                                         level: GLint,
                                         internalformat: GLenum,
                                         width: GLsizei,
                                         height: GLsizei,
                                         depth: GLsizei,
                                         border: GLint,
                                         srcData: [some TypedArrayElement],
                                         srcOffset: GLuint? = nil,
                                         srcLengthOverride: GLuint? = nil) {
        let this = jsObject
        _ = this[.compressedTexImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(border), JSTypedArray(srcData).arrayBuffer.jsValue, _toJSValue(srcOffset), _toJSValue(srcLengthOverride)])
    }

    @inlinable func compressedTexSubImage3D(target: GLenum, 
                                            level: GLint,
                                            xoffset: GLint,
                                            yoffset: GLint,
                                            zoffset: GLint,
                                            width: GLsizei,
                                            height: GLsizei,
                                            depth: GLsizei,
                                            format: GLenum,
                                            imageSize: GLsizei,
                                            offset: GLintptr) {
        let this = jsObject
        _ = this[.compressedTexSubImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(zoffset), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(format), _toJSValue(imageSize), _toJSValue(offset)])
    }

    @inlinable func compressedTexSubImage3D(target: GLenum,
                                            level: GLint,
                                            xoffset: GLint,
                                            yoffset: GLint,
                                            zoffset: GLint,
                                            width: GLsizei,
                                            height: GLsizei,
                                            depth: GLsizei,
                                            format: GLenum,
                                            srcData: [some TypedArrayElement],
                                            srcOffset: GLuint? = nil,
                                            srcLengthOverride: GLuint? = nil) {
        let this = jsObject
        _ = this[.compressedTexSubImage3D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(zoffset), _toJSValue(width), _toJSValue(height), _toJSValue(depth), _toJSValue(format), JSTypedArray(srcData).arrayBuffer.jsValue, _toJSValue(srcOffset), _toJSValue(srcLengthOverride)])
    }
    

    @inlinable func getFragDataLocation(program: WebGLProgram, name: String) -> GLint {
        let this = jsObject
        return this[.getFragDataLocation].function!(this: this, arguments: [_toJSValue(program), _toJSValue(name)]).fromJSValue()!
    }

    @inlinable func uniform1ui(location: WebGLUniformLocation?, v0: GLuint) {
        let this = jsObject
        _ = this[.uniform1ui].function!(this: this, arguments: [_toJSValue(location), _toJSValue(v0)])
    }

    @inlinable func uniform2ui(location: WebGLUniformLocation?, v0: GLuint, v1: GLuint) {
        let this = jsObject
        _ = this[.uniform2ui].function!(this: this, arguments: [_toJSValue(location), _toJSValue(v0), _toJSValue(v1)])
    }

    @inlinable func uniform3ui(location: WebGLUniformLocation?, v0: GLuint, v1: GLuint, v2: GLuint) {
        let this = jsObject
        _ = this[.uniform3ui].function!(this: this, arguments: [_toJSValue(location), _toJSValue(v0), _toJSValue(v1), _toJSValue(v2)])
    }

    @inlinable func uniform4ui(location: WebGLUniformLocation?, v0: GLuint, v1: GLuint, v2: GLuint, v3: GLuint) {
        let this = jsObject
        _ = this[.uniform4ui].function!(this: this, arguments: [_toJSValue(location), _toJSValue(v0), _toJSValue(v1), _toJSValue(v2), _toJSValue(v3)])
    }

    @inlinable func uniform1uiv(location: WebGLUniformLocation?, data: [GLuint], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniform1uiv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniform2uiv(location: WebGLUniformLocation?, data: [GLuint], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniform2uiv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniform3uiv(location: WebGLUniformLocation?, data: [GLuint], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniform3uiv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniform4uiv(location: WebGLUniformLocation?, data: [GLuint], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniform4uiv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniformMatrix3x2fv(location: WebGLUniformLocation?, transpose: GLboolean, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniformMatrix3x2fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(transpose), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniformMatrix4x2fv(location: WebGLUniformLocation?, transpose: GLboolean, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniformMatrix4x2fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(transpose), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniformMatrix2x3fv(location: WebGLUniformLocation?, transpose: GLboolean, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniformMatrix2x3fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(transpose), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniformMatrix4x3fv(location: WebGLUniformLocation?, transpose: GLboolean, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniformMatrix4x3fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(transpose), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniformMatrix2x4fv(location: WebGLUniformLocation?, transpose: GLboolean, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniformMatrix2x4fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(transpose), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniformMatrix3x4fv(location: WebGLUniformLocation?, transpose: GLboolean, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniformMatrix3x4fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(transpose), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func vertexAttribI4i(index: GLuint, x: GLint, y: GLint, z: GLint, w: GLint) {
        let this = jsObject
        _ = this[.vertexAttribI4i].function!(this: this, arguments: [_toJSValue(index), _toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(w)])
    }

    @inlinable func vertexAttribI4iv(index: GLuint, values: [GLint]) {
        let this = jsObject
        _ = this[.vertexAttribI4iv].function!(this: this, arguments: [_toJSValue(index), _toJSValue(values)])
    }

    @inlinable func vertexAttribI4ui(index: GLuint, x: GLuint, y: GLuint, z: GLuint, w: GLuint) {
        let this = jsObject
        _ = this[.vertexAttribI4ui].function!(this: this, arguments: [_toJSValue(index), _toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(w)])
    }

    @inlinable func vertexAttribI4uiv(index: GLuint, values: [GLuint]) {
        let this = jsObject
        _ = this[.vertexAttribI4uiv].function!(this: this, arguments: [_toJSValue(index), _toJSValue(values)])
    }

    @inlinable func vertexAttribIPointer(index: GLuint, size: GLint, type: GLenum, stride: GLsizei, offset: GLintptr) {
        let this = jsObject
        _ = this[.vertexAttribIPointer].function!(this: this, arguments: [_toJSValue(index), _toJSValue(size), _toJSValue(type), _toJSValue(stride), _toJSValue(offset)])
    }

    @inlinable func vertexAttribDivisor(index: GLuint, divisor: GLuint) {
        let this = jsObject
        _ = this[.vertexAttribDivisor].function!(this: this, arguments: [_toJSValue(index), _toJSValue(divisor)])
    }

    @inlinable func drawArraysInstanced(mode: GLenum, first: GLint, count: GLsizei, instanceCount: GLsizei) {
        let this = jsObject
        _ = this[.drawArraysInstanced].function!(this: this, arguments: [_toJSValue(mode), _toJSValue(first), _toJSValue(count), _toJSValue(instanceCount)])
    }

    @inlinable func drawElementsInstanced(mode: GLenum, count: GLsizei, type: GLenum, offset: GLintptr, instanceCount: GLsizei) {
        let this = jsObject
        _ = this[.drawElementsInstanced].function!(this: this, arguments: [_toJSValue(mode), _toJSValue(count), _toJSValue(type), _toJSValue(offset), _toJSValue(instanceCount)])
    }

    @inlinable func drawRangeElements(mode: GLenum, start: GLuint, end: GLuint, count: GLsizei, type: GLenum, offset: GLintptr) {
        let this = jsObject
        _ = this[.drawRangeElements].function!(this: this, arguments: [_toJSValue(mode), _toJSValue(start), _toJSValue(end), _toJSValue(count), _toJSValue(type), _toJSValue(offset)])
    }

    @inlinable func drawBuffers(buffers: [GLenum]) {
        let this = jsObject
        _ = this[.drawBuffers].function!(this: this, arguments: [_toJSValue(buffers)])
    }

    @inlinable func clearBufferfv(buffer: GLenum, drawbuffer: GLint, values: [GLfloat], srcOffset: GLuint? = nil) {
        let this = jsObject
        _ = this[.clearBufferfv].function!(this: this, arguments: [_toJSValue(buffer), _toJSValue(drawbuffer), _toJSValue(values), _toJSValue(srcOffset)])
    }

    @inlinable func clearBufferiv(buffer: GLenum, drawbuffer: GLint, values: [GLint], srcOffset: GLuint? = nil) {
        let this = jsObject
        _ = this[.clearBufferiv].function!(this: this, arguments: [_toJSValue(buffer), _toJSValue(drawbuffer), _toJSValue(values), _toJSValue(srcOffset)])
    }

    @inlinable func clearBufferuiv(buffer: GLenum, drawbuffer: GLint, values: [GLuint], srcOffset: GLuint? = nil) {
        let this = jsObject
        _ = this[.clearBufferuiv].function!(this: this, arguments: [_toJSValue(buffer), _toJSValue(drawbuffer), _toJSValue(values), _toJSValue(srcOffset)])
    }

    @inlinable func clearBufferfi(buffer: GLenum, drawbuffer: GLint, depth: GLfloat, stencil: GLint) {
        let this = jsObject
        _ = this[.clearBufferfi].function!(this: this, arguments: [_toJSValue(buffer), _toJSValue(drawbuffer), _toJSValue(depth), _toJSValue(stencil)])
    }

    @inlinable func createQuery() -> WebGLQuery? {
        let this = jsObject
        return this[.createQuery].function!(this: this, arguments: []).fromJSValue()
    }

    @inlinable func deleteQuery(query: WebGLQuery?) {
        let this = jsObject
        _ = this[.deleteQuery].function!(this: this, arguments: [_toJSValue(query)])
    }

    @inlinable func isQuery(query: WebGLQuery?) -> GLboolean {
        let this = jsObject
        return this[.isQuery].function!(this: this, arguments: [_toJSValue(query)]).fromJSValue()!
    }

    @inlinable func beginQuery(target: GLenum, query: WebGLQuery) {
        let this = jsObject
        _ = this[.beginQuery].function!(this: this, arguments: [_toJSValue(target), _toJSValue(query)])
    }

    @inlinable func endQuery(target: GLenum) {
        let this = jsObject
        _ = this[.endQuery].function!(this: this, arguments: [_toJSValue(target)])
    }

    @inlinable func getQuery(target: GLenum, pname: GLenum) -> WebGLQuery? {
        let this = jsObject
        return this[.getQuery].function!(this: this, arguments: [_toJSValue(target), _toJSValue(pname)]).fromJSValue()
    }

    @inlinable func getQueryParameter(query: WebGLQuery, pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getQueryParameter].function!(this: this, arguments: [_toJSValue(query), _toJSValue(pname)]).fromJSValue()!
    }

    @inlinable func createSampler() -> WebGLSampler? {
        let this = jsObject
        return this[.createSampler].function!(this: this, arguments: []).fromJSValue()
    }

    @inlinable func deleteSampler(sampler: WebGLSampler?) {
        let this = jsObject
        _ = this[.deleteSampler].function!(this: this, arguments: [_toJSValue(sampler)])
    }

    @inlinable func isSampler(sampler: WebGLSampler?) -> GLboolean {
        let this = jsObject
        return this[.isSampler].function!(this: this, arguments: [_toJSValue(sampler)]).fromJSValue()!
    }

    @inlinable func bindSampler(unit: GLuint, sampler: WebGLSampler?) {
        let this = jsObject
        _ = this[.bindSampler].function!(this: this, arguments: [_toJSValue(unit), _toJSValue(sampler)])
    }

    @inlinable func samplerParameteri(sampler: WebGLSampler, pname: GLenum, param: GLint) {
        let this = jsObject
        _ = this[.samplerParameteri].function!(this: this, arguments: [_toJSValue(sampler), _toJSValue(pname), _toJSValue(param)])
    }

    @inlinable func samplerParameterf(sampler: WebGLSampler, pname: GLenum, param: GLfloat) {
        let this = jsObject
        _ = this[.samplerParameterf].function!(this: this, arguments: [_toJSValue(sampler), _toJSValue(pname), _toJSValue(param)])
    }

    @inlinable func getSamplerParameter(sampler: WebGLSampler, pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getSamplerParameter].function!(this: this, arguments: [_toJSValue(sampler), _toJSValue(pname)]).fromJSValue()!
    }

    @inlinable func fenceSync(condition: GLenum, flags: GLbitfield) -> WebGLSync? {
        let this = jsObject
        return this[.fenceSync].function!(this: this, arguments: [_toJSValue(condition), _toJSValue(flags)]).fromJSValue()
    }

    @inlinable func isSync(sync: WebGLSync?) -> GLboolean {
        let this = jsObject
        return this[.isSync].function!(this: this, arguments: [_toJSValue(sync)]).fromJSValue()!
    }

    @inlinable func deleteSync(sync: WebGLSync?) {
        let this = jsObject
        _ = this[.deleteSync].function!(this: this, arguments: [_toJSValue(sync)])
    }

    @inlinable func clientWaitSync(sync: WebGLSync, flags: GLbitfield, timeout: GLuint64) -> GLenum {
        let this = jsObject
        return this[.clientWaitSync].function!(this: this, arguments: [_toJSValue(sync), _toJSValue(flags), _toJSValue(timeout)]).fromJSValue()!
    }

    @inlinable func waitSync(sync: WebGLSync, flags: GLbitfield, timeout: GLint64) {
        let this = jsObject
        _ = this[.waitSync].function!(this: this, arguments: [_toJSValue(sync), _toJSValue(flags), _toJSValue(timeout)])
    }

    @inlinable func getSyncParameter(sync: WebGLSync, pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getSyncParameter].function!(this: this, arguments: [_toJSValue(sync), _toJSValue(pname)]).fromJSValue()!
    }

    @inlinable func createTransformFeedback() -> WebGLTransformFeedback? {
        let this = jsObject
        return this[.createTransformFeedback].function!(this: this, arguments: []).fromJSValue()
    }

    @inlinable func deleteTransformFeedback(tf: WebGLTransformFeedback?) {
        let this = jsObject
        _ = this[.deleteTransformFeedback].function!(this: this, arguments: [_toJSValue(tf)])
    }

    @inlinable func isTransformFeedback(tf: WebGLTransformFeedback?) -> GLboolean {
        let this = jsObject
        return this[.isTransformFeedback].function!(this: this, arguments: [_toJSValue(tf)]).fromJSValue()!
    }

    @inlinable func bindTransformFeedback(target: GLenum, tf: WebGLTransformFeedback?) {
        let this = jsObject
        _ = this[.bindTransformFeedback].function!(this: this, arguments: [_toJSValue(target), _toJSValue(tf)])
    }

    @inlinable func beginTransformFeedback(primitiveMode: GLenum) {
        let this = jsObject
        _ = this[.beginTransformFeedback].function!(this: this, arguments: [_toJSValue(primitiveMode)])
    }

    @inlinable func endTransformFeedback() {
        let this = jsObject
        _ = this[.endTransformFeedback].function!(this: this, arguments: [])
    }

    @inlinable func transformFeedbackVaryings(program: WebGLProgram, varyings: [String], bufferMode: GLenum) {
        let this = jsObject
        _ = this[.transformFeedbackVaryings].function!(this: this, arguments: [_toJSValue(program), _toJSValue(varyings), _toJSValue(bufferMode)])
    }

    @inlinable func getTransformFeedbackVarying(program: WebGLProgram, index: GLuint) -> WebGLActiveInfo? {
        let this = jsObject
        return this[.getTransformFeedbackVarying].function!(this: this, arguments: [_toJSValue(program), _toJSValue(index)]).fromJSValue()
    }

    @inlinable func pauseTransformFeedback() {
        let this = jsObject
        _ = this[.pauseTransformFeedback].function!(this: this, arguments: [])
    }

    @inlinable func resumeTransformFeedback() {
        let this = jsObject
        _ = this[.resumeTransformFeedback].function!(this: this, arguments: [])
    }

    @inlinable func bindBufferBase(target: GLenum, index: GLuint, buffer: WebGLBuffer?) {
        let this = jsObject
        _ = this[.bindBufferBase].function!(this: this, arguments: [_toJSValue(target), _toJSValue(index), _toJSValue(buffer)])
    }

    @inlinable func bindBufferRange(target: GLenum, index: GLuint, buffer: WebGLBuffer?, offset: GLintptr, size: GLsizeiptr) {
        let this = jsObject
        _ = this[.bindBufferRange].function!(this: this, arguments: [_toJSValue(target), _toJSValue(index), _toJSValue(buffer), _toJSValue(offset), _toJSValue(size)])
    }

    @inlinable func getIndexedParameter(target: GLenum, index: GLuint) -> JSValue {
        let this = jsObject
        return this[.getIndexedParameter].function!(this: this, arguments: [_toJSValue(target), _toJSValue(index)]).fromJSValue()!
    }

    @inlinable func getUniformIndices(program: WebGLProgram, uniformNames: [String]) -> [GLuint]? {
        let this = jsObject
        return this[.getUniformIndices].function!(this: this, arguments: [_toJSValue(program), _toJSValue(uniformNames)]).fromJSValue()
    }

    @inlinable func getActiveUniforms(program: WebGLProgram, uniformIndices: [GLuint], pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getActiveUniforms].function!(this: this, arguments: [_toJSValue(program), _toJSValue(uniformIndices), _toJSValue(pname)]).fromJSValue()!
    }

    @inlinable func getUniformBlockIndex(program: WebGLProgram, uniformBlockName: String) -> GLuint {
        let this = jsObject
        return this[.getUniformBlockIndex].function!(this: this, arguments: [_toJSValue(program), _toJSValue(uniformBlockName)]).fromJSValue()!
    }

    @inlinable func getActiveUniformBlockParameter(program: WebGLProgram, uniformBlockIndex: GLuint, pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getActiveUniformBlockParameter].function!(this: this, arguments: [_toJSValue(program), _toJSValue(uniformBlockIndex), _toJSValue(pname)]).fromJSValue()!
    }

    @inlinable func getActiveUniformBlockName(program: WebGLProgram, uniformBlockIndex: GLuint) -> String? {
        let this = jsObject
        return this[.getActiveUniformBlockName].function!(this: this, arguments: [_toJSValue(program), _toJSValue(uniformBlockIndex)]).fromJSValue()
    }

    @inlinable func uniformBlockBinding(program: WebGLProgram, uniformBlockIndex: GLuint, uniformBlockBinding: GLuint) {
        let this = jsObject
        _ = this[.uniformBlockBinding].function!(this: this, arguments: [_toJSValue(program), _toJSValue(uniformBlockIndex), _toJSValue(uniformBlockBinding)])
    }

    @inlinable func createVertexArray() -> WebGLVertexArrayObject? {
        let this = jsObject
        return this[.createVertexArray].function!(this: this, arguments: []).fromJSValue()
    }

    @inlinable func deleteVertexArray(vertexArray: WebGLVertexArrayObject?) {
        let this = jsObject
        _ = this[.deleteVertexArray].function!(this: this, arguments: [_toJSValue(vertexArray)])
    }

    @inlinable func isVertexArray(vertexArray: WebGLVertexArrayObject?) -> GLboolean {
        let this = jsObject
        return this[.isVertexArray].function!(this: this, arguments: [_toJSValue(vertexArray)]).fromJSValue()!
    }

    @inlinable func bindVertexArray(array: WebGLVertexArrayObject?) {
        let this = jsObject
        _ = this[.bindVertexArray].function!(this: this, arguments: [_toJSValue(array)])
    }
}

public protocol WebGL2RenderingContextOverloads: JSBridgedClass {}
public extension WebGL2RenderingContextOverloads {
    @inlinable func bufferData(target: GLenum, size: GLsizeiptr, usage: GLenum) {
        let this = jsObject
        _ = this[.bufferData].function!(this: this, arguments: [_toJSValue(target), _toJSValue(size), _toJSValue(usage)])
    }

   @inlinable func bufferData(target: GLenum,
                               srcData: [some TypedArrayElement],
                               usage: GLenum) {
        let this = jsObject
        _ = this[.bufferData].function!(this: this, 
                                        arguments: [_toJSValue(target),
                                                    JSTypedArray(srcData).arrayBuffer.jsValue,
                                                    _toJSValue(usage)])
    }

    @inlinable func bufferSubData(target: GLenum, 
                                  dstByteOffset: GLintptr,
                                  srcData: [some TypedArrayElement]) {
        let this = jsObject
        _ = this[.bufferSubData].function!(this: this, 
                                           arguments: [_toJSValue(target),
                                                       _toJSValue(dstByteOffset),
                                                       JSTypedArray(srcData).arrayBuffer.jsValue])
    }

    @inlinable func texImage2D(target: GLenum, level: GLint, internalformat: GLint, width: GLsizei, height: GLsizei, border: GLint, format: GLenum, type: GLenum, pixels: [some TypedArrayElement]) {
        let this = jsObject
        _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), _toJSValue(format), _toJSValue(type), JSTypedArray(pixels).arrayBuffer.jsValue])
    }

   @inlinable func texSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, type: GLenum, pixels: [some TypedArrayElement]) {
        let this = jsObject
       _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(width), _toJSValue(height), _toJSValue(format), _toJSValue(type), JSTypedArray(pixels).arrayBuffer.jsValue])
    }

    @inlinable func texImage2D(target: GLenum, level: GLint, internalformat: GLint, format: GLenum, type: GLenum, source: HTMLCanvasElement) {
        let this = jsObject
        _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
 
   
    @inlinable func texImage2D(target: GLenum,
                               level: GLint,
                               internalformat: GLint,
                               format: GLenum,
                               type: GLenum,
                               source:HTMLImageElement) {
        let this = jsObject
        _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    
    @inlinable func texImage2D(target: GLenum,
                               level: GLint,
                               internalformat: GLint,
                               format: GLenum,
                               type: GLenum,
                               source:HTMLVideoElement) {
        let this = jsObject
        _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    
    @inlinable func texImage2D(target: GLenum,
                               level: GLint,
                               internalformat: GLint,
                               format: GLenum,
                               type: GLenum,
                               source:ImageBitmap) {
        let this = jsObject
        _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    
    @inlinable func texImage2D(target: GLenum,
                               level: GLint,
                               internalformat: GLint,
                               format: GLenum,
                               type: GLenum,
                               source:ImageData) {
        let this = jsObject
        _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    
    @inlinable func texImage2D(target: GLenum,
                               level: GLint,
                               internalformat: GLint,
                               format: GLenum,
                               type: GLenum,
                               source:OffscreenCanvas) {
        let this = jsObject
        _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    
    @inlinable func texImage2D(target: GLenum,
                               level: GLint,
                               internalformat: GLint,
                               format: GLenum,
                               type: GLenum,
                               source:VideoFrame) {
        let this = jsObject
        _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    

    @inlinable func texImage2D(target: GLenum, level: GLint, internalformat: GLint, width: GLsizei, height: GLsizei, border: GLint, format: GLenum, type: GLenum, pboOffset: GLintptr) {
        let this = jsObject
        _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(pboOffset)])
    }

   @inlinable func texImage2D(target: GLenum,
                            level: GLint,
                            internalformat: GLint,
                            width: GLsizei,
                            height: GLsizei,
                            border: GLint,
                            format: GLenum,
                            type: GLenum,
                            source: HTMLCanvasElement) {
     let this = jsObject
     _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
 }
    @inlinable func texImage2D(target: GLenum,
                            level: GLint,
                            internalformat: GLint,
                            width: GLsizei,
                            height: GLsizei,
                            border: GLint,
                            format: GLenum,
                            type: GLenum,
                            source: HTMLImageElement) {
     let this = jsObject
     _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
 }
    @inlinable func texImage2D(target: GLenum,
                            level: GLint,
                            internalformat: GLint,
                            width: GLsizei,
                            height: GLsizei,
                            border: GLint,
                            format: GLenum,
                            type: GLenum,
                            source: HTMLVideoElement) {
     let this = jsObject
     _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
 }
    @inlinable func texImage2D(target: GLenum,
                            level: GLint,
                            internalformat: GLint,
                            width: GLsizei,
                            height: GLsizei,
                            border: GLint,
                            format: GLenum,
                            type: GLenum,
                            source: ImageBitmap) {
     let this = jsObject
     _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
 }
    @inlinable func texImage2D(target: GLenum,
                            level: GLint,
                            internalformat: GLint,
                            width: GLsizei,
                            height: GLsizei,
                            border: GLint,
                            format: GLenum,
                            type: GLenum,
                            source: ImageData) {
     let this = jsObject
     _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
 }
    @inlinable func texImage2D(target: GLenum,
                            level: GLint,
                            internalformat: GLint,
                            width: GLsizei,
                            height: GLsizei,
                            border: GLint,
                            format: GLenum,
                            type: GLenum,
                            source: OffscreenCanvas) {
     let this = jsObject
     _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
 }
    @inlinable func texImage2D(target: GLenum,
                            level: GLint,
                            internalformat: GLint,
                            width: GLsizei,
                            height: GLsizei,
                            border: GLint,
                            format: GLenum,
                            type: GLenum,
                            source: VideoFrame) {
     let this = jsObject
     _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
 }

    @inlinable func texImage2D(target: GLenum, level: GLint, internalformat: GLint, width: GLsizei, height: GLsizei, border: GLint, format: GLenum, type: GLenum, srcData: [some TypedArrayElement], srcOffset: GLuint) {
        let this = jsObject
        _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), _toJSValue(format), _toJSValue(type), JSTypedArray(srcData).arrayBuffer.jsValue, _toJSValue(srcOffset)])
    }

    @inlinable func texSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, type: GLenum, pboOffset: GLintptr) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(width), _toJSValue(height), _toJSValue(format), _toJSValue(type), _toJSValue(pboOffset)])
    }

    @inlinable func texSubImage2D(target: GLenum,
                                  level: GLint,
                                  xoffset: GLint,
                                  yoffset: GLint,
                                  format: GLenum,
                                  type: GLenum,
                                  source: HTMLCanvasElement) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texSubImage2D(target: GLenum,
                                  level: GLint,
                                  xoffset: GLint,
                                  yoffset: GLint,
                                  format: GLenum,
                                  type: GLenum,
                                  source: HTMLImageElement) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texSubImage2D(target: GLenum,
                                  level: GLint,
                                  xoffset: GLint,
                                  yoffset: GLint,
                                  format: GLenum,
                                  type: GLenum,
                                  source: HTMLVideoElement) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texSubImage2D(target: GLenum,
                                  level: GLint,
                                  xoffset: GLint,
                                  yoffset: GLint,
                                  format: GLenum,
                                  type: GLenum,
                                  source: ImageBitmap) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texSubImage2D(target: GLenum,
                                  level: GLint,
                                  xoffset: GLint,
                                  yoffset: GLint,
                                  format: GLenum,
                                  type: GLenum,
                                  source: ImageData) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texSubImage2D(target: GLenum,
                                  level: GLint,
                                  xoffset: GLint,
                                  yoffset: GLint,
                                  format: GLenum,
                                  type: GLenum,
                                  source: OffscreenCanvas) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texSubImage2D(target: GLenum,
                                  level: GLint,
                                  xoffset: GLint,
                                  yoffset: GLint,
                                  format: GLenum,
                                  type: GLenum,
                                  source: VideoFrame) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }

    @inlinable func texSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, type: GLenum, srcData: [some TypedArrayElement], srcOffset: GLuint) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(width), _toJSValue(height), _toJSValue(format), _toJSValue(type), JSTypedArray(srcData).arrayBuffer.jsValue, _toJSValue(srcOffset)])
    }

    @inlinable func compressedTexImage2D(target: GLenum, level: GLint, internalformat: GLenum, width: GLsizei, height: GLsizei, border: GLint, imageSize: GLsizei, offset: GLintptr) {
        let this = jsObject
        _ = this[.compressedTexImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), _toJSValue(imageSize), _toJSValue(offset)])
    }

    @inlinable func compressedTexImage2D(target: GLenum, level: GLint, internalformat: GLenum, width: GLsizei, height: GLsizei, border: GLint, srcData: [some TypedArrayElement], srcOffset: GLuint? = nil, srcLengthOverride: GLuint? = nil) {
        let this = jsObject
        _ = this[.compressedTexImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), JSTypedArray(srcData).arrayBuffer.jsValue, _toJSValue(srcOffset), _toJSValue(srcLengthOverride)])
    }

    @inlinable func compressedTexSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, imageSize: GLsizei, offset: GLintptr) {
        let this = jsObject
        _ = this[.compressedTexSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(width), _toJSValue(height), _toJSValue(format), _toJSValue(imageSize), _toJSValue(offset)])
    }

    @inlinable func compressedTexSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, srcData: ArrayBufferView, srcOffset: GLuint? = nil, srcLengthOverride: GLuint? = nil) {
        let this = jsObject
        _ = this[.compressedTexSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(width), _toJSValue(height), _toJSValue(format), _toJSValue(srcData), _toJSValue(srcOffset), _toJSValue(srcLengthOverride)])
    }

    @inlinable func uniform1fv(location: WebGLUniformLocation?, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniform1fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniform2fv(location: WebGLUniformLocation?, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniform2fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniform3fv(location: WebGLUniformLocation?, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniform3fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniform4fv(location: WebGLUniformLocation?, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniform4fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniform1iv(location: WebGLUniformLocation?, data: [GLint], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniform1iv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniform2iv(location: WebGLUniformLocation?, data: [GLint], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniform2iv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniform3iv(location: WebGLUniformLocation?, data: [GLint], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniform3iv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniform4iv(location: WebGLUniformLocation?, data: [GLint], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniform4iv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniformMatrix2fv(location: WebGLUniformLocation?, transpose: GLboolean, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniformMatrix2fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(transpose), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniformMatrix3fv(location: WebGLUniformLocation?, transpose: GLboolean, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniformMatrix3fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(transpose), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func uniformMatrix4fv(location: WebGLUniformLocation?, transpose: GLboolean, data: [GLfloat], srcOffset: GLuint? = nil, srcLength: GLuint? = nil) {
        let this = jsObject
        _ = this[.uniformMatrix4fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(transpose), _toJSValue(data), _toJSValue(srcOffset), _toJSValue(srcLength)])
    }

    @inlinable func readPixels(x: GLint, y: GLint, width: GLsizei, height: GLsizei, format: GLenum, type: GLenum, dstData: [some TypedArrayElement]) {
        let this = jsObject
        _ = this[.readPixels].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height), _toJSValue(format), _toJSValue(type), JSTypedArray(dstData).arrayBuffer.jsValue])
    }


    @inlinable func readPixels(x: GLint, y: GLint, width: GLsizei, height: GLsizei, format: GLenum, type: GLenum, offset: GLintptr) {
        let this = jsObject
        _ = this[.readPixels].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height), _toJSValue(format), _toJSValue(type), _toJSValue(offset)])
    }

    @inlinable func readPixels(x: GLint, y: GLint, width: GLsizei, height: GLsizei, format: GLenum, type: GLenum, dstData: [some TypedArrayElement], dstOffset: GLuint) {
        let this = jsObject
        _ = this[.readPixels].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height), _toJSValue(format), _toJSValue(type), _toJSValue(dstData), JSTypedArray(dstData).arrayBuffer.jsValue])
    }
    
}

public class WebGLQuery: WebGLObject {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WebGLQuery].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

public class WebGLSampler: WebGLObject {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WebGLSampler].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

public class WebGLSync: WebGLObject {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WebGLSync].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

public class WebGLTransformFeedback: WebGLObject {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WebGLTransformFeedback].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

public class WebGLVertexArrayObject: WebGLObject {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WebGLVertexArrayObject].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}
