//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import JavaScriptKit
import WebAPIBase

public class MessageChannel: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.MessageChannel].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }
    
    public var port1: MessagePort {
        jsObject[.port1].fromJSValue()!
    }
    
    public var port2: MessagePort {
        jsObject[.port2].fromJSValue()!
    }
}

public class MessagePort: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MessagePort].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onmessage = ClosureAttribute1Optional(jsObject: jsObject, name: .onmessage)
        _onmessageerror = ClosureAttribute1Optional(jsObject: jsObject, name: .onmessageerror)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public func postMessage(message: JSValue, transfer: [JSObject]) {
        let this = jsObject
        _ = this[.postMessage].function!(this: this, arguments: [_toJSValue(message), _toJSValue(transfer)])
    }
    
    @inlinable public func postMessage(message: JSValue, options: StructuredSerializeOptions? = nil) {
        let this = jsObject
        _ = this[.postMessage].function!(this: this, arguments: [_toJSValue(message), _toJSValue(options)])
    }
    
    @inlinable public func start() {
        let this = jsObject
        _ = this[.start].function!(this: this, arguments: [])
    }
    
    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
    
    @ClosureAttribute1Optional
    public var onmessage: EventHandler
    
    @ClosureAttribute1Optional
    public var onmessageerror: EventHandler
}

