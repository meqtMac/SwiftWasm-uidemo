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

public class HTMLSelectElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLSelectElement].function }

    public var autocomplete: String {
        get { jsObject[.autocomplete].fromJSValue()!}
        set { jsObject[.autocomplete] = newValue.jsValue }
    }

    public var disabled: Bool {
        get { jsObject[.disabled].fromJSValue()!}
        set { jsObject[.disabled] = newValue.jsValue }
    }

public var form: HTMLFormElement? {
jsObject[.form].fromJSValue()
    }

    public var multiple: Bool {
        get { jsObject[.multiple].fromJSValue()!}
        set { jsObject[.multiple] = newValue.jsValue }
    }

    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }

    public var required: Bool {
        get { jsObject[.required].fromJSValue()!}
        set { jsObject[.required] = newValue.jsValue }
    }

    public var size: UInt32 {
        get { jsObject[.size].fromJSValue()!}
        set { jsObject[.size] = newValue.jsValue }
    }

public var type: String {
jsObject[.type].fromJSValue()!
    }

public var options: HTMLOptionsCollection {
jsObject[.options].fromJSValue()!
    }

    public var length: UInt32 {
        get { jsObject[.length].fromJSValue()!}
        set { jsObject[.length] = newValue.jsValue }
    }

    @inlinable public func item(index: UInt32) -> HTMLOptionElement? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }

    @inlinable public func namedItem(name: String) -> HTMLOptionElement? {
        let this = jsObject
        return this[.namedItem].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()
    }

    @inlinable public func add(element: HTMLOptGroupElement, before: HTMLElement? = nil) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: [_toJSValue(element), _toJSValue(before)])
    }
    
     @inlinable public func add(element: HTMLOptGroupElement, before: Int32) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: [_toJSValue(element), _toJSValue(before)])
    }
     @inlinable public func add(element: HTMLOptionElement, before: HTMLElement? = nil) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: [_toJSValue(element), _toJSValue(before)])
    }
    
     @inlinable public func add(element: HTMLOptionElement, before: Int32) {
        let this = jsObject
        _ = this[.add].function!(this: this, arguments: [_toJSValue(element), _toJSValue(before)])
    }
    

    @inlinable public func remove() {
        let this = jsObject
        _ = this[.remove].function!(this: this, arguments: [])
    }

    @inlinable public func remove(index: Int32) {
        let this = jsObject
        _ = this[.remove].function!(this: this, arguments: [_toJSValue(index)])
    }

    @inlinable public subscript(key: Int) -> HTMLOptionElement? {
        get {
            jsObject[key].fromJSValue()
        }
        set {
            jsObject[key] = _toJSValue(newValue)
        }
    }

public var selectedOptions: HTMLCollection {
jsObject[.selectedOptions].fromJSValue()!
    }

    public var selectedIndex: Int32 {
        get { jsObject[.selectedIndex].fromJSValue()!}
        set { jsObject[.selectedIndex] = newValue.jsValue }
    }

    public var value: String {
        get { jsObject[.value].fromJSValue()!}
        set { jsObject[.value] = newValue.jsValue }
    }

public var willValidate: Bool {
jsObject[.willValidate].fromJSValue()!
    }

public var validity: ValidityState {
jsObject[.validity].fromJSValue()!
    }

public var validationMessage: String {
jsObject[.validationMessage].fromJSValue()!
    }

    @inlinable public func checkValidity() -> Bool {
        let this = jsObject
        return this[.checkValidity].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func reportValidity() -> Bool {
        let this = jsObject
        return this[.reportValidity].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func setCustomValidity(error: String) {
        let this = jsObject
        _ = this[.setCustomValidity].function!(this: this, arguments: [_toJSValue(error)])
    }

public var labels: NodeList {
jsObject[.labels].fromJSValue()!
    }
}
