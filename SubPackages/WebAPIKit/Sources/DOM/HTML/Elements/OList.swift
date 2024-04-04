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

public class HTMLOListElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLOListElement].function }

    public var reversed: Bool {
        get { jsObject[.reversed].fromJSValue()!}
        set { jsObject[.reversed] = newValue.jsValue }
    }

    public var start: Int32 {
        get { jsObject[.start].fromJSValue()!}
        set { jsObject[.start] = newValue.jsValue }
    }

    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }

    public var compact: Bool {
        get { jsObject[.compact].fromJSValue()!}
        set { jsObject[.compact] = newValue.jsValue }
    }
}
