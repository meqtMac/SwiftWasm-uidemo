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

public class HTMLProgressElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLProgressElement].function }

    public var value: Double {
        get { jsObject[.value].fromJSValue()!}
        set { jsObject[.value] = newValue.jsValue }
    }

    public var max: Double {
        get { jsObject[.max].fromJSValue()!}
        set { jsObject[.max] = newValue.jsValue }
    }

public var position: Double {
jsObject[.position].fromJSValue()!
    }

public var labels: NodeList {
jsObject[.labels].fromJSValue()!
    }
}
