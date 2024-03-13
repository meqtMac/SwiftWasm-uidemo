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


public protocol HTMLHyperlinkElementUtils: JSBridgedClass {}
public extension HTMLHyperlinkElementUtils {
    @inlinable var href: String {
        get { jsObject[.href].fromJSValue()! }
        nonmutating set { jsObject[.href] = _toJSValue(newValue) }
    }

    @inlinable var origin: String { jsObject[.origin].fromJSValue()! }

    @inlinable var `protocol`: String {
        get { jsObject[.protocol].fromJSValue()! }
        nonmutating set { jsObject[.protocol] = _toJSValue(newValue) }
    }

    @inlinable var username: String {
        get { jsObject[.username].fromJSValue()! }
        nonmutating set { jsObject[.username] = _toJSValue(newValue) }
    }

    @inlinable var password: String {
        get { jsObject[.password].fromJSValue()! }
        nonmutating set { jsObject[.password] = _toJSValue(newValue) }
    }

    @inlinable var host: String {
        get { jsObject[.host].fromJSValue()! }
        nonmutating set { jsObject[.host] = _toJSValue(newValue) }
    }

    @inlinable var hostname: String {
        get { jsObject[.hostname].fromJSValue()! }
        nonmutating set { jsObject[.hostname] = _toJSValue(newValue) }
    }

    @inlinable var port: String {
        get { jsObject[.port].fromJSValue()! }
        nonmutating set { jsObject[.port] = _toJSValue(newValue) }
    }

    @inlinable var pathname: String {
        get { jsObject[.pathname].fromJSValue()! }
        nonmutating set { jsObject[.pathname] = _toJSValue(newValue) }
    }

    @inlinable var search: String {
        get { jsObject[.search].fromJSValue()! }
        nonmutating set { jsObject[.search] = _toJSValue(newValue) }
    }

    @inlinable var hash: String {
        get { jsObject[.hash].fromJSValue()! }
        nonmutating set { jsObject[.hash] = _toJSValue(newValue) }
    }
}
