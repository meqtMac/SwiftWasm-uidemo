//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


public class HTMLCollection: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.HTMLCollection].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var length: UInt32 {
        jsObject[.length].fromJSValue()!
    }
    
    @inlinable public subscript(key: Int) -> Element? {
        jsObject[key].fromJSValue()
    }
    
    @inlinable public func item(index: UInt32) -> Element? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }
    
    @inlinable public subscript(key: String) -> Element? {
        jsObject[key].fromJSValue()
    }
    
    @inlinable public func namedItem(name: String) -> Element? {
        let this = jsObject
        return this[.namedItem].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()
    }
}

public class HTMLAllCollection: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.HTMLAllCollection].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var length: UInt32 {
        jsObject[.length].fromJSValue()!
    }
        
    @inlinable public subscript(key: Int) -> Element {
        jsObject[key].fromJSValue()!
    }
    
    public enum Element_or_HTMLCollection: JSValueCompatible {
        case element(Element)
        case htmlCollection(HTMLCollection)
        
        public static func construct(from value: JSValue) -> Self? {
            if let element: Element = value.fromJSValue() {
                return .element(element)
            }
            if let htmlCollection: HTMLCollection = value.fromJSValue() {
                return .htmlCollection(htmlCollection)
            }
            return nil
        }
        
        public var jsValue: JSValue {
            switch self {
            case let .element(element):
                return element.jsValue
            case let .htmlCollection(htmlCollection):
                return htmlCollection.jsValue
            }
        }
    }
    
    @inlinable public subscript(key: String) -> Element_or_HTMLCollection? {
        jsObject[key].fromJSValue()
    }
    
    @inlinable public func namedItem(name: String) -> Element_or_HTMLCollection? {
        let this = jsObject
        return this[.namedItem].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()
    }
    
    @inlinable public func item(nameOrIndex: String? = nil) -> Element_or_HTMLCollection? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(nameOrIndex)]).fromJSValue()
    }
}
