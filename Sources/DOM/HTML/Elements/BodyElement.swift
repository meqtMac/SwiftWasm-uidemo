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

public class HTMLBodyElement: HTMLElement, WindowEventHandlers {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLBodyElement].function }

    public var text: String {
        get { jsObject[.text].fromJSValue()!}
        set { jsObject[.text] = newValue.jsValue }
    }

    public var link: String {
        get { jsObject[.link].fromJSValue()!}
        set { jsObject[.link] = newValue.jsValue }
    }

    public var vLink: String {
        get { jsObject[.vLink].fromJSValue()!}
        set { jsObject[.vLink] = newValue.jsValue }
    }

    public var aLink: String {
        get { jsObject[.aLink].fromJSValue()!}
        set { jsObject[.aLink] = newValue.jsValue }
    }

    public var bgColor: String {
        get { jsObject[.bgColor].fromJSValue()!}
        set { jsObject[.bgColor] = newValue.jsValue }
    }

    public var background: String {
        get { jsObject[.background].fromJSValue()!}
        set { jsObject[.background] = newValue.jsValue }
    }
}
