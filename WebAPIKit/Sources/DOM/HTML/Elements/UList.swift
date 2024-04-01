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

public class HTMLUListElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLUListElement].function }

    public var compact: Bool {
        get { jsObject[.compact].fromJSValue()! }
        set { jsObject[.compact] = newValue.jsValue }
    }

    public var type: String {
        get { jsObject[.type].fromJSValue()! }
        set { jsObject[.type] = newValue.jsValue }
    }
}
