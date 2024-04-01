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

public class HTMLParagraphElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLParagraphElement].function }

    public var align: String {
        get { jsObject[.align].fromJSValue()!}
        set { jsObject[.align] = newValue.jsValue }
    }
}
