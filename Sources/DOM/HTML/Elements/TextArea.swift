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


public class HTMLTextAreaElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTextAreaElement].function }

   public var autocomplete: String {
        get { jsObject[.autocomplete].fromJSValue()!}
        set { jsObject[.autocomplete] = newValue.jsValue }
    }

    public var cols: UInt32 {
        get { jsObject[.cols].fromJSValue()!}
        set { jsObject[.cols] = newValue.jsValue }
    }

    public var dirName: String {
        get { jsObject[.dirName].fromJSValue()!}
        set { jsObject[.dirName] = newValue.jsValue }
    }

    public var disabled: Bool {
        get { jsObject[.disabled].fromJSValue()!}
        set { jsObject[.disabled] = newValue.jsValue }
    }

    public var form: HTMLFormElement? {
        jsObject[.form].fromJSValue()
    }

    public var maxLength: Int32 {
        get { jsObject[.maxLength].fromJSValue()!}
        set { jsObject[.maxLength] = newValue.jsValue }
    }

    public var minLength: Int32 {
        get { jsObject[.minLength].fromJSValue()!}
        set { jsObject[.minLength] = newValue.jsValue }
    }

    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }

    public var placeholder: String {
        get { jsObject[.placeholder].fromJSValue()!}
        set { jsObject[.placeholder] = newValue.jsValue }
    }

    public var readOnly: Bool {
        get { jsObject[.readOnly].fromJSValue()!}
        set { jsObject[.readOnly] = newValue.jsValue }
    }

    public var required: Bool {
        get { jsObject[.required].fromJSValue()!}
        set { jsObject[.required] = newValue.jsValue }
    }

    public var rows: UInt32 {
        get { jsObject[.rows].fromJSValue()!}
        set { jsObject[.rows] = newValue.jsValue }
    }

    public var wrap: String {
        get { jsObject[.wrap].fromJSValue()!}
        set { jsObject[.wrap] = newValue.jsValue }
    }

    public var type: String {
        jsObject[.type].fromJSValue()!
    }

    public var defaultValue: String {
        get { jsObject[.defaultValue].fromJSValue()!}
        set { jsObject[.defaultValue] = newValue.jsValue }
    }

    public var value: String {
        get { jsObject[.value].fromJSValue()!}
        set { jsObject[.value] = newValue.jsValue }
    }

    public var textLength: UInt32 {
        jsObject[.textLength].fromJSValue()!
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

    @inlinable public func select() {
        let this = jsObject
        _ = this[.select].function!(this: this, arguments: [])
    }

    public var selectionStart: UInt32 {
        get { jsObject[.selectionStart].fromJSValue()!}
        set { jsObject[.slot] = newValue.jsValue }
    }

    public var selectionEnd: UInt32 {
        get { jsObject[.selectionEnd].fromJSValue()!}
        set { jsObject[.selectionEnd] = newValue.jsValue }
    }

    public var selectionDirection: String {
        get { jsObject[.selectionDirection].fromJSValue()!}
        set { jsObject[.selectionDirection] = newValue.jsValue }
    }

    @inlinable public func setRangeText(replacement: String) {
        let this = jsObject
        _ = this[.setRangeText].function!(this: this, arguments: [_toJSValue(replacement)])
    }

    @inlinable public func setRangeText(replacement: String, start: UInt32, end: UInt32, selectionMode: SelectionMode? = nil) {
        let this = jsObject
        _ = this[.setRangeText].function!(this: this, arguments: [_toJSValue(replacement), _toJSValue(start), _toJSValue(end), _toJSValue(selectionMode)])
    }

    @inlinable public func setSelectionRange(start: UInt32, end: UInt32, direction: String? = nil) {
        let this = jsObject
        _ = this[.setSelectionRange].function!(this: this, arguments: [_toJSValue(start), _toJSValue(end), _toJSValue(direction)])
    }
}

