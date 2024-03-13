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

public class HTMLIFrameElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLIFrameElement].function }
    
    public var src: String {
        get { jsObject[.src].fromJSValue()!}
        set { jsObject[.src] = newValue.jsValue }
    }
    
    public var srcdoc: String {
        get { jsObject[.srcdoc].fromJSValue()!}
        set { jsObject[.srcdoc] = newValue.jsValue }
    }
    
    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }
    
    public var sandbox: DOMTokenList {
        jsObject[.sandbox].fromJSValue()!
    }
    
    public var allow: String {
        get { jsObject[.allow].fromJSValue()!}
        set { jsObject[.allow] = newValue.jsValue }
    }
    
    public var allowFullscreen: Bool {
        get { jsObject[.allowFullscreen].fromJSValue()!}
        set { jsObject[.allowFullscreen] = newValue.jsValue }
    }
    
    public var width: String {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }
    
    public var height: String {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }
    
    public var referrerPolicy: String {
        get { jsObject[.referrerPolicy].fromJSValue()!}
        set { jsObject[.referrerPolicy] = newValue.jsValue }
    }
    
    public var loading: String {
        get { jsObject[.loading].fromJSValue()!}
        set { jsObject[.loading] = newValue.jsValue }
    }
    
    public var contentDocument: Document? {
        jsObject[.contentDocument].fromJSValue()
    }
    
    public var contentWindow: WindowProxy? {
        jsObject[.contentWindow].fromJSValue()
    }
    
    @inlinable public func getSVGDocument() -> Document? {
        let this = jsObject
        return this[.getSVGDocument].function!(this: this, arguments: []).fromJSValue()
    }
    
    public var align: String {
        get { jsObject[.align].fromJSValue()!}
        set { jsObject[.align] = newValue.jsValue }
    }
    
    public var scrolling: String {
        get { jsObject[.scrolling].fromJSValue()!}
        set { jsObject[.scrolling] = newValue.jsValue }
    }
    
    public var frameBorder: String {
        get { jsObject[.frameBorder].fromJSValue()!}
        set { jsObject[.frameBorder] = newValue.jsValue }
    }
    
    public var longDesc: String {
        get { jsObject[.longDesc].fromJSValue()!}
        set { jsObject[.longDesc] = newValue.jsValue }
    }
    
    public var marginHeight: String {
        get { jsObject[.marginHeight].fromJSValue()!}
        set { jsObject[.marginHeight] = newValue.jsValue }
    }
    
    public var marginWidth: String {
        get { jsObject[.marginWidth].fromJSValue()!}
        set { jsObject[.marginWidth] = newValue.jsValue }
    }
}
