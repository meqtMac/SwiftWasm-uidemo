
import DOM
import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAnimations
import WebAPIBase

public class WebGLActiveInfo: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.WebGLActiveInfo].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var size: GLint {
        jsObject[.size].fromJSValue()!
    }
    
    public var type: GLenum {
        jsObject[.type].fromJSValue()!
    }
    
    public var name: String {
        jsObject[.name].fromJSValue()!
    }
}

public class WebGLBuffer: WebGLObject {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WebGLBuffer].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

public class WebGLContextAttributes: BridgedDictionary {
    public convenience init(alpha: Bool,
                            depth: Bool,
                            stencil: Bool,
                            antialias: Bool,
                            premultipliedAlpha: Bool,
                            preserveDrawingBuffer: Bool,
                            powerPreference: WebGLPowerPreference,
                            failIfMajorPerformanceCaveat: Bool,
                            desynchronized: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.alpha] = _toJSValue(alpha)
        object[.depth] = _toJSValue(depth)
        object[.stencil] = _toJSValue(stencil)
        object[.antialias] = _toJSValue(antialias)
        object[.premultipliedAlpha] = _toJSValue(premultipliedAlpha)
        object[.preserveDrawingBuffer] = _toJSValue(preserveDrawingBuffer)
        object[.powerPreference] = _toJSValue(powerPreference)
        object[.failIfMajorPerformanceCaveat] = _toJSValue(failIfMajorPerformanceCaveat)
        object[.desynchronized] = _toJSValue(desynchronized)
        self.init(unsafelyWrapping: object)
    }
    
    
    public var alpha: Bool {
        get { jsObject[.alpha].fromJSValue()!}
        set { jsObject[.alpha] = newValue.jsValue }
    }
    
    public var depth: Bool {
        get { jsObject[.depth].fromJSValue()!}
        set { jsObject[.depth] = newValue.jsValue }
    }
    
    public var stencil: Bool {
        get { jsObject[.stencil].fromJSValue()!}
        set { jsObject[.stencil] = newValue.jsValue }
    }
    
    public var antialias: Bool {
        get { jsObject[.antialias].fromJSValue()!}
        set { jsObject[.antialias] = newValue.jsValue }
    }
    
    public var premultipliedAlpha: Bool {
        get { jsObject[.premultipliedAlpha].fromJSValue()!}
        set { jsObject[.premultipliedAlpha] = newValue.jsValue }
    }
    
    public var preserveDrawingBuffer: Bool {
        get { jsObject[.preserveDrawingBuffer].fromJSValue()!}
        set { jsObject[.preserveDrawingBuffer] = newValue.jsValue }
    }
    
    public var powerPreference: WebGLPowerPreference {
        get { jsObject[.powerPreference].fromJSValue()!}
        set { jsObject[.powerPreference] = newValue.jsValue }
    }
    
    public var failIfMajorPerformanceCaveat: Bool {
        get { jsObject[.failIfMajorPerformanceCaveat].fromJSValue()!}
        set { jsObject[.failIfMajorPerformanceCaveat] = newValue.jsValue }
    }
    
    public var desynchronized: Bool {
        get { jsObject[.desynchronized].fromJSValue()!}
        set { jsObject[.desynchronized] = newValue.jsValue }
    }
}

public class WebGLContextEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WebGLContextEvent].function }
    
    @inlinable public convenience init(type: String, eventInit: WebGLContextEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInit)]))
    }
    
    public var statusMessage: String {
        jsObject[.statusMessage].fromJSValue()!
    }
}

public class WebGLContextEventInit: BridgedDictionary {
    public convenience init(statusMessage: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.statusMessage] = _toJSValue(statusMessage)
        self.init(unsafelyWrapping: object)
    }
    
    public var statusMessage: String {
        get { jsObject[.statusMessage].fromJSValue()!}
        set { jsObject[.statusMessage] = newValue.jsValue }
    }
}

public class WebGLFramebuffer: WebGLObject {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WebGLFramebuffer].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

open class WebGLObject: JSBridgedClass {
    @inlinable open class var constructor: JSFunction? { JSObject.global[.WebGLObject].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
}

public enum WebGLPowerPreference: JSString, JSValueCompatible {
    case `default` = "default"
    case lowPower = "low-power"
    case highPerformance = "high-performance"
    
    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }
    
    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }
    
    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public class WebGLProgram: WebGLObject {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WebGLProgram].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

public class WebGLRenderbuffer: WebGLObject {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WebGLRenderbuffer].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

public class WebGLRenderingContext: JSBridgedClass,
                                        WebGLRenderingContextBase,
                                    WebGLRenderingContextOverloads {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.WebGLRenderingContext].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
}

public protocol WebGLRenderingContextBase: JSBridgedClass {}
public extension WebGLRenderingContextBase {
    
    @inlinable var canvas: RenderingCanvas { jsObject[.canvas].fromJSValue()! }
    
    @inlinable var drawingBufferWidth: GLsizei { jsObject[.drawingBufferWidth].fromJSValue()! }
    
    @inlinable var drawingBufferHeight: GLsizei { jsObject[.drawingBufferHeight].fromJSValue()! }
    
