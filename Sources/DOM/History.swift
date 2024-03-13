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

public class History: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.History].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var length: UInt32 {
        jsObject[.length].fromJSValue()!
    }
    
    public var scrollRestoration: ScrollRestoration {
        get { jsObject[.scrollRestoration].fromJSValue()!}
        set { jsObject[.scrollRestoration] = newValue.jsValue }
    }
    
    public var state: JSValue {
        jsObject[.state].fromJSValue()!
    }
    
    @inlinable public func go(delta: Int32? = nil) {
        let this = jsObject
        _ = this[.go].function!(this: this, arguments: [_toJSValue(delta)])
    }
    
    @inlinable public func back() {
        let this = jsObject
        _ = this[.back].function!(this: this, arguments: [])
    }
    
    @inlinable public func forward() {
        let this = jsObject
        _ = this[.forward].function!(this: this, arguments: [])
    }
    
    @inlinable public func pushState(data: JSValue, unused: String, url: String? = nil) {
        let this = jsObject
        _ = this[.pushState].function!(this: this, arguments: [_toJSValue(data), _toJSValue(unused), _toJSValue(url)])
    }
    
    @inlinable public func replaceState(data: JSValue, unused: String, url: String? = nil) {
        let this = jsObject
        _ = this[.replaceState].function!(this: this, arguments: [_toJSValue(data), _toJSValue(unused), _toJSValue(url)])
    }
}
