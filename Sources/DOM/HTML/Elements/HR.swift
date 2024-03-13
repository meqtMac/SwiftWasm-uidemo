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

public class HTMLHRElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLHRElement].function }

    public var align: String {
        get { jsObject[.align].fromJSValue()!}
        set { jsObject[.align] = newValue.jsValue }
    }

    public var color: String {
        get { jsObject[.color].fromJSValue()!}
        set { jsObject[.color] = newValue.jsValue }
    }

    public var noShade: Bool {
        get { jsObject[.noShade].fromJSValue()!}
        set { jsObject[.noShade] = newValue.jsValue }
    }

    public var size: String {
        get { jsObject[.size].fromJSValue()!}
        set { jsObject[.size] = newValue.jsValue }
    }

    public var width: String {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }
}