    @inlinable var drawingBufferColorSpace: PredefinedColorSpace {
        get { jsObject[.drawingBufferColorSpace].fromJSValue()! }
        nonmutating set { jsObject[.drawingBufferColorSpace] = _toJSValue(newValue) }
    }
    
    @inlinable var unpackColorSpace: PredefinedColorSpace {
        get { jsObject[.unpackColorSpace].fromJSValue()! }
        nonmutating set { jsObject[.unpackColorSpace] = _toJSValue(newValue) }
    }
    
    @inlinable func getContextAttributes() -> WebGLContextAttributes? {
        let this = jsObject
        return this[.getContextAttributes].function!(this: this, arguments: []).fromJSValue()
    }
    
    @inlinable func isContextLost() -> Bool {
        let this = jsObject
        return this[.isContextLost].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable func getSupportedExtensions() -> [String]? {
        let this = jsObject
        return this[.getSupportedExtensions].function!(this: this, arguments: []).fromJSValue()
    }
    
    @inlinable func getExtension(name: String) -> JSObject? {
        let this = jsObject
        return this[.getExtension].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()
    }
    
    @inlinable func activeTexture(texture: GLenum) {
        let this = jsObject
        _ = this[.activeTexture].function!(this: this, arguments: [_toJSValue(texture)])
    }
    
    @inlinable func attachShader(program: WebGLProgram, shader: WebGLShader) {
        let this = jsObject
        _ = this[.attachShader].function!(this: this, arguments: [_toJSValue(program), _toJSValue(shader)])
    }
    
    @inlinable func bindAttribLocation(program: WebGLProgram, index: GLuint, name: String) {
        let this = jsObject
        _ = this[.bindAttribLocation].function!(this: this, arguments: [_toJSValue(program), _toJSValue(index), _toJSValue(name)])
    }
    
    @inlinable func bindBuffer(target: GLenum, buffer: WebGLBuffer?) {
        let this = jsObject
        _ = this[.bindBuffer].function!(this: this, arguments: [_toJSValue(target), _toJSValue(buffer)])
    }
    
    @inlinable func bindFramebuffer(target: GLenum, framebuffer: WebGLFramebuffer?) {
        let this = jsObject
        _ = this[.bindFramebuffer].function!(this: this, arguments: [_toJSValue(target), _toJSValue(framebuffer)])
    }
    
    @inlinable func bindRenderbuffer(target: GLenum, renderbuffer: WebGLRenderbuffer?) {
        let this = jsObject
        _ = this[.bindRenderbuffer].function!(this: this, arguments: [_toJSValue(target), _toJSValue(renderbuffer)])
    }
    
    @inlinable func bindTexture(target: GLenum, texture: WebGLTexture?) {
        let this = jsObject
        _ = this[.bindTexture].function!(this: this, arguments: [_toJSValue(target), _toJSValue(texture)])
    }
    
    @inlinable func blendColor(red: GLclampf, green: GLclampf, blue: GLclampf, alpha: GLclampf) {
        let this = jsObject
        _ = this[.blendColor].function!(this: this, arguments: [_toJSValue(red), _toJSValue(green), _toJSValue(blue), _toJSValue(alpha)])
    }
    
    @inlinable func blendEquation(mode: GLenum) {
        let this = jsObject
        _ = this[.blendEquation].function!(this: this, arguments: [_toJSValue(mode)])
    }
    
    @inlinable func blendEquationSeparate(modeRGB: GLenum, modeAlpha: GLenum) {
        let this = jsObject
        _ = this[.blendEquationSeparate].function!(this: this, arguments: [_toJSValue(modeRGB), _toJSValue(modeAlpha)])
    }
    
    @inlinable func blendFunc(sfactor: GLenum, dfactor: GLenum) {
        let this = jsObject
        _ = this[.blendFunc].function!(this: this, arguments: [_toJSValue(sfactor), _toJSValue(dfactor)])
    }
    
    @inlinable func blendFuncSeparate(srcRGB: GLenum, dstRGB: GLenum, srcAlpha: GLenum, dstAlpha: GLenum) {
        let this = jsObject
        _ = this[.blendFuncSeparate].function!(this: this, arguments: [_toJSValue(srcRGB), _toJSValue(dstRGB), _toJSValue(srcAlpha), _toJSValue(dstAlpha)])
    }
    
    @inlinable func checkFramebufferStatus(target: GLenum) -> GLenum {
        let this = jsObject
        return this[.checkFramebufferStatus].function!(this: this, arguments: [_toJSValue(target)]).fromJSValue()!
    }
    
    @inlinable func clear(mask: GLbitfield) {
        let this = jsObject
        _ = this[.clear].function!(this: this, arguments: [_toJSValue(mask)])
    }
    
    @inlinable func clearColor(red: GLclampf, green: GLclampf, blue: GLclampf, alpha: GLclampf) {
        let this = jsObject
        _ = this[.clearColor].function!(this: this, arguments: [_toJSValue(red), _toJSValue(green), _toJSValue(blue), _toJSValue(alpha)])
    }
    
    @inlinable func clearDepth(depth: GLclampf) {
        let this = jsObject
        _ = this[.clearDepth].function!(this: this, arguments: [_toJSValue(depth)])
    }
    
    @inlinable func clearStencil(s: GLint) {
        let this = jsObject
        _ = this[.clearStencil].function!(this: this, arguments: [_toJSValue(s)])
    }
    
    @inlinable func colorMask(red: GLboolean, green: GLboolean, blue: GLboolean, alpha: GLboolean) {
        let this = jsObject
        _ = this[.colorMask].function!(this: this, arguments: [_toJSValue(red), _toJSValue(green), _toJSValue(blue), _toJSValue(alpha)])
    }
    
    @inlinable func compileShader(shader: WebGLShader) {
        let this = jsObject
        _ = this[.compileShader].function!(this: this, arguments: [_toJSValue(shader)])
    }
    
    @inlinable func copyTexImage2D(target: GLenum, level: GLint, internalformat: GLenum, x: GLint, y: GLint, width: GLsizei, height: GLsizei, border: GLint) {
        let this = jsObject
        _ = this[.copyTexImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height), _toJSValue(border)])
    }
    
    @inlinable func copyTexSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, x: GLint, y: GLint, width: GLsizei, height: GLsizei) {
        let this = jsObject
        _ = this[.copyTexSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height)])
    }
    
    @inlinable func createBuffer() -> WebGLBuffer? {
        let this = jsObject
        return this[.createBuffer].function!(this: this, arguments: []).fromJSValue()
    }
    
    @inlinable func createFramebuffer() -> WebGLFramebuffer? {
        let this = jsObject
        return this[.createFramebuffer].function!(this: this, arguments: []).fromJSValue()
    }
    
    @inlinable func createProgram() -> WebGLProgram? {
        let this = jsObject
        return this[.createProgram].function!(this: this, arguments: []).fromJSValue()
    }
    
    @inlinable func createRenderbuffer() -> WebGLRenderbuffer? {
        let this = jsObject
        return this[.createRenderbuffer].function!(this: this, arguments: []).fromJSValue()
    }
    
    @inlinable func createShader(type: GLenum) -> WebGLShader? {
        let this = jsObject
        return this[.createShader].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()
    }
    
    @inlinable func createTexture() -> WebGLTexture? {
        let this = jsObject
        return this[.createTexture].function!(this: this, arguments: []).fromJSValue()
    }
    
    @inlinable func cullFace(mode: GLenum) {
        let this = jsObject
        _ = this[.cullFace].function!(this: this, arguments: [_toJSValue(mode)])
    }
    
    @inlinable func deleteBuffer(buffer: WebGLBuffer?) {
        let this = jsObject
        _ = this[.deleteBuffer].function!(this: this, arguments: [_toJSValue(buffer)])
    }
    
    @inlinable func deleteFramebuffer(framebuffer: WebGLFramebuffer?) {
        let this = jsObject
        _ = this[.deleteFramebuffer].function!(this: this, arguments: [_toJSValue(framebuffer)])
    }
    
    @inlinable func deleteProgram(program: WebGLProgram?) {
        let this = jsObject
        _ = this[.deleteProgram].function!(this: this, arguments: [_toJSValue(program)])
    }
    
    @inlinable func deleteRenderbuffer(renderbuffer: WebGLRenderbuffer?) {
        let this = jsObject
        _ = this[.deleteRenderbuffer].function!(this: this, arguments: [_toJSValue(renderbuffer)])
    }
    
    @inlinable func deleteShader(shader: WebGLShader?) {
        let this = jsObject
        _ = this[.deleteShader].function!(this: this, arguments: [_toJSValue(shader)])
    }
    
    @inlinable func deleteTexture(texture: WebGLTexture?) {
        let this = jsObject
        _ = this[.deleteTexture].function!(this: this, arguments: [_toJSValue(texture)])
    }
    
    @inlinable func depthFunc(func: GLenum) {
        let this = jsObject
        _ = this[.depthFunc].function!(this: this, arguments: [_toJSValue(`func`)])
    }
    
    @inlinable func depthMask(flag: GLboolean) {
        let this = jsObject
        _ = this[.depthMask].function!(this: this, arguments: [_toJSValue(flag)])
    }
    
    @inlinable func depthRange(zNear: GLclampf, zFar: GLclampf) {
        let this = jsObject
        _ = this[.depthRange].function!(this: this, arguments: [_toJSValue(zNear), _toJSValue(zFar)])
    }
    
    @inlinable func detachShader(program: WebGLProgram, shader: WebGLShader) {
        let this = jsObject
        _ = this[.detachShader].function!(this: this, arguments: [_toJSValue(program), _toJSValue(shader)])
    }
    
    @inlinable func disable(cap: GLenum) {
        let this = jsObject
        _ = this[.disable].function!(this: this, arguments: [_toJSValue(cap)])
    }
    
    @inlinable func disableVertexAttribArray(index: GLuint) {
        let this = jsObject
        _ = this[.disableVertexAttribArray].function!(this: this, arguments: [_toJSValue(index)])
    }
    
    @inlinable func drawArrays(mode: GLenum, first: GLint, count: GLsizei) {
        let this = jsObject
        _ = this[.drawArrays].function!(this: this, arguments: [_toJSValue(mode), _toJSValue(first), _toJSValue(count)])
    }
    
    @inlinable func drawElements(mode: GLenum, count: GLsizei, type: GLenum, offset: GLintptr) {
        let this = jsObject
        _ = this[.drawElements].function!(this: this, arguments: [_toJSValue(mode), _toJSValue(count), _toJSValue(type), _toJSValue(offset)])
    }
    
    @inlinable func enable(cap: GLenum) {
        let this = jsObject
        _ = this[.enable].function!(this: this, arguments: [_toJSValue(cap)])
    }
    
    @inlinable func enableVertexAttribArray(index: GLuint) {
        let this = jsObject
        _ = this[.enableVertexAttribArray].function!(this: this, arguments: [_toJSValue(index)])
    }
    
    @inlinable func finish() {
        let this = jsObject
        _ = this[.finish].function!(this: this, arguments: [])
    }
    
    @inlinable func flush() {
        let this = jsObject
        _ = this[.flush].function!(this: this, arguments: [])
    }
    
    @inlinable func framebufferRenderbuffer(target: GLenum, attachment: GLenum, renderbuffertarget: GLenum, renderbuffer: WebGLRenderbuffer?) {
        let this = jsObject
        _ = this[.framebufferRenderbuffer].function!(this: this, arguments: [_toJSValue(target), _toJSValue(attachment), _toJSValue(renderbuffertarget), _toJSValue(renderbuffer)])
    }
    
    @inlinable func framebufferTexture2D(target: GLenum, attachment: GLenum, textarget: GLenum, texture: WebGLTexture?, level: GLint) {
        let this = jsObject
        _ = this[.framebufferTexture2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(attachment), _toJSValue(textarget), _toJSValue(texture), _toJSValue(level)])
    }
    
    @inlinable func frontFace(mode: GLenum) {
        let this = jsObject
        _ = this[.frontFace].function!(this: this, arguments: [_toJSValue(mode)])
    }
    
    @inlinable func generateMipmap(target: GLenum) {
        let this = jsObject
        _ = this[.generateMipmap].function!(this: this, arguments: [_toJSValue(target)])
    }
    
    @inlinable func getActiveAttrib(program: WebGLProgram, index: GLuint) -> WebGLActiveInfo? {
        let this = jsObject
        return this[.getActiveAttrib].function!(this: this, arguments: [_toJSValue(program), _toJSValue(index)]).fromJSValue()
    }
    
    @inlinable func getActiveUniform(program: WebGLProgram, index: GLuint) -> WebGLActiveInfo? {
        let this = jsObject
        return this[.getActiveUniform].function!(this: this, arguments: [_toJSValue(program), _toJSValue(index)]).fromJSValue()
    }
    
    @inlinable func getAttachedShaders(program: WebGLProgram) -> [WebGLShader]? {
        let this = jsObject
        return this[.getAttachedShaders].function!(this: this, arguments: [_toJSValue(program)]).fromJSValue()
    }
    
    @inlinable func getAttribLocation(program: WebGLProgram, name: String) -> GLint {
        let this = jsObject
        return this[.getAttribLocation].function!(this: this, arguments: [_toJSValue(program), _toJSValue(name)]).fromJSValue()!
    }
    
    @inlinable func getBufferParameter(target: GLenum, pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getBufferParameter].function!(this: this, arguments: [_toJSValue(target), _toJSValue(pname)]).fromJSValue()!
    }
    
    @inlinable func getParameter(pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getParameter].function!(this: this, arguments: [_toJSValue(pname)]).fromJSValue()!
    }
    
    @inlinable func getError() -> GLenum {
        let this = jsObject
        return this[.getError].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable func getFramebufferAttachmentParameter(target: GLenum, attachment: GLenum, pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getFramebufferAttachmentParameter].function!(this: this, arguments: [_toJSValue(target), _toJSValue(attachment), _toJSValue(pname)]).fromJSValue()!
    }
    
    @inlinable func getProgramParameter(program: WebGLProgram, pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getProgramParameter].function!(this: this, arguments: [_toJSValue(program), _toJSValue(pname)]).fromJSValue()!
    }
    
    @inlinable func getProgramInfoLog(program: WebGLProgram) -> String? {
        let this = jsObject
        return this[.getProgramInfoLog].function!(this: this, arguments: [_toJSValue(program)]).fromJSValue()
    }
    
    @inlinable func getRenderbufferParameter(target: GLenum, pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getRenderbufferParameter].function!(this: this, arguments: [_toJSValue(target), _toJSValue(pname)]).fromJSValue()!
    }
    
    @inlinable func getShaderParameter(shader: WebGLShader, pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getShaderParameter].function!(this: this, arguments: [_toJSValue(shader), _toJSValue(pname)]).fromJSValue()!
    }
    
    @inlinable func getShaderPrecisionFormat(shadertype: GLenum, precisiontype: GLenum) -> WebGLShaderPrecisionFormat? {
        let this = jsObject
        return this[.getShaderPrecisionFormat].function!(this: this, arguments: [_toJSValue(shadertype), _toJSValue(precisiontype)]).fromJSValue()
    }
    
    @inlinable func getShaderInfoLog(shader: WebGLShader) -> String? {
        let this = jsObject
        return this[.getShaderInfoLog].function!(this: this, arguments: [_toJSValue(shader)]).fromJSValue()
    }
    
    @inlinable func getShaderSource(shader: WebGLShader) -> String? {
        let this = jsObject
        return this[.getShaderSource].function!(this: this, arguments: [_toJSValue(shader)]).fromJSValue()
    }
    
    @inlinable func getTexParameter(target: GLenum, pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getTexParameter].function!(this: this, arguments: [_toJSValue(target), _toJSValue(pname)]).fromJSValue()!
    }
    
    @inlinable func getUniform(program: WebGLProgram, location: WebGLUniformLocation) -> JSValue {
        let this = jsObject
        return this[.getUniform].function!(this: this, arguments: [_toJSValue(program), _toJSValue(location)]).fromJSValue()!
    }
    
    @inlinable func getUniformLocation(program: WebGLProgram, name: String) -> WebGLUniformLocation? {
        let this = jsObject
        return this[.getUniformLocation].function!(this: this, arguments: [_toJSValue(program), _toJSValue(name)]).fromJSValue()
    }
    
    @inlinable func getVertexAttrib(index: GLuint, pname: GLenum) -> JSValue {
        let this = jsObject
        return this[.getVertexAttrib].function!(this: this, arguments: [_toJSValue(index), _toJSValue(pname)]).fromJSValue()!
    }
    
    @inlinable func getVertexAttribOffset(index: GLuint, pname: GLenum) -> GLintptr {
        let this = jsObject
        return this[.getVertexAttribOffset].function!(this: this, arguments: [_toJSValue(index), _toJSValue(pname)]).fromJSValue()!
    }
    
    @inlinable func hint(target: GLenum, mode: GLenum) {
        let this = jsObject
        _ = this[.hint].function!(this: this, arguments: [_toJSValue(target), _toJSValue(mode)])
    }
    
    @inlinable func isBuffer(buffer: WebGLBuffer?) -> GLboolean {
        let this = jsObject
        return this[.isBuffer].function!(this: this, arguments: [_toJSValue(buffer)]).fromJSValue()!
    }
    
    @inlinable func isEnabled(cap: GLenum) -> GLboolean {
        let this = jsObject
        return this[.isEnabled].function!(this: this, arguments: [_toJSValue(cap)]).fromJSValue()!
    }
    
    @inlinable func isFramebuffer(framebuffer: WebGLFramebuffer?) -> GLboolean {
        let this = jsObject
        return this[.isFramebuffer].function!(this: this, arguments: [_toJSValue(framebuffer)]).fromJSValue()!
    }
    
    @inlinable func isProgram(program: WebGLProgram?) -> GLboolean {
        let this = jsObject
        return this[.isProgram].function!(this: this, arguments: [_toJSValue(program)]).fromJSValue()!
    }
    
    @inlinable func isRenderbuffer(renderbuffer: WebGLRenderbuffer?) -> GLboolean {
        let this = jsObject
        return this[.isRenderbuffer].function!(this: this, arguments: [_toJSValue(renderbuffer)]).fromJSValue()!
    }
    
    @inlinable func isShader(shader: WebGLShader?) -> GLboolean {
        let this = jsObject
        return this[.isShader].function!(this: this, arguments: [_toJSValue(shader)]).fromJSValue()!
    }
    
    @inlinable func isTexture(texture: WebGLTexture?) -> GLboolean {
        let this = jsObject
        return this[.isTexture].function!(this: this, arguments: [_toJSValue(texture)]).fromJSValue()!
    }
    
    @inlinable func lineWidth(width: GLfloat) {
        let this = jsObject
        _ = this[.lineWidth].function!(this: this, arguments: [_toJSValue(width)])
    }
    
    @inlinable func linkProgram(program: WebGLProgram) {
        let this = jsObject
        _ = this[.linkProgram].function!(this: this, arguments: [_toJSValue(program)])
    }
    
    @inlinable func pixelStorei(pname: GLenum, param: GLint) {
        let this = jsObject
        _ = this[.pixelStorei].function!(this: this, arguments: [_toJSValue(pname), _toJSValue(param)])
    }
    
    @inlinable func polygonOffset(factor: GLfloat, units: GLfloat) {
        let this = jsObject
        _ = this[.polygonOffset].function!(this: this, arguments: [_toJSValue(factor), _toJSValue(units)])
    }
    
    @inlinable func renderbufferStorage(target: GLenum, internalformat: GLenum, width: GLsizei, height: GLsizei) {
        let this = jsObject
        _ = this[.renderbufferStorage].function!(this: this, arguments: [_toJSValue(target), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height)])
    }
    
    @inlinable func sampleCoverage(value: GLclampf, invert: GLboolean) {
        let this = jsObject
        _ = this[.sampleCoverage].function!(this: this, arguments: [_toJSValue(value), _toJSValue(invert)])
    }
    
    @inlinable func scissor(x: GLint, y: GLint, width: GLsizei, height: GLsizei) {
        let this = jsObject
        _ = this[.scissor].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height)])
    }
    
    @inlinable func shaderSource(shader: WebGLShader, source: String) {
        let this = jsObject
        _ = this[.shaderSource].function!(this: this, arguments: [_toJSValue(shader), _toJSValue(source)])
    }
    
    @inlinable func stencilFunc(func: GLenum, ref: GLint, mask: GLuint) {
        let this = jsObject
        _ = this[.stencilFunc].function!(this: this, arguments: [_toJSValue(`func`), _toJSValue(ref), _toJSValue(mask)])
    }
    
    @inlinable func stencilFuncSeparate(face: GLenum, func: GLenum, ref: GLint, mask: GLuint) {
        let this = jsObject
        _ = this[.stencilFuncSeparate].function!(this: this, arguments: [_toJSValue(face), _toJSValue(`func`), _toJSValue(ref), _toJSValue(mask)])
    }
    
    @inlinable func stencilMask(mask: GLuint) {
        let this = jsObject
        _ = this[.stencilMask].function!(this: this, arguments: [_toJSValue(mask)])
    }
    
    @inlinable func stencilMaskSeparate(face: GLenum, mask: GLuint) {
        let this = jsObject
        _ = this[.stencilMaskSeparate].function!(this: this, arguments: [_toJSValue(face), _toJSValue(mask)])
    }
    
    @inlinable func stencilOp(fail: GLenum, zfail: GLenum, zpass: GLenum) {
        let this = jsObject
        _ = this[.stencilOp].function!(this: this, arguments: [_toJSValue(fail), _toJSValue(zfail), _toJSValue(zpass)])
    }
    
    @inlinable func stencilOpSeparate(face: GLenum, fail: GLenum, zfail: GLenum, zpass: GLenum) {
        let this = jsObject
        _ = this[.stencilOpSeparate].function!(this: this, arguments: [_toJSValue(face), _toJSValue(fail), _toJSValue(zfail), _toJSValue(zpass)])
    }
    
    @inlinable func texParameterf(target: GLenum, pname: GLenum, param: GLfloat) {
        let this = jsObject
        _ = this[.texParameterf].function!(this: this, arguments: [_toJSValue(target), _toJSValue(pname), _toJSValue(param)])
    }
    
    @inlinable func texParameteri(target: GLenum, pname: GLenum, param: GLint) {
        let this = jsObject
        _ = this[.texParameteri].function!(this: this, arguments: [_toJSValue(target), _toJSValue(pname), _toJSValue(param)])
    }
    
    @inlinable func uniform1f(location: WebGLUniformLocation?, x: GLfloat) {
        let this = jsObject
        _ = this[.uniform1f].function!(this: this, arguments: [_toJSValue(location), _toJSValue(x)])
    }
    
    @inlinable func uniform2f(location: WebGLUniformLocation?, x: GLfloat, y: GLfloat) {
        let this = jsObject
        _ = this[.uniform2f].function!(this: this, arguments: [_toJSValue(location), _toJSValue(x), _toJSValue(y)])
    }
    
    @inlinable func uniform3f(location: WebGLUniformLocation?, x: GLfloat, y: GLfloat, z: GLfloat) {
        let this = jsObject
        _ = this[.uniform3f].function!(this: this, arguments: [_toJSValue(location), _toJSValue(x), _toJSValue(y), _toJSValue(z)])
    }
    
    @inlinable func uniform4f(location: WebGLUniformLocation?, x: GLfloat, y: GLfloat, z: GLfloat, w: GLfloat) {
        let this = jsObject
        _ = this[.uniform4f].function!(this: this, arguments: [_toJSValue(location), _toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(w)])
    }
    
    @inlinable func uniform1i(location: WebGLUniformLocation?, x: GLint) {
        let this = jsObject
        _ = this[.uniform1i].function!(this: this, arguments: [_toJSValue(location), _toJSValue(x)])
    }
    
    @inlinable func uniform2i(location: WebGLUniformLocation?, x: GLint, y: GLint) {
        let this = jsObject
        _ = this[.uniform2i].function!(this: this, arguments: [_toJSValue(location), _toJSValue(x), _toJSValue(y)])
    }
    
    @inlinable func uniform3i(location: WebGLUniformLocation?, x: GLint, y: GLint, z: GLint) {
        let this = jsObject
        _ = this[.uniform3i].function!(this: this, arguments: [_toJSValue(location), _toJSValue(x), _toJSValue(y), _toJSValue(z)])
    }
    
    @inlinable func uniform4i(location: WebGLUniformLocation?, x: GLint, y: GLint, z: GLint, w: GLint) {
        let this = jsObject
        _ = this[.uniform4i].function!(this: this, arguments: [_toJSValue(location), _toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(w)])
    }
    
    @inlinable func useProgram(program: WebGLProgram?) {
        let this = jsObject
        _ = this[.useProgram].function!(this: this, arguments: [_toJSValue(program)])
    }
    
    @inlinable func validateProgram(program: WebGLProgram) {
        let this = jsObject
        _ = this[.validateProgram].function!(this: this, arguments: [_toJSValue(program)])
    }
    
    @inlinable func vertexAttrib1f(index: GLuint, x: GLfloat) {
        let this = jsObject
        _ = this[.vertexAttrib1f].function!(this: this, arguments: [_toJSValue(index), _toJSValue(x)])
    }
    
    @inlinable func vertexAttrib2f(index: GLuint, x: GLfloat, y: GLfloat) {
        let this = jsObject
        _ = this[.vertexAttrib2f].function!(this: this, arguments: [_toJSValue(index), _toJSValue(x), _toJSValue(y)])
    }
    
    @inlinable func vertexAttrib3f(index: GLuint, x: GLfloat, y: GLfloat, z: GLfloat) {
        let this = jsObject
        _ = this[.vertexAttrib3f].function!(this: this, arguments: [_toJSValue(index), _toJSValue(x), _toJSValue(y), _toJSValue(z)])
    }
    
    @inlinable func vertexAttrib4f(index: GLuint, x: GLfloat, y: GLfloat, z: GLfloat, w: GLfloat) {
        let this = jsObject
        _ = this[.vertexAttrib4f].function!(this: this, arguments: [_toJSValue(index), _toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(w)])
    }
    
    @inlinable func vertexAttrib1fv(index: GLuint, values: [GLfloat]) {
        let this = jsObject
        _ = this[.vertexAttrib1fv].function!(this: this, arguments: [_toJSValue(index), _toJSValue(values)])
    }
    
    @inlinable func vertexAttrib2fv(index: GLuint, values: [GLfloat]) {
        let this = jsObject
        _ = this[.vertexAttrib2fv].function!(this: this, arguments: [_toJSValue(index), _toJSValue(values)])
    }
    
    @inlinable func vertexAttrib3fv(index: GLuint, values: [GLfloat]) {
        let this = jsObject
        _ = this[.vertexAttrib3fv].function!(this: this, arguments: [_toJSValue(index), _toJSValue(values)])
    }
    
    @inlinable func vertexAttrib4fv(index: GLuint, values: [GLfloat]) {
        let this = jsObject
        _ = this[.vertexAttrib4fv].function!(this: this, arguments: [_toJSValue(index), _toJSValue(values)])
    }
    
    @inlinable func vertexAttribPointer(index: GLuint, size: GLint, type: GLenum, normalized: GLboolean, stride: GLsizei, offset: GLintptr) {
        let this = jsObject
        _ = this[.vertexAttribPointer].function!(this: this, arguments: [_toJSValue(index), _toJSValue(size), _toJSValue(type), _toJSValue(normalized), _toJSValue(stride), _toJSValue(offset)])
    }
    
    @inlinable func viewport(x: GLint, y: GLint, width: GLsizei, height: GLsizei) {
        let this = jsObject
        _ = this[.viewport].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height)])
    }
}

