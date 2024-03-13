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

public class HTMLOptGroupElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLOptGroupElement].function }

    public var disabled: Bool {
        get { jsObject[.disabled].fromJSValue()!}
        set { jsObject[.disabled] = newValue.jsValue }
    }

    public var label: String {
        get { jsObject[.label].fromJSValue()!}
        set { jsObject[.label] = newValue.jsValue }
    }
}
