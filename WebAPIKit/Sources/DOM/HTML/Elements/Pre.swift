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

public class HTMLPreElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLPreElement].function }

    public var width: Int32 {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }
}
