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

public class HTMLDataListElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLDataListElement].function }

    public var options: HTMLCollection {
        jsObject[.options].fromJSValue()!
    }
}
