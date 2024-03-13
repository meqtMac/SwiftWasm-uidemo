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

public class HTMLMeterElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLMeterElement].function }

    public var value: Double {
        get { jsObject[.value].fromJSValue()!}
        set { jsObject[.value] = newValue.jsValue }
    }

    public var min: Double {
        get { jsObject[.min].fromJSValue()!}
        set { jsObject[.min] = newValue.jsValue }
    }

    public var max: Double {
        get { jsObject[.max].fromJSValue()!}
        set { jsObject[.max] = newValue.jsValue }
    }

    public var low: Double {
        get { jsObject[.low].fromJSValue()!}
        set { jsObject[.low] = newValue.jsValue }
    }

    public var high: Double {
        get { jsObject[.high].fromJSValue()!}
        set { jsObject[.high] = newValue.jsValue }
    }

    public var optimum: Double {
        get { jsObject[.optimum].fromJSValue()!}
        set { jsObject[.optimum] = newValue.jsValue }
    }

public var labels: NodeList {
jsObject[.labels].fromJSValue()!
    }
}
