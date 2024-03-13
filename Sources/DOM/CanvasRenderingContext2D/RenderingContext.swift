import JavaScriptKit

public protocol RenderingContext: JSValueCompatible {
    /// Textual identifier of this context type, passed to `getContext` under the hood.
    static var contextID: JSString { get }
}

extension ImageBitmapRenderingContext: RenderingContext {
    public static var contextID: JSString { "bitmaprenderer" }
}

extension CanvasRenderingContext2D: RenderingContext {
    public static var contextID: JSString { "2d" }
}

public protocol OffscreenRenderingContext: JSValueCompatible {
    static var contextID: JSString { get }
}

extension ImageBitmapRenderingContext: OffscreenRenderingContext {}
extension CanvasRenderingContext2D: OffscreenRenderingContext {}
extension OffscreenCanvasRenderingContext2D: OffscreenRenderingContext {
    public static var contextID: JSString { "2d" }
}

extension JSString {
    @usableFromInline static let getContext: JSString = "getContext"
}

public extension HTMLCanvasElement {
    @inlinable func getContext<Context: RenderingContext>(
        _ contextType: Context.Type,
        options: JSValue? = nil
    ) -> Context? {
        let this = jsObject
        return this[.getContext].function!(
            this: this,
            arguments: [contextType.contextID.jsValue, options?.jsValue ?? .undefined]
        ).fromJSValue()!
    }
}

public extension OffscreenCanvas {
    @inlinable func getContext<Context: OffscreenRenderingContext>(
        _ contextType: Context.Type,
        options: JSValue? = nil
    ) -> Context? {
        let this = jsObject
        return this[.getContext].function!(
            this: this,
            arguments: [contextType.contextID.jsValue, options?.jsValue ?? .undefined]
        ).fromJSValue()!
    }
}

public enum RenderingCanvas: JSValueCompatible {
    case htmlCanvasElement(HTMLCanvasElement)
    case offscreenCanvas(OffscreenCanvas)

    public static func construct(from value: JSValue) -> Self? {
        if let htmlCanvasElement: HTMLCanvasElement = value.fromJSValue() {
            return .htmlCanvasElement(htmlCanvasElement)
        }
        if let offscreenCanvas: OffscreenCanvas = value.fromJSValue() {
            return .offscreenCanvas(offscreenCanvas)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .htmlCanvasElement(htmlCanvasElement):
            return htmlCanvasElement.jsValue
        case let .offscreenCanvas(offscreenCanvas):
            return offscreenCanvas.jsValue
        }
    }
}
