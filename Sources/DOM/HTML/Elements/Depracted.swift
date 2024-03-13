//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/18.
//

import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


//public class HTMLDirectoryElement: HTMLElement {
//    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLDirectoryElement].function }
//
//    public var compact: Bool {
//        get { jsObject[.compact].fromJSValue()!}
//        set { jsObject[.compact] = newValue.jsValue }
//    }
//}

//public class HTMLFontElement: HTMLElement {
//    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLFontElement].function }
//
//   public var color: String {
//        get { jsObject[.color].fromJSValue()!}
//        set { jsObject[.color] = newValue.jsValue }
//    }
//
//    public var face: String {
//        get { jsObject[.face].fromJSValue()!}
//        set { jsObject[.face] = newValue.jsValue }
// 
//    }
//
//    public var size: String {
//        get { jsObject[.size].fromJSValue()!}
//        set { jsObject[.size] = newValue.jsValue }
//    }
//}

//public class HTMLFrameElement: HTMLElement {
//    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLFrameElement].function }
//    
//    public var name: String {
//        get { jsObject[.name].fromJSValue()!}
//        set { jsObject[.name] = newValue.jsValue }
//    }
//    
//    public var scrolling: String {
//        get { jsObject[.scrolling].fromJSValue()!}
//        set { jsObject[.scrolling] = newValue.jsValue }
//    }
//    
//    public var src: String {
//        get { jsObject[.src].fromJSValue()!}
//        set { jsObject[.src] = newValue.jsValue }
//    }
//    
//    public var frameBorder: String {
//        get { jsObject[.frameBorder].fromJSValue()!}
//        set { jsObject[.frameBorder] = newValue.jsValue }
//    }
//    
//    public var longDesc: String {
//        get { jsObject[.longDesc].fromJSValue()!}
//        set { jsObject[.longDesc] = newValue.jsValue }
//    }
//    
//    public var noResize: Bool {
//        get { jsObject[.noResize].fromJSValue()!}
//        set { jsObject[.noResize] = newValue.jsValue }
//    }
//    
//    public var contentDocument: Document? {
//        jsObject[.contentDocument].fromJSValue()
//    }
//    
//    public var contentWindow: WindowProxy? {
//        jsObject[.contentWindow].fromJSValue()
//    }
//    
//    public var marginHeight: String {
//        get { jsObject[.marginHeight].fromJSValue()!}
//        set { jsObject[.marginHeight] = newValue.jsValue }
//    }
//    
//    public var marginWidth: String {
//        get { jsObject[.marginWidth].fromJSValue()!}
//        set { jsObject[.marginWidth] = newValue.jsValue }
//    }
//}

//public class HTMLFrameSetElement: HTMLElement, WindowEventHandlers {
//    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLFrameSetElement].function }
//
//    public var cols: String {
//        get { jsObject[.cols].fromJSValue()!}
//        set { jsObject[.cols] = newValue.jsValue }
//    }
//
//    public var rows: String {
//        get { jsObject[.rows].fromJSValue()!}
//        set { jsObject[.rows] = newValue.jsValue }
//    }
//}
//public class HTMLMarqueeElement: HTMLElement {
//    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLMarqueeElement].function }
//
//    public var behavior: String {
//        get { jsObject[.behavior].fromJSValue()!}
//        set { jsObject[.behavior] = newValue.jsValue }
//    }
//
//    public var bgColor: String {
//        get { jsObject[.bgColor].fromJSValue()!}
//        set { jsObject[.bgColor] = newValue.jsValue }
//    }
//
//    public var direction: String {
//        get { jsObject[.direction].fromJSValue()!}
//        set { jsObject[.direction] = newValue.jsValue }
//    }
//
//    public var height: String {
//        get { jsObject[.height].fromJSValue()!}
//        set { jsObject[.height] = newValue.jsValue }
//    }
//
//    public var hspace: UInt32 {
//        get { jsObject[.hspace].fromJSValue()!}
//        set { jsObject[.hspace] = newValue.jsValue }
//    }
//
//    public var loop: Int32 {
//        get { jsObject[.loop].fromJSValue()!}
//        set { jsObject[.loop] = newValue.jsValue }
//    }
//
//    public var scrollAmount: UInt32 {
//        get { jsObject[.scrollAmount].fromJSValue()!}
//        set { jsObject[.scrollAmount] = newValue.jsValue }
//    }
//
//    public var scrollDelay: UInt32 {
//        get { jsObject[.scrollDelay].fromJSValue()!}
//        set { jsObject[.scrollDelay] = newValue.jsValue }
//    }
//
//    public var trueSpeed: Bool {
//        get { jsObject[.trueSpeed].fromJSValue()!}
//        set { jsObject[.trueSpeed] = newValue.jsValue }
//    }
//
//    public var vspace: UInt32 {
//        get { jsObject[.vspace].fromJSValue()!}
//        set { jsObject[.vspace] = newValue.jsValue }
//    }
//
//    public var width: String {
//        get { jsObject[.width].fromJSValue()!}
//        set { jsObject[.width] = newValue.jsValue }
//    }
//
//    @inlinable public func start() {
//        let this = jsObject
//        _ = this[.start].function!(this: this, arguments: [])
//    }
//
//    @inlinable public func stop() {
//        let this = jsObject
//        _ = this[.stop].function!(this: this, arguments: [])
//    }
//}

//public class HTMLParamElement: HTMLElement {
//    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLParamElement].function }
//
//    public var name: String {
//        get { jsObject[.name].fromJSValue()!}
//        set { jsObject[.name] = newValue.jsValue }
//    }
//
//    public var value: String {
//        get { jsObject[.value].fromJSValue()!}
//        set { jsObject[.value] = newValue.jsValue }
//    }
//
//    public var type: String {
//        get { jsObject[.type].fromJSValue()!}
//        set { jsObject[.type] = newValue.jsValue }
//    }
//
//    public var valueType: String {
//        get { jsObject[.valueType].fromJSValue()!}
//        set { jsObject[.valueType] = newValue.jsValue }
//    }
//}
