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

public class HTMLLabelElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLLabelElement].function }

    public var form: HTMLFormElement? {
        jsObject[.form].fromJSValue()
    }

    public var htmlFor: String {
        get { jsObject[.htmlFor].fromJSValue()!}
        set { jsObject[.htmlFor] = newValue.jsValue }
    }

    public var control: HTMLElement? {
        jsObject[.control].fromJSValue()
    }
}

