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

public class HTMLInputElement: HTMLElement, PopoverInvokerElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLInputElement].function }
    
    public var accept: String {
        get { jsObject[.accept].fromJSValue()!}
        set { jsObject[.accept] = newValue.jsValue }
    }
    
    public var alt: String {
        get { jsObject[.alt].fromJSValue()!}
        set { jsObject[.alt] = newValue.jsValue }
    }
    
    public var autocomplete: String {
        get { jsObject[.autocomplete].fromJSValue()!}
        set { jsObject[.autocomplete] = newValue.jsValue }
    }
    
    public var defaultChecked: Bool {
        get { jsObject[.defaultChecked].fromJSValue()!}
        set { jsObject[.defaultChecked] = newValue.jsValue }
    }
    
    public var checked: Bool {
        get { jsObject[.checked].fromJSValue()!}
        set { jsObject[.checked] = newValue.jsValue }
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
    
    public var files: FileList? {
        get { jsObject[.files].fromJSValue()}
        set { jsObject[.files] = newValue.jsValue }
    }
    
    public var formAction: String {
        get { jsObject[.formAction].fromJSValue()!}
        set { jsObject[.formAction] = newValue.jsValue }
    }
    
    public var formEnctype: String {
        get { jsObject[.formEnctype].fromJSValue()!}
        set { jsObject[.formEnctype] = newValue.jsValue }
    }
    
    public var formMethod: String {
        get { jsObject[.formMethod].fromJSValue()!}
        set { jsObject[.formMethod] = newValue.jsValue }
    }
    
    public var formNoValidate: Bool {
        get { jsObject[.formNoValidate].fromJSValue()!}
        set { jsObject[.formNoValidate] = newValue.jsValue }
    }
    
    public var formTarget: String {
        get { jsObject[.formTarget].fromJSValue()!}
        set { jsObject[.formTarget] = newValue.jsValue }
    }
    
    public var height: UInt32 {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }
    
    public var indeterminate: Bool {
        get { jsObject[.indeterminate].fromJSValue()!}
        set { jsObject[.indeterminate] = newValue.jsValue }
    }
    
    public var list: HTMLDataListElement? {
        jsObject[.list].fromJSValue()
    }
    
    public var max: String {
        get { jsObject[.max].fromJSValue()!}
        set { jsObject[.max] = newValue.jsValue }
    }
    
    public var maxLength: Int32 {
        get { jsObject[.maxLength].fromJSValue()!}
        set { jsObject[.maxLength] = newValue.jsValue }
    }
    
    public var min: String {
        get { jsObject[.min].fromJSValue()!}
        set { jsObject[.min] = newValue.jsValue }
    }
    
    public var minLength: Int32 {
        get { jsObject[.minLength].fromJSValue()!}
        set { jsObject[.minLength] = newValue.jsValue }
    }
    
    public var multiple: Bool {
        get { jsObject[.multiple].fromJSValue()!}
        set { jsObject[.multiple] = newValue.jsValue }
    }
    
    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }
    
    public var pattern: String {
        get { jsObject[.pattern].fromJSValue()!}
        set { jsObject[.pattern] = newValue.jsValue }
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
    
    public var size: UInt32 {
        get { jsObject[.size].fromJSValue()!}
        set { jsObject[.size] = newValue.jsValue }
    }
    
    public var src: String {
        get { jsObject[.src].fromJSValue()!}
        set { jsObject[.src] = newValue.jsValue }
    }
    
    public var step: String {
        get { jsObject[.step].fromJSValue()!}
        set { jsObject[.step] = newValue.jsValue }
    }
    
    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }
    
    public var defaultValue: String {
        get { jsObject[.defaultValue].fromJSValue()!}
        set { jsObject[.defaultValue] = newValue.jsValue }
    }
    
    public var value: String {
        get { jsObject[.value].fromJSValue()!}
        set { jsObject[.value] = newValue.jsValue }
    }
    
    public var valueAsDate: JSObject? {
        get { jsObject[.valueAsDate].fromJSValue()}
        set { jsObject[.valueAsDate] = newValue.jsValue }
    }
    
    public var valueAsNumber: Double {
        get { jsObject[.valueAsNumber].fromJSValue()!}
        set { jsObject[.valueAsNumber] = newValue.jsValue }
    }
    
    public var width: UInt32 {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }
    
    @inlinable public func stepUp(n: Int32? = nil) {
        let this = jsObject
        _ = this[.stepUp].function!(this: this, arguments: [_toJSValue(n)])
    }
    
    @inlinable public func stepDown(n: Int32? = nil) {
        let this = jsObject
        _ = this[.stepDown].function!(this: this, arguments: [_toJSValue(n)])
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
    
    public var labels: NodeList? {
        jsObject[.labels].fromJSValue()
    }
    
    @inlinable public func select() {
        let this = jsObject
        _ = this[.select].function!(this: this, arguments: [])
    }
    
    public var selectionStart: UInt32? {
        get { jsObject[.selectionStart].fromJSValue()}
        set { jsObject[.selectionStart] = newValue.jsValue }
    }
    
    public var selectionEnd: UInt32? {
        get { jsObject[.selectionEnd].fromJSValue()}
        set { jsObject[.selectionEnd] = newValue.jsValue }
    }
    
    public var selectionDirection: String? {
        get { jsObject[.selectionDirection].fromJSValue()}
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
    
    @inlinable public func showPicker() {
        let this = jsObject
        _ = this[.showPicker].function!(this: this, arguments: [])
    }
    
    public var align: String {
        get { jsObject[.align].fromJSValue()!}
        set { jsObject[.align] = newValue.jsValue }
    }
    
    public var useMap: String {
        get { jsObject[.useMap].fromJSValue()!}
        set { jsObject[.useMap] = newValue.jsValue }
    }
}
