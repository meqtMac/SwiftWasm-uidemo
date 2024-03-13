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


public class HTMLBaseElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLBaseElement].function }
    
    public var href: String {
        get { jsObject[.href].fromJSValue()!}
        set { jsObject[.href] = newValue.jsValue }
    }
    
    public var target: String {
        get { jsObject[.target].fromJSValue()!}
        set { jsObject[.target] = newValue.jsValue }
        
    }
}
