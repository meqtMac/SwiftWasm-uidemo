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


public class DOMParser: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMParser].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }
    
    @inlinable public func parseFromString(string: String, type: DOMParserSupportedType) -> Document {
        let this = jsObject
        return this[.parseFromString].function!(this: this, arguments: [_toJSValue(string), _toJSValue(type)]).fromJSValue()!
    }
}

public enum DOMParserSupportedType: JSString, JSValueCompatible {
    case textHtml = "text/html"
    case textXml = "text/xml"
    case applicationXml = "application/xml"
    case applicationXhtmlXml = "application/xhtml+xml"
    case imageSvgXml = "image/svg+xml"
    
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

public class DOMStringList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMStringList].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var length: UInt32 {
        jsObject[.length].fromJSValue()!
    }
    
    @inlinable public subscript(key: Int) -> String? {
        jsObject[key].fromJSValue()
    }
    
    @inlinable public func item(index: UInt32) -> String? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }
    
    @inlinable public func contains(string: String) -> Bool {
        let this = jsObject
        return this[.contains].function!(this: this, arguments: [_toJSValue(string)]).fromJSValue()!
    }
}

public class DOMStringMap: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMStringMap].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public subscript(key: String) -> String {
        get {
            jsObject[key].fromJSValue()!
        }
        set {
            jsObject[key] = _toJSValue(newValue)
        }
    }
    
    @inlinable public func removeValue(forKey key: String) {
        _ = JSObject.global.Reflect.deleteProperty(jsObject, _toJSValue(key))
    }
}

public class DOMTokenList: JSBridgedClass, Sequence {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMTokenList].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var length: UInt32 {
        jsObject[.length].fromJSValue()!
    }
    
    @inlinable public subscript(key: Int) -> String? {
        jsObject[key].fromJSValue()
    }
    
    @inlinable public func item(index: UInt32) -> String? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }
    
    @inlinable public func contains(token: String) -> Bool {
        let this = jsObject
        return this[.contains].function!(this: this, arguments: [_toJSValue(token)]).fromJSValue()!
    }
    
    @inlinable public func add(tokens: String...) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: tokens.map(_toJSValue))
    }
    
    @inlinable public func remove(tokens: String...) {
        let this = jsObject
        _ = this[.remove].function!(this: this, arguments: tokens.map(_toJSValue))
    }
    
    @inlinable public func toggle(token: String, force: Bool? = nil) -> Bool {
        let this = jsObject
        return this[.toggle].function!(this: this, arguments: [_toJSValue(token), _toJSValue(force)]).fromJSValue()!
    }
    
    @inlinable public func replace(token: String, newToken: String) -> Bool {
        let this = jsObject
        return this[.replace].function!(this: this, arguments: [_toJSValue(token), _toJSValue(newToken)]).fromJSValue()!
    }
    
    @inlinable public func supports(token: String) -> Bool {
        let this = jsObject
        return this[.supports].function!(this: this, arguments: [_toJSValue(token)]).fromJSValue()!
    }
    
    public var value: String {
        get { jsObject[.value].fromJSValue()!}
        set { jsObject[.value] = newValue.jsValue }
    }
    
    public typealias Element = String
    public func makeIterator() -> ValueIterableIterator<DOMTokenList> {
        ValueIterableIterator(sequence: self)
    }
}

