//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import JavaScriptKit
import WebAPIBase
import JavaScriptBigIntSupport
import JavaScriptEventLoop

public class XSLTProcessor: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.XSLTProcessor].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @inlinable public func importStylesheet(style: Node) {
        let this = jsObject
        _ = this[.importStylesheet].function!(this: this, arguments: [_toJSValue(style)])
    }

    @inlinable public func transformToFragment(source: Node, output: Document) -> DocumentFragment {
        let this = jsObject
        return this[.transformToFragment].function!(this: this, arguments: [_toJSValue(source), _toJSValue(output)]).fromJSValue()!
    }

    @inlinable public func transformToDocument(source: Node) -> Document {
        let this = jsObject
        return this[.transformToDocument].function!(this: this, arguments: [_toJSValue(source)]).fromJSValue()!
    }

    @inlinable public func setParameter(namespaceURI: String, localName: String, value: JSValue) {
        let this = jsObject
        _ = this[.setParameter].function!(this: this, arguments: [_toJSValue(namespaceURI), _toJSValue(localName), _toJSValue(value)])
    }

    @inlinable public func getParameter(namespaceURI: String, localName: String) -> JSValue {
        let this = jsObject
        return this[.getParameter].function!(this: this, arguments: [_toJSValue(namespaceURI), _toJSValue(localName)]).fromJSValue()!
    }

    @inlinable public func removeParameter(namespaceURI: String, localName: String) {
        let this = jsObject
        _ = this[.removeParameter].function!(this: this, arguments: [_toJSValue(namespaceURI), _toJSValue(localName)])
    }

    @inlinable public func clearParameters() {
        let this = jsObject
        _ = this[.clearParameters].function!(this: this, arguments: [])
    }

    @inlinable public func reset() {
        let this = jsObject
        _ = this[.reset].function!(this: this, arguments: [])
    }
}
