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

public class HTMLSourceElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLSourceElement].function }

    public var src: String {
        get { jsObject[.src].fromJSValue()!}
        set { jsObject[.src] = newValue.jsValue }
    }

    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }

    public var srcset: String {
        get { jsObject[.srcset].fromJSValue()!}
        set { jsObject[.srcset] = newValue.jsValue }
    }

    public var sizes: String {
        get { jsObject[.sizes].fromJSValue()!}
        set { jsObject[.sizes] = newValue.jsValue }
    }

    public var media: String {
        get { jsObject[.media].fromJSValue()!}
        set { jsObject[.media] = newValue.jsValue }
    }

    public var width: UInt32 {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }

    public var height: UInt32 {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }
}

