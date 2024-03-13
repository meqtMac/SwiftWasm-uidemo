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

public class HTMLOutputElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLOutputElement].function }
    
    public var htmlFor: DOMTokenList {
        jsObject[.htmlFor].fromJSValue()!
    }
    
    public var form: HTMLFormElement? {
        jsObject[.form].fromJSValue()
    }
    
    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
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
