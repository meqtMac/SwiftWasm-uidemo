import DOM
import ECMAScript
import JavaScriptKit
import WebAPIBase

public enum BinaryType: JSString, JSValueCompatible {
    case blob = "blob"
    case arraybuffer = "arraybuffer"
    
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

public class CloseEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.CloseEvent].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.wasClean =  jsObject[.wasClean].fromJSValue()!
        self.code = jsObject[.code].fromJSValue()!
        self.reason = jsObject[.reason].fromJSValue()!
        super.init(unsafelyWrapping: jsObject)
    }
    
    public let wasClean: Bool
    
    public let code: UInt16
    
    public let reason: String
}

public class WebSocket: EventTarget {
    
    @inlinable public static override var constructor: JSFunction? { JSObject.global[.WebSocket].function }
    
    required public init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init(url: String, protocols: String? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(url), _toJSValue(protocols)]))
    }
    
    @inlinable public convenience init(url: String, protocols: [String]) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(url), _toJSValue(protocols)]))
    }
    
    public var url: String {
        jsObject[.url].fromJSValue()!
    }
    
    public enum ReadyState: UInt16 {
        case CONNECTING = 0
        case OPEN = 1
        case CLOSING = 2
        case CLOSED = 3
    }
    
    public var readyState: ReadyState {
        .init(rawValue: jsObject[.readyState].fromJSValue()!)!
    }
    
    public var bufferedAmount: UInt64 {
        jsObject[.bufferedAmount].fromJSValue()!
    }
    
    public func onClose(_ handler: @escaping (CloseEvent) -> Void) {
        jsObject[.onclose] = JSClosure {
            handler($0[0].fromJSValue()!)
            return .undefined
        }.jsValue
    }
    
    public func onOpen(_ handler: @escaping (Event) -> Void ) {
        jsObject[.onopen] = JSClosure {
            handler($0[0].fromJSValue()!)
            return .undefined
        }.jsValue
    }
    
    public func onMessage(_ handler: @escaping (MessageEvent) -> Void) {
        jsObject[.onmessage] = JSClosure {
            handler($0[0].fromJSValue()!)
            return .undefined
        }.jsValue
    }
    
    public func onError(_ handler: @escaping (Event) -> Void) {
        jsObject[.onerror] = JSClosure {
            handler($0[0].fromJSValue()!)
            return .undefined
        }.jsValue
    }
    
    public var extensions: String {
        jsObject[.extensions].fromJSValue()!
    }
    
    public var `protocol`: String {
        jsObject[.protocol].fromJSValue()!
    }
    
    @inlinable public func close(code: UInt16? = nil, reason: String? = nil) {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [_toJSValue(code), _toJSValue(reason)])
    }
    
    public var binaryType: BinaryType {
        get { jsObject[.binaryType].fromJSValue()!}
        set { jsObject[.binaryType] = newValue.jsValue }
    }
    
    // TODO: Throw if WebSocket.readyState is CONNECTING.
    @inlinable public func send(data: WebSocketSendAble) {
        let this = jsObject
        _ = this[.send].function!(this: this, arguments: [_toJSValue(data)])
    }
}

extension JSString {
    @usableFromInline static let _self: JSString = "self"
    @usableFromInline static let CloseEvent: JSString = "CloseEvent"
    @usableFromInline static let Object: JSString = "Object"
    @usableFromInline static let WebSocket: JSString = "WebSocket"
    @usableFromInline static let binaryType: JSString = "binaryType"
    @usableFromInline static let bufferedAmount: JSString = "bufferedAmount"
    @usableFromInline static let close: JSString = "close"
    @usableFromInline static let code: JSString = "code"
    @usableFromInline static let extensions: JSString = "extensions"
    @usableFromInline static let onclose: JSString = "onclose"
    @usableFromInline static let onerror: JSString = "onerror"
    @usableFromInline static let onmessage: JSString = "onmessage"
    @usableFromInline static let onopen: JSString = "onopen"
    @usableFromInline static let `protocol`: JSString = "protocol"
    @usableFromInline static let readyState: JSString = "readyState"
    @usableFromInline static let reason: JSString = "reason"
    @usableFromInline static let send: JSString = "send"
    @usableFromInline static let toString: JSString = "toString"
    @usableFromInline static let url: JSString = "url"
    @usableFromInline static let wasClean: JSString = "wasClean"
}

public protocol WebSocketSendAble: ConvertibleToJSValue {}
extension Blob: WebSocketSendAble {}
extension String: WebSocketSendAble {}
extension BufferSource: WebSocketSendAble {}

extension WebSocket.ReadyState: CustomStringConvertible {
    public var description: String {
        switch self {
        case .CONNECTING:
            return "CONNECTING"
        case .CLOSED:
            return "CLOSED"
        case .OPEN:
            return "OPEN"
        case .CLOSING:
            return "CLOSING"
        }
    }
}
