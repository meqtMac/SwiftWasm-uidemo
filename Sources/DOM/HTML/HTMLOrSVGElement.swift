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

public protocol HTMLOrSVGElement: JSBridgedClass {}
public extension HTMLOrSVGElement {
    @inlinable var dataset: DOMStringMap { jsObject[.dataset].fromJSValue()! }

    @inlinable var nonce: String {
        get { jsObject[.nonce].fromJSValue()! }
        nonmutating set { jsObject[.nonce] = _toJSValue(newValue) }
    }

    @inlinable var autofocus: Bool {
        get { jsObject[.autofocus].fromJSValue()! }
        nonmutating set { jsObject[.autofocus] = _toJSValue(newValue) }
    }

    @inlinable var tabIndex: Int32 {
        get { jsObject[.tabIndex].fromJSValue()! }
        nonmutating set { jsObject[.tabIndex] = _toJSValue(newValue) }
    }

    @inlinable func focus(options: FocusOptions? = nil) {
        let this = jsObject
        _ = this[.focus].function!(this: this, arguments: [_toJSValue(options)])
    }

    @inlinable func blur() {
        let this = jsObject
        _ = this[.blur].function!(this: this, arguments: [])
    }
}