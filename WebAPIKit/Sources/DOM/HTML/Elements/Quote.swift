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


public class HTMLQuoteElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLQuoteElement].function }

    public var cite: String {
        get { jsObject[.cite].fromJSValue()!}
        set { jsObject[.cite] = newValue.jsValue }
    }
}
