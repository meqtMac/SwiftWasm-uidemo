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

public class HTMLObjectElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLObjectElement].function }

    public var data: String {
        get { jsObject[.data].fromJSValue()!}
        set { jsObject[.data] = newValue.jsValue }
    }

    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }

    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }

public var form: HTMLFormElement? {
jsObject[.form].fromJSValue()
    }

    public var width: String {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }

    public var height: String {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }

public var contentDocument: Document? {
jsObject[.contentDocument].fromJSValue()
    }

public var contentWindow: WindowProxy? {
jsObject[.contentWindow].fromJSValue()
    }

    @inlinable public func getSVGDocument() -> Document? {
        let this = jsObject
        return this[.getSVGDocument].function!(this: this, arguments: []).fromJSValue()
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

    public var align: String {
        get { jsObject[.align].fromJSValue()!}
        set { jsObject[.align] = newValue.jsValue }
    }

    public var archive: String {
        get { jsObject[.archive].fromJSValue()!}
        set { jsObject[.archive] = newValue.jsValue }
    }

    public var code: String {
        get { jsObject[.code].fromJSValue()!}
        set { jsObject[.code] = newValue.jsValue }
    }

    public var declare: Bool {
        get { jsObject[.declare].fromJSValue()!}
        set { jsObject[.declare] = newValue.jsValue }
    }

    public var hspace: UInt32 {
        get { jsObject[.hspace].fromJSValue()!}
        set { jsObject[.hspace] = newValue.jsValue }
    }

    public var standby: String {
        get { jsObject[.standby].fromJSValue()!}
        set { jsObject[.standby] = newValue.jsValue }
    }

    public var vspace: UInt32 {
        get { jsObject[.vspace].fromJSValue()!}
        set { jsObject[.vspace] = newValue.jsValue }
    }

    public var codeBase: String {
        get { jsObject[.codeBase].fromJSValue()!}
        set { jsObject[.codeBase] = newValue.jsValue }
    }

    public var codeType: String {
        get { jsObject[.codeType].fromJSValue()!}
        set { jsObject[.codeType] = newValue.jsValue }
    }

    public var useMap: String {
        get { jsObject[.useMap].fromJSValue()!}
        set { jsObject[.useMap] = newValue.jsValue }
    }

    public var border: String {
        get { jsObject[.border].fromJSValue()!}
        set { jsObject[.border] = newValue.jsValue }
    }
}
