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

public class HTMLScriptElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLScriptElement].function }

    public var src: String {
        get { jsObject[.src].fromJSValue()!}
        set { jsObject[.src] = newValue.jsValue }
    }

    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }

    public var noModule: Bool {
        get { jsObject[.noModule].fromJSValue()!}
        set { jsObject[.noModule] = newValue.jsValue }
    }

    public var async: Bool {
        get { jsObject[.async].fromJSValue()!}
        set { jsObject[.async] = newValue.jsValue }
    }

    public var `defer`: Bool {
        get { jsObject[.`defer`].fromJSValue()!}
        set { jsObject[.`defer`] = newValue.jsValue }
    }

    public var crossOrigin: String? {
        get { jsObject[.crossOrigin].fromJSValue()}
        set { jsObject[.crossOrigin] = newValue.jsValue }
    }

    public var text: String {
        get { jsObject[.text].fromJSValue()!}
        set { jsObject[.text] = newValue.jsValue }
    }

    public var integrity: String {
        get { jsObject[.integrity].fromJSValue()!}
        set { jsObject[.integrity] = newValue.jsValue }
    }

    public var referrerPolicy: String {
        get { jsObject[.referrerPolicy].fromJSValue()!}
        set { jsObject[.referrerPolicy] = newValue.jsValue }
    }

public var blocking: DOMTokenList {
jsObject[.blocking].fromJSValue()!
    }

    public var fetchPriority: String {
        get { jsObject[.fetchPriority].fromJSValue()!}
        set { jsObject[.fetchPriority] = newValue.jsValue }
    }

    @inlinable public class func supports(type: String) -> Bool {
        let this = constructor!
        return this[.supports].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }

    public var charset: String {
        get { jsObject[.charset].fromJSValue()!}
        set { jsObject[.charset] = newValue.jsValue }
    }

    public var event: String {
        get { jsObject[.event].fromJSValue()!}
        set { jsObject[.event] = newValue.jsValue }
    }

    public var htmlFor: String {
        get { jsObject[.htmlFor].fromJSValue()!}
        set { jsObject[.htmlFor] = newValue.jsValue }
    }
}
