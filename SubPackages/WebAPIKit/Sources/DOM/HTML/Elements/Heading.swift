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

public class HTMLHeadingElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLHeadingElement].function }

    public var align: String {
        get { jsObject[.align].fromJSValue()!}
        set { jsObject[.align] = newValue.jsValue }
    }
}
