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

public class HTMLOptionElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLOptionElement].function }
    
    public var disabled: Bool {
        get { jsObject[.disabled].fromJSValue()!}
        set { jsObject[.disabled] = newValue.jsValue }
    }
    
    public var form: HTMLFormElement? {
        jsObject[.form].fromJSValue()
    }
    
    public var label: String {
        get { jsObject[.label].fromJSValue()!}
        set { jsObject[.label] = newValue.jsValue }
    }
    
    public var defaultSelected: Bool {
        get { jsObject[.defaultSelected].fromJSValue()!}
        set { jsObject[.defaultSelected] = newValue.jsValue }
    }
    
    public var selected: Bool {
        get { jsObject[.selected].fromJSValue()!}
        set { jsObject[.selected] = newValue.jsValue }
    }
    
    public var value: String {
        get { jsObject[.value].fromJSValue()!}
        set { jsObject[.value] = newValue.jsValue }
    }
    
    public var text: String {
        get { jsObject[.text].fromJSValue()!}
        set { jsObject[.text] = newValue.jsValue }
    }
    
    public var index: Int32 {
        jsObject[.index].fromJSValue()!
    }
}
