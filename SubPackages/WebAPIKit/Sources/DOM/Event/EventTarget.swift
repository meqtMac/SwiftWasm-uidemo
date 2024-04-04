//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/13.
//

import Foundation
import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


open class EventTarget: JSBridgedClass {
    @inlinable open class var constructor: JSFunction? { JSObject.global[.EventTarget].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public func addEventListener(type: String, callback: EventListener?, options: AddEventListenerOptions? = nil) {
        let this = jsObject
        _ = this[.addEventListener].function!(this: this, arguments: [_toJSValue(type), _toJSValue(callback), _toJSValue(options)])
    }
     @inlinable public func addEventListener(type: String, callback: EventListener?, options: Bool) {
        let this = jsObject
        _ = this[.addEventListener].function!(this: this, arguments: [_toJSValue(type), _toJSValue(callback), _toJSValue(options)])
    }

    @inlinable public func removeEventListener(type: String, callback: EventListener?, options: EventListenerOptions? = nil) {
        let this = jsObject
        _ = this[.removeEventListener].function!(this: this, arguments: [_toJSValue(type), _toJSValue(callback), _toJSValue(options)])
    }
    
     @inlinable public func removeEventListener(type: String, callback: EventListener?, options: Bool) {
        let this = jsObject
        _ = this[.removeEventListener].function!(this: this, arguments: [_toJSValue(type), _toJSValue(callback), _toJSValue(options)])
    }
    

    @inlinable public func dispatchEvent(event: Event) -> Bool {
        let this = jsObject
        return this[.dispatchEvent].function!(this: this, arguments: [_toJSValue(event)]).fromJSValue()!
    }
}
public class EventSource: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.EventSource].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
       _onopen = ClosureAttribute1Optional(jsObject: jsObject, name: .onopen)
        _onmessage = ClosureAttribute1Optional(jsObject: jsObject, name: .onmessage)
        _onerror = ClosureAttribute1Optional(jsObject: jsObject, name: .onerror)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(url: String, eventSourceInitDict: EventSourceInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(url), _toJSValue(eventSourceInitDict)]))
    }

public var url: String {
jsObject[.url].fromJSValue()!
    }

public var withCredentials: Bool {
jsObject[.withCredentials].fromJSValue()!
    }

    public static let CONNECTING: UInt16 = 0

    public static let OPEN: UInt16 = 1

    public static let CLOSED: UInt16 = 2

public var readyState: UInt16 {
jsObject[.readyState].fromJSValue()!
    }

    @ClosureAttribute1Optional
    public var onopen: EventHandler

    @ClosureAttribute1Optional
    public var onmessage: EventHandler

    @ClosureAttribute1Optional
    public var onerror: EventHandler

    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
}

public class EventSourceInit: BridgedDictionary {
    public convenience init(withCredentials: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.withCredentials] = _toJSValue(withCredentials)
        self.init(unsafelyWrapping: object)
    }

    public var withCredentials: Bool {
        get { jsObject[.withCredentials].fromJSValue()!}
        set { jsObject[.withCredentials] = newValue.jsValue }
    }
}

public class AddEventListenerOptions: BridgedDictionary {
    public convenience init(passive: Bool, once: Bool, signal: AbortSignal) {
        let object = JSObject.global[.Object].function!.new()
        object[.passive] = _toJSValue(passive)
        object[.once] = _toJSValue(once)
        object[.signal] = _toJSValue(signal)
        self.init(unsafelyWrapping: object)
    }

    public var passive: Bool {
        get { jsObject[.passive].fromJSValue()!}
        set { jsObject[.passive] = newValue.jsValue }
    }

    public var once: Bool {
        get { jsObject[.once].fromJSValue()!}
        set { jsObject[.once] = newValue.jsValue }
    }

    public var signal: AbortSignal {
        get { jsObject[.signal].fromJSValue()!}
        set { jsObject[.signal] = newValue.jsValue }
    }
}

