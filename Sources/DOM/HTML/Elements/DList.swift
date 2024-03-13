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

public class HTMLDListElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLDListElement].function }

    public var compact: Bool {
        get { jsObject[.compact].fromJSValue()!}
        set { jsObject[.compact] = newValue.jsValue }
 
    }
}
