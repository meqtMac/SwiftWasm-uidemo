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

public class HTMLTitleElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTitleElement].function }

    public var text: String {
        get { jsObject[.text].fromJSValue()!}
        set { jsObject[.text] = newValue.jsValue }
    }
}