public protocol WebGLRenderingContextOverloads: JSBridgedClass {}
public extension WebGLRenderingContextOverloads {
    @inlinable func bufferData(target: GLenum, size: GLsizeiptr, usage: GLenum) {
        let this = jsObject
        _ = this[.bufferData].function!(this: this, arguments: [_toJSValue(target), _toJSValue(size), _toJSValue(usage)])
    }
    
    @inlinable func bufferData(target: GLenum, data: [some TypedArrayElement], usage: GLenum) {
        let this = jsObject
        _ = this[.bufferData].function!(this: this, arguments: [_toJSValue(target), JSTypedArray(data).arrayBuffer.jsValue, _toJSValue(usage)])
    }
    
    @inlinable func bufferSubData(target: GLenum, offset: GLintptr, data: [some TypedArrayElement]) {
        let this = jsObject
        _ = this[.bufferSubData].function!(this: this, arguments: [_toJSValue(target), _toJSValue(offset), JSTypedArray(data).arrayBuffer.jsValue])
    }
    
    @inlinable func compressedTexImage2D(target: GLenum, level: GLint, internalformat: GLenum, width: GLsizei, height: GLsizei, border: GLint, data: [some TypedArrayElement]) {
        let this = jsObject
        _ = this[.compressedTexImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), JSTypedArray(data).arrayBuffer.jsValue])
    }
    
    @inlinable func compressedTexSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, data: [some TypedArrayElement]) {
        let this = jsObject
        _ = this[.compressedTexSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(width), _toJSValue(height), _toJSValue(format), JSTypedArray(data).arrayBuffer.jsValue])
    }
    
    @inlinable func readPixels(x: GLint, y: GLint, width: GLsizei, height: GLsizei, format: GLenum, type: GLenum, pixels: [some TypedArrayElement]) {
        let this = jsObject
        _ = this[.readPixels].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height), _toJSValue(format), _toJSValue(type), JSTypedArray(pixels).arrayBuffer.jsValue])
    }
    
    @inlinable func texImage2D(target: GLenum, level: GLint, internalformat: GLint, width: GLsizei, height: GLsizei, border: GLint, format: GLenum, type: GLenum, pixels: [some TypedArrayElement]) {
        let this = jsObject
        _ = this[.texImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(width), _toJSValue(height), _toJSValue(border), _toJSValue(format), _toJSValue(type), JSTypedArray(pixels).arrayBuffer.jsValue])
    }
    
    @inlinable func texImage2D(target: GLenum, level: GLint, internalformat: GLint, format: GLenum, type: GLenum, source: HTMLCanvasElement) {
        _ = jsObject[.texImage2D].function!(this: jsObject, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    
    @inlinable func texImage2D(target: GLenum, level: GLint, internalformat: GLint, format: GLenum, type: GLenum, source: OffscreenCanvas) {
        _ = jsObject[.texImage2D].function!(this: jsObject, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    
    
    @inlinable func texImage2D(target: GLenum, level: GLint, internalformat: GLint, format: GLenum, type: GLenum, source: HTMLImageElement) {
        _ = jsObject[.texImage2D].function!(this: jsObject, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texImage2D(target: GLenum, level: GLint, internalformat: GLint, format: GLenum, type: GLenum, source: HTMLVideoElement) {
        _ = jsObject[.texImage2D].function!(this: jsObject, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    
    
    @inlinable func texImage2D(target: GLenum, level: GLint, internalformat: GLint, format: GLenum, type: GLenum, source: ImageBitmap) {
        _ = jsObject[.texImage2D].function!(this: jsObject, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    
    @inlinable func texImage2D(target: GLenum, level: GLint, internalformat: GLint, format: GLenum, type: GLenum, source: ImageData) {
        _ = jsObject[.texImage2D].function!(this: jsObject, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    
    @inlinable func texImage2D(target: GLenum, level: GLint, internalformat: GLint, format: GLenum, type: GLenum, source: VideoFrame) {
        _ = jsObject[.texImage2D].function!(this: jsObject, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(internalformat), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    
    @inlinable func texSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, type: GLenum, pixels: [some TypedArrayElement]) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(width), _toJSValue(height), _toJSValue(format), _toJSValue(type), JSTypedArray(pixels).arrayBuffer.jsValue])
    }
    
    
    
    @inlinable func texSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, format: GLenum, type: GLenum, source: HTMLCanvasElement) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, format: GLenum, type: GLenum, source: HTMLVideoElement) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, format: GLenum, type: GLenum, source: HTMLImageElement) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, format: GLenum, type: GLenum, source: ImageBitmap) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, format: GLenum, type: GLenum, source: ImageData) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, format: GLenum, type: GLenum, source: OffscreenCanvas) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    @inlinable func texSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, format: GLenum, type: GLenum, source: VideoFrame) {
        let this = jsObject
        _ = this[.texSubImage2D].function!(this: this, arguments: [_toJSValue(target), _toJSValue(level), _toJSValue(xoffset), _toJSValue(yoffset), _toJSValue(format), _toJSValue(type), _toJSValue(source)])
    }
    
    @inlinable func uniform1fv(location: WebGLUniformLocation?, v: [GLfloat]) {
        let this = jsObject
        _ = this[.uniform1fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(v)])
    }
    
    @inlinable func uniform2fv(location: WebGLUniformLocation?, v: [GLfloat]) {
        let this = jsObject
        _ = this[.uniform2fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(v)])
    }
    
    @inlinable func uniform3fv(location: WebGLUniformLocation?, v: [GLfloat]) {
        let this = jsObject
        _ = this[.uniform3fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(v)])
    }
    
    @inlinable func uniform4fv(location: WebGLUniformLocation?, v: [GLfloat]) {
        let this = jsObject
        _ = this[.uniform4fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(v)])
    }
    
    @inlinable func uniform1iv(location: WebGLUniformLocation?, v: [GLint]) {
        let this = jsObject
        _ = this[.uniform1iv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(v)])
    }
    
    @inlinable func uniform2iv(location: WebGLUniformLocation?, v: [GLint]) {
        let this = jsObject
        _ = this[.uniform2iv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(v)])
    }
    
    @inlinable func uniform3iv(location: WebGLUniformLocation?, v: [GLint]) {
        let this = jsObject
        _ = this[.uniform3iv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(v)])
    }
    
    @inlinable func uniform4iv(location: WebGLUniformLocation?, v: [GLint]) {
        let this = jsObject
        _ = this[.uniform4iv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(v)])
    }
    
    @inlinable func uniformMatrix2fv(location: WebGLUniformLocation?, transpose: GLboolean, value: [GLfloat]) {
        let this = jsObject
        _ = this[.uniformMatrix2fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(transpose), _toJSValue(value)])
    }
    
    @inlinable func uniformMatrix3fv(location: WebGLUniformLocation?, transpose: GLboolean, value: [GLfloat]) {
        let this = jsObject
        _ = this[.uniformMatrix3fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(transpose), _toJSValue(value)])
    }
    
    @inlinable func uniformMatrix4fv(location: WebGLUniformLocation?, transpose: GLboolean, value: [GLfloat]) {
        let this = jsObject
        _ = this[.uniformMatrix4fv].function!(this: this, arguments: [_toJSValue(location), _toJSValue(transpose), _toJSValue(value)])
    }
}

public class WebGLShader: WebGLObject {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WebGLShader].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

public class WebGLShaderPrecisionFormat: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.WebGLShaderPrecisionFormat].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
       self.jsObject = jsObject
    }
    
    public var rangeMin: GLint {
        jsObject[.rangeMin].fromJSValue()!
    }
    
    public var rangeMax: GLint {
        jsObject[.rangeMax].fromJSValue()!
    }
    
    public var precision: GLint {
        jsObject[.precision].fromJSValue()!
    }
}

public class WebGLTexture: WebGLObject {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WebGLTexture].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

public class WebGLUniformLocation: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.WebGLUniformLocation].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
}
