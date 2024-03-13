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

public class HTMLOptionsCollection: HTMLCollection {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLOptionsCollection].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }

//    @usableFromInline let _length: ReadWriteAttribute<UInt32>
    @inlinable override public var length: UInt32 {
        get { jsObject[.length].fromJSValue()! }
        set {  jsObject[.length] = newValue.jsValue }
    }

    @inlinable override public subscript(key: Int) -> HTMLOptionElement? {
        get {
            super[key] as? HTMLOptionElement
        }
        set {
            jsObject[key] = _toJSValue(newValue)
        }
    }

    @inlinable public func add(element: HTMLOptGroupElement, before: HTMLElement? = nil) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: [_toJSValue(element), _toJSValue(before)])
    }
    @inlinable public func add(element: HTMLOptionElement, before: HTMLElement? = nil) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: [_toJSValue(element), _toJSValue(before)])
    }


    @inlinable public func add(element: HTMLOptGroupElement, before: Int32) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: [_toJSValue(element), _toJSValue(before)])
    }
    @inlinable public func add(element: HTMLOptionElement, before: Int32) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: [_toJSValue(element), _toJSValue(before)])
    }



    @inlinable public func remove(index: Int32) {
        let this = jsObject
        _ = this[.remove].function!(this: this, arguments: [_toJSValue(index)])
    }

    public var selectedIndex: Int32 {
        get { jsObject[.selectedIndex].fromJSValue()!}
        set { jsObject[.selectedIndex] = newValue.jsValue }
    }
}
