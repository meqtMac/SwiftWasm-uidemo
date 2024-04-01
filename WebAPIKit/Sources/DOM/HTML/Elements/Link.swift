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

public class HTMLLinkElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLLinkElement].function }

    public var href: String {
        get { jsObject[.href].fromJSValue()!}
        set { jsObject[.href] = newValue.jsValue }
    }

    public var crossOrigin: String? {
        get { jsObject[.crossOrigin].fromJSValue()}
        set { jsObject[.crossOrigin] = newValue.jsValue }
    }

    public var rel: String {
        get { jsObject[.rel].fromJSValue()!}
        set { jsObject[.rel] = newValue.jsValue }
    }

    public var `as`: String {
        get { jsObject[.`as`].fromJSValue()!}
        set { jsObject[.`as`] = newValue.jsValue }
    }

public var relList: DOMTokenList {
jsObject[.relList].fromJSValue()!
    }

    public var media: String {
        get { jsObject[.media].fromJSValue()!}
        set { jsObject[.media] = newValue.jsValue }
    }

    public var integrity: String {
        get { jsObject[.integrity].fromJSValue()!}
        set { jsObject[.integrity] = newValue.jsValue }
    }

    public var hreflang: String {
        get { jsObject[.hreflang].fromJSValue()!}
        set { jsObject[.hreflang] = newValue.jsValue }
    }

    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }

public var sizes: DOMTokenList {
jsObject[.sizes].fromJSValue()!
    }

    public var imageSrcset: String {
        get { jsObject[.imageSrcset].fromJSValue()!}
        set { jsObject[.imageSrcset] = newValue.jsValue }
    }

    public var imageSizes: String {
        get { jsObject[.imageSizes].fromJSValue()!}
        set { jsObject[.imageSizes] = newValue.jsValue }
    }

    public var referrerPolicy: String {
        get { jsObject[.referrerPolicy].fromJSValue()!}
        set { jsObject[.referrerPolicy] = newValue.jsValue }
    }

public var blocking: DOMTokenList {
jsObject[.blocking].fromJSValue()!
    }

    public var disabled: Bool {
        get { jsObject[.disabled].fromJSValue()!}
        set { jsObject[.disabled] = newValue.jsValue }
    }

    public var fetchPriority: String {
        get { jsObject[.fetchPriority].fromJSValue()!}
        set { jsObject[.fetchPriority] = newValue.jsValue }
    }

    public var charset: String {
        get { jsObject[.charset].fromJSValue()!}
        set { jsObject[.charset] = newValue.jsValue }
    }

    public var rev: String {
        get { jsObject[.rev].fromJSValue()!}
        set { jsObject[.rev] = newValue.jsValue }
    }

    public var target: String {
        get { jsObject[.target].fromJSValue()!}
        set { jsObject[.target] = newValue.jsValue }
    }
}
