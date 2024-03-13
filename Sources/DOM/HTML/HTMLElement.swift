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

public class HTMLElement: Element,
                          GlobalEventHandlers,
                          ElementContentEditable,
                          HTMLOrSVGElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLElement].function }
    
    public var title: String {
        get { jsObject[.title].fromJSValue()! }
        set { jsObject[.title] = newValue.jsValue }
    }
    
    public var lang: String {
        get { jsObject[.lang].fromJSValue()! }
        set { jsObject[.lang] = newValue.jsValue }
    }
    
    public var translate: Bool {
        get { jsObject[.translate].fromJSValue()! }
        set { jsObject[.translate] = newValue.jsValue }
    }
    
    public var dir: String {
        get { jsObject[.dir].fromJSValue()! }
        set { jsObject[.dir] = newValue.jsValue }
    }
    
    public var hidden: HiddenState? {
        get { jsObject[.hidden].fromJSValue() }
        set { jsObject[.hidden] = newValue.jsValue }
    }
    
    public var inert: Bool {
        get { jsObject[.inert].fromJSValue()! }
        set { jsObject[.inert] = newValue.jsValue }
    }
    
    @inlinable public func click() {
        let this = jsObject
        _ = this[.click].function!(this: this, arguments: [])
    }
    
    public var accessKey: String {
        get { jsObject[.accessKey].fromJSValue()! }
        set { jsObject[.accessKey] = newValue.jsValue }
        
    }
    
    public var accessKeyLabel: String {
        get { jsObject[.accessKeyLabel].fromJSValue()! }
        set { jsObject[.accessKeyLabel] = newValue.jsValue }
    }
    
    public var draggable: Bool {
        get { jsObject[.draggable].fromJSValue()! }
        set { jsObject[.draggable] = newValue.jsValue }
    }
    
    public var spellcheck: Bool {
        get { jsObject[.spellcheck].fromJSValue()! }
        set { jsObject[.spellcheck] = newValue.jsValue }
    }
    
    public var autocapitalize: String {
        get { jsObject[.autocapitalize].fromJSValue()! }
        set { jsObject[.autocapitalize] = newValue.jsValue }
    }
    
    public var innerText: String {
        get { jsObject[.innerText].fromJSValue()! }
        set { jsObject[.innerText] = newValue.jsValue }
    }
    
    public var outerText: String {
        get { jsObject[.outerText].fromJSValue()! }
        set { jsObject[.outerText] = newValue.jsValue }
    }
    
    @inlinable public func attachInternals() -> ElementInternals {
        let this = jsObject
        return this[.attachInternals].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func showPopover() {
        let this = jsObject
        _ = this[.showPopover].function!(this: this, arguments: [])
    }
    
    @inlinable public func hidePopover() {
        let this = jsObject
        _ = this[.hidePopover].function!(this: this, arguments: [])
    }
    
    @inlinable public func togglePopover(force: Bool? = nil) -> Bool {
        let this = jsObject
        return this[.togglePopover].function!(this: this, arguments: [_toJSValue(force)]).fromJSValue()!
    }
    
    public var popover: String? {
        get { jsObject[.popover].fromJSValue() }
        set { jsObject[.popover] = newValue.jsValue }
    }
    
    public var offsetParent: Element? {
        jsObject[.offsetParent].fromJSValue()
    }
    
    public var offsetTop: Int32 {
        jsObject[.offsetTop].fromJSValue()!
    }
    
    public var offsetLeft: Int32 {
        jsObject[.offsetLeft].fromJSValue()!
    }
    
    public var offsetWidth: Int32 {
        jsObject[.offsetWidth].fromJSValue()!
    }
    
    public var offsetHeight: Int32 {
        jsObject[.offsetHeight].fromJSValue()!
    }
}

public class ElementInternals: JSBridgedClass, ARIAMixin {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ElementInternals].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var shadowRoot: ShadowRoot? {
        jsObject[.shadowRoot].fromJSValue()
    }
    
    @inlinable public func setFormValue(value: File_or_FormData_or_String?, state: File_or_FormData_or_String? = nil) {
        let this = jsObject
        _ = this[.setFormValue].function!(this: this, arguments: [_toJSValue(value), _toJSValue(state)])
    }
    
    public var form: HTMLFormElement? {
        jsObject[.form].fromJSValue()
    }
    
    @inlinable public func setValidity(flags: ValidityStateFlags? = nil, message: String? = nil, anchor: HTMLElement? = nil) {
        let this = jsObject
        _ = this[.setValidity].function!(this: this, arguments: [_toJSValue(flags), _toJSValue(message), _toJSValue(anchor)])
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
    
    public var labels: NodeList {
        jsObject[.labels].fromJSValue()!
    }
}

extension ElementInternals {
    public enum File_or_FormData_or_String: JSValueCompatible {
        case file(File)
        case formData(FormData)
        case string(String)
        
        public static func construct(from value: JSValue) -> Self? {
            if let file: File = value.fromJSValue() {
                return .file(file)
            }
            if let formData: FormData = value.fromJSValue() {
                return .formData(formData)
            }
            if let string: String = value.fromJSValue() {
                return .string(string)
            }
            return nil
        }
        
        public var jsValue: JSValue {
            switch self {
            case let .file(file):
                return file.jsValue
            case let .formData(formData):
                return formData.jsValue
            case let .string(string):
                return string.jsValue
            }
        }
    }
}

public protocol ElementContentEditable: JSBridgedClass {}
public extension ElementContentEditable {
    @inlinable var contentEditable: String {
        get { jsObject[.contentEditable].fromJSValue()! }
        set { jsObject[.contentEditable] = _toJSValue(newValue) }
    }
    
    @inlinable var enterKeyHint: String {
        get { jsObject[.enterKeyHint].fromJSValue()! }
        set { jsObject[.enterKeyHint] = _toJSValue(newValue) }
    }
    
    @inlinable var isContentEditable: Bool { jsObject[.isContentEditable].fromJSValue()! }
    
    @inlinable var inputMode: String {
        get { jsObject[.inputMode].fromJSValue()! }
        set { jsObject[.inputMode] = _toJSValue(newValue) }
    }
}


extension HTMLElement {
    public enum HiddenState: JSValueCompatible {
        case `true`
        case `false`
        case untilFound
        public static func construct(from value: JSValue) -> Self? {
            if let bool: Bool = value.fromJSValue() {
                return bool ? .true : .false
            }
            if let string: String = value.fromJSValue(), string == "until-found" {
                return .untilFound
            }
            return nil
        }
        
        public var jsValue: JSValue {
            switch self {
            case .false:
                return false.jsValue
            case .true:
                return true.jsValue
            case .untilFound:
                return "until-found".jsValue
            }
        }
        
    }
}
