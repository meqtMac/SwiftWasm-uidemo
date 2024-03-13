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

public class HTMLButtonElement: HTMLElement, PopoverInvokerElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLButtonElement].function }

    public var disabled: Bool {
        get { jsObject[.disabled].fromJSValue()!}
        set { jsObject[.disabled] = newValue.jsValue }
    }

public var form: HTMLFormElement? {
jsObject[.form].fromJSValue()
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

    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }

    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
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
