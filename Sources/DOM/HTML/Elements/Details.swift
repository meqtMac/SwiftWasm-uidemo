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

public class HTMLDetailsElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLDetailsElement].function }

    public var open: Bool {
        get { jsObject[.open].fromJSValue()!}
        set { jsObject[.open] = newValue.jsValue }
    }
}
