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

public class HTMLStyleElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLStyleElement].function }

    public var disabled: Bool {
        get { jsObject[.disabled].fromJSValue()!}
        set { jsObject[.disabled] = newValue.jsValue }
    }

    public var media: String {
        get { jsObject[.media].fromJSValue()!}
        set { jsObject[.media] = newValue.jsValue }
    }

    public var blocking: DOMTokenList {
        jsObject[.blocking].fromJSValue()!
    }

    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
 
    }
}

