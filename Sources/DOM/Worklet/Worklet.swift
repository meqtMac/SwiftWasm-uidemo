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

open class Worklet: JSBridgedClass {
    @inlinable open class var constructor: JSFunction? { JSObject.global[.Worklet].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public func addModule(moduleURL: String, options: WorkletOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.addModule].function!(this: this, arguments: [_toJSValue(moduleURL), _toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func addModule(moduleURL: String, options: WorkletOptions? = nil) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.addModule].function!(this: this, arguments: [_toJSValue(moduleURL), _toJSValue(options)]).fromJSValue()!
        _ = try await _promise.value
    }
}

public class WorkletOptions: BridgedDictionary {
    public convenience init(credentials: RequestCredentials) {
        let object = JSObject.global[.Object].function!.new()
        object[.credentials] = _toJSValue(credentials)
        self.init(unsafelyWrapping: object)
    }

    public var credentials: RequestCredentials {
        get { jsObject[.credentials].fromJSValue()!}
        set { jsObject[.credentials] = newValue.jsValue }
    }
}
