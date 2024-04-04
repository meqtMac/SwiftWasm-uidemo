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


public class AbortController: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.AbortController].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

public var signal: AbortSignal {
jsObject[.signal].fromJSValue()!
    }

    @inlinable public func abort(reason: JSValue? = nil) {
        let this = jsObject
        _ = this[.abort].function!(this: this, arguments: [_toJSValue(reason)])
    }
}

public class AbortSignal: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.AbortSignal].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _onabort = ClosureAttribute1Optional(jsObject: jsObject, name: .onabort)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public class func abort(reason: JSValue? = nil) -> Self {
        let this = constructor!
        return this[.abort].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
    }

    @inlinable public class func timeout(milliseconds: UInt64) -> Self {
        let this = constructor!
        return this[.timeout].function!(this: this, arguments: [_toJSValue(milliseconds)]).fromJSValue()!
    }

    @inlinable public class func any(signals: [AbortSignal]) -> Self {
        let this = constructor!
        return this[.any].function!(this: this, arguments: [_toJSValue(signals)]).fromJSValue()!
    }

public var aborted: Bool {
jsObject[.aborted].fromJSValue()!
    }

public var reason: JSValue {
jsObject[.reason].fromJSValue()!
    }

    @inlinable public func throwIfAborted() {
        let this = jsObject
        _ = this[.throwIfAborted].function!(this: this, arguments: [])
    }

    @ClosureAttribute1Optional
    public var onabort: EventHandler
}

