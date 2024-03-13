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

public class Headers: JSBridgedClass, Sequence {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.Headers].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public convenience init(init: [[String]]? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }
    
    @inlinable public convenience init(init: [String: String]? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }
 
    @inlinable public func append(name: String, value: String) {
        let this = jsObject
        _ = this[.append].function!(this: this, arguments: [_toJSValue(name), _toJSValue(value)])
    }

    @inlinable public func delete(name: String) {
        let this = jsObject
        _ = this[.delete].function!(this: this, arguments: [_toJSValue(name)])
    }

    @inlinable public func get(name: String) -> String? {
        let this = jsObject
        return this[.get].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()
    }

    @inlinable public func getSetCookie() -> [String] {
        let this = jsObject
        return this[.getSetCookie].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func has(name: String) -> Bool {
        let this = jsObject
        return this[.has].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()!
    }

    @inlinable public func set(name: String, value: String) {
        let this = jsObject
        _ = this[.set].function!(this: this, arguments: [_toJSValue(name), _toJSValue(value)])
    }

    public typealias Element = String
    public func makeIterator() -> ValueIterableIterator<Headers> {
        ValueIterableIterator(sequence: self)
    }
}
