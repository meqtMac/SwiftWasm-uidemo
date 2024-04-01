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

public class HTMLDialogElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLDialogElement].function }

    public var open: Bool {
        get { jsObject[.open].fromJSValue()! }
        set { jsObject[.open] = newValue.jsValue }
    }

    public var returnValue: String {
        get { jsObject[.returnValue].fromJSValue()!}
        set { jsObject[.returnValue] = newValue.jsValue }
    }

    @inlinable public func show() {
        let this = jsObject
        _ = this[.show].function!(this: this, arguments: [])
    }

    @inlinable public func showModal() {
        let this = jsObject
        _ = this[.showModal].function!(this: this, arguments: [])
    }

    @inlinable public func close(returnValue: String? = nil) {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [_toJSValue(returnValue)])
    }
}
