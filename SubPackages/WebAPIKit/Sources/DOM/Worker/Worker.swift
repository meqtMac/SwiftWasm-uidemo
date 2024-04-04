//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public class SharedWorker: EventTarget, AbstractWorker {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.SharedWorker].function }

    @inlinable public convenience init(scriptURL: String, options: String? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(scriptURL), _toJSValue(options)]))
    }

     @inlinable public convenience init(scriptURL: String, options: WorkerOptions? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(scriptURL), _toJSValue(options)]))
    }

    public var port: MessagePort {
        jsObject[.port].fromJSValue()!
    }
}

public protocol AbstractWorker: JSBridgedClass {}
public extension AbstractWorker {
    @inlinable var onerror: EventHandler {
        get { ClosureAttribute1Optional[.onerror, in: jsObject] }
        nonmutating set { ClosureAttribute1Optional[.onerror, in: jsObject] = newValue }
    }
}
public class Worker: EventTarget, AbstractWorker {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.Worker].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _onmessage = ClosureAttribute1Optional(jsObject: jsObject, name: .onmessage)
        _onmessageerror = ClosureAttribute1Optional(jsObject: jsObject, name: .onmessageerror)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(scriptURL: String, options: WorkerOptions? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(scriptURL), _toJSValue(options)]))
    }

    @inlinable public func terminate() {
        let this = jsObject
        _ = this[.terminate].function!(this: this, arguments: [])
    }

    @inlinable public func postMessage(message: JSValue, transfer: [JSObject]) {
        let this = jsObject
        _ = this[.postMessage].function!(this: this, arguments: [_toJSValue(message), _toJSValue(transfer)])
    }

    @inlinable public func postMessage(message: JSValue, options: StructuredSerializeOptions? = nil) {
        let this = jsObject
        _ = this[.postMessage].function!(this: this, arguments: [_toJSValue(message), _toJSValue(options)])
    }

    @ClosureAttribute1Optional
    public var onmessage: EventHandler

    @ClosureAttribute1Optional
    public var onmessageerror: EventHandler
}

public class WorkerOptions: BridgedDictionary {
    public convenience init(type: WorkerType, credentials: RequestCredentials, name: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.type] = _toJSValue(type)
        object[.credentials] = _toJSValue(credentials)
        object[.name] = _toJSValue(name)
        self.init(unsafelyWrapping: object)
    }

    public var type: WorkerType {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }

    public var credentials: RequestCredentials {
        get { jsObject[.credentials].fromJSValue()!}
        set { jsObject[.credentials] = newValue.jsValue }
    }

    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }
}

public enum WorkerType: JSString, JSValueCompatible {
    case classic = "classic"
    case module = "module"

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
