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


public class HTMLTimeElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTimeElement].function }
    
    public var dateTime: String {
        get { jsObject[.dateTime].fromJSValue()!}
        set { jsObject[.dateTime] = newValue.jsValue }
    }
}
