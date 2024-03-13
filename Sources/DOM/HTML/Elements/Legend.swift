//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

//import ECMAScript
//import JavaScriptBigIntSupport
//import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


public class HTMLLegendElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLLegendElement].function }

    public var form: HTMLFormElement? {
        jsObject[.form].fromJSValue()
    }

    public var align: String {
        get { jsObject[.align].fromJSValue()!}
        set { jsObject[.align] = newValue.jsValue }
    }
}
