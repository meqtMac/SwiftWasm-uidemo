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


public class HTMLAnchorElement: HTMLElement, HTMLHyperlinkElementUtils {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLAnchorElement].function }

//    public var target: String {
//        get { jsObject[.target].fromJSValue()!}
//        set { jsObject[.target] = newValue.jsValue }
//    }

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

//    public var hreflang: String {
//        get { jsObject[.hreflang].fromJSValue()!}
//        set { jsObject[.hreflang] = newValue.jsValue }
//    }

    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }
//
//    public var text: String {
//        get { jsObject[.text].fromJSValue()!}
//        set { jsObject[.text] = newValue.jsValue }
//   }

    public var referrerPolicy: String {
        get { jsObject[.referrerPolicy].fromJSValue()!}
        set { jsObject[.slot] = newValue.jsValue }
    }

//    public var coords: String {
//        get { jsObject[.coords].fromJSValue()!}
//        set { jsObject[.coords] = newValue.jsValue }
//    }

//    public var charset: String {
//        get { jsObject[.charset].fromJSValue()!}
//        set { jsObject[.charset] = newValue.jsValue }
// 
//    }

//    public var name: String {
//        get { jsObject[.name].fromJSValue()!}
//        set { jsObject[.name] = newValue.jsValue }
//    }

//    public var rev: String {
//        get { jsObject[.rev].fromJSValue()!}
//        set { jsObject[.rev] = newValue.jsValue }
//    }

    public var shape: String {
        get { jsObject[.shape].fromJSValue()!}
        set { jsObject[.shape] = newValue.jsValue }
    }
}
