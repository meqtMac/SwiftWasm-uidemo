//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public class HTMLVideoElement: HTMLMediaElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLVideoElement].function }
    
    public var width: UInt32 {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }
    
    public var height: UInt32 {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }
    
    public var videoWidth: UInt32 {
        jsObject[.videoWidth].fromJSValue()!
    }
    
    public var videoHeight: UInt32 {
        jsObject[.videoHeight].fromJSValue()!
    }
    
    public var poster: String {
        get { jsObject[.poster].fromJSValue()!}
        set { jsObject[.poster] = newValue.jsValue }
    }
    
    public var playsInline: Bool {
        get { jsObject[.playsInline].fromJSValue()!}
        set { jsObject[.playsInline] = newValue.jsValue }
    }
}
