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


public class HTMLAreaElement: HTMLElement, HTMLHyperlinkElementUtils {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLAreaElement].function }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    public var alt: String {
        get { jsObject[.alt].fromJSValue()!}
        set { jsObject[.alt] = newValue.jsValue }
    }

    public var coords: String {
        get { jsObject[.coords].fromJSValue()!}
        set { jsObject[.coords] = newValue.jsValue }
    }

    public var shape: String {
        get { jsObject[.shape].fromJSValue()!}
        set { jsObject[.shape] = newValue.jsValue }
    }

    public var target: String {
        get { jsObject[.target].fromJSValue()!}
        set { jsObject[.target] = newValue.jsValue }
    }

    public var download: String {
        get { jsObject[.download].fromJSValue()!}
        set { jsObject[.download] = newValue.jsValue }
    }

    public var ping: String {
        get { jsObject[.ping].fromJSValue()!}
        set { jsObject[.ping] = newValue.jsValue }
    }

    public var rel: String {
        get { jsObject[.rel].fromJSValue()!}
        set { jsObject[.rel] = newValue.jsValue }
    }

public var relList: DOMTokenList {
jsObject[.relList].fromJSValue()!
    }

    public var referrerPolicy: String {
        get { jsObject[.referrerPolicy].fromJSValue()!}
        set { jsObject[.referrerPolicy] = newValue.jsValue }
    }

    public var noHref: Bool {
        get { jsObject[.noHref].fromJSValue()!}
        set { jsObject[.noHref] = newValue.jsValue }
    }
}
