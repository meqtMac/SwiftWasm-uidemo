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

public class HTMLFormElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLFormElement].function }

    public var acceptCharset: String {
        get { jsObject[.acceptCharset].fromJSValue()!}
        set { jsObject[.acceptCharset] = newValue.jsValue }
    }

    public var action: String {
        get { jsObject[.action].fromJSValue()!}
        set { jsObject[.action] = newValue.jsValue }
    }

    public var autocomplete: String {
        get { jsObject[.autocomplete].fromJSValue()!}
        set { jsObject[.autocomplete] = newValue.jsValue }
    }

    public var enctype: String {
        get { jsObject[.enctype].fromJSValue()!}
        set { jsObject[.enctype] = newValue.jsValue }
    }

    public var encoding: String {
        get { jsObject[.encoding].fromJSValue()!}
        set { jsObject[.encoding] = newValue.jsValue }
    }

    public var method: String {
        get { jsObject[.method].fromJSValue()!}
        set { jsObject[.method] = newValue.jsValue }
    }

    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }

    public var noValidate: Bool {
        get { jsObject[.noValidate].fromJSValue()!}
        set { jsObject[.noValidate] = newValue.jsValue }
    }

    public var target: String {
        get { jsObject[.target].fromJSValue()!}
        set { jsObject[.target] = newValue.jsValue }
    }

    public var rel: String {
        get { jsObject[.rel].fromJSValue()!}
        set { jsObject[.rel] = newValue.jsValue }
    }

public var relList: DOMTokenList {
jsObject[.relList].fromJSValue()!
    }

public var elements: HTMLFormControlsCollection {
jsObject[.elements].fromJSValue()!
    }

public var length: UInt32 {
jsObject[.length].fromJSValue()!
    }

    @inlinable public subscript(key: Int) -> Element {
        jsObject[key].fromJSValue()!
    }

    @inlinable public subscript(key: String) -> Element_or_RadioNodeList {
        jsObject[key].fromJSValue()!
    }

    @inlinable public func submit() {
        let this = jsObject
        _ = this[.submit].function!(this: this, arguments: [])
    }

    @inlinable public func requestSubmit(submitter: HTMLElement? = nil) {
        let this = jsObject
        _ = this[.requestSubmit].function!(this: this, arguments: [_toJSValue(submitter)])
    }

    @inlinable public func reset() {
        let this = jsObject
        _ = this[.reset].function!(this: this, arguments: [])
    }

    @inlinable public func checkValidity() -> Bool {
        let this = jsObject
        return this[.checkValidity].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func reportValidity() -> Bool {
        let this = jsObject
        return this[.reportValidity].function!(this: this, arguments: []).fromJSValue()!
    }
}

public enum Element_or_RadioNodeList: JSValueCompatible {
    case element(Element)
    case radioNodeList(RadioNodeList)

    public static func construct(from value: JSValue) -> Self? {
        if let element: Element = value.fromJSValue() {
            return .element(element)
        }
        if let radioNodeList: RadioNodeList = value.fromJSValue() {
            return .radioNodeList(radioNodeList)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .element(element):
            return element.jsValue
        case let .radioNodeList(radioNodeList):
            return radioNodeList.jsValue
        }
    }
}
