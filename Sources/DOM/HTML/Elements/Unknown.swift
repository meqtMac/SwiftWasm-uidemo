//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public class HTMLUnknownElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLUnknownElement].function }
}
