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

public class HTMLImageElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLImageElement].function }
    
    public var alt: String {
        get { jsObject[.alt].fromJSValue()!}
        set { jsObject[.alt] = newValue.jsValue }
    }
    
    public var src: String {
        get { jsObject[.src].fromJSValue()!}
        set { jsObject[.src] = newValue.jsValue }
    }
    
    public var srcset: String {
        get { jsObject[.srcset].fromJSValue()!}
        set { jsObject[.srcset] = newValue.jsValue }
    }
    
    public var sizes: String {
        get { jsObject[.sizes].fromJSValue()!}
        set { jsObject[.sizes] = newValue.jsValue }
    }
    
    public var crossOrigin: String? {
        get { jsObject[.crossOrigin].fromJSValue()}
        set { jsObject[.crossOrigin] = newValue.jsValue }
    }
    
    public var useMap: String {
        get { jsObject[.useMap].fromJSValue()!}
        set { jsObject[.useMap] = newValue.jsValue }
    }
    
    public var isMap: Bool {
        get { jsObject[.isMap].fromJSValue()!}
        set { jsObject[.isMap] = newValue.jsValue }
    }
    
    public var width: UInt32 {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }
    
    public var height: UInt32 {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }
    
    public var naturalWidth: UInt32 {
        jsObject[.naturalWidth].fromJSValue()!
    }
    
    public var naturalHeight: UInt32 {
        jsObject[.naturalHeight].fromJSValue()!
    }
    
    public var complete: Bool {
        jsObject[.complete].fromJSValue()!
    }
    
    public var currentSrc: String {
        jsObject[.currentSrc].fromJSValue()!
    }
    
    public var referrerPolicy: String {
        get { jsObject[.referrerPolicy].fromJSValue()!}
        set { jsObject[.referrerPolicy] = newValue.jsValue }
    }
    
    public var decoding: String {
        get { jsObject[.decoding].fromJSValue()!}
        set { jsObject[.decoding] = newValue.jsValue }
    }
    
    public var loading: String {
        get { jsObject[.loading].fromJSValue()!}
        set { jsObject[.loading] = newValue.jsValue }
    }
    
    public var fetchPriority: String {
        get { jsObject[.fetchPriority].fromJSValue()!}
        set { jsObject[.fetchPriority] = newValue.jsValue }
    }
    
    @inlinable public func decode() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.decode].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }
    
    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }
    
    public var lowsrc: String {
        get { jsObject[.lowsrc].fromJSValue()!}
        set { jsObject[.lowsrc] = newValue.jsValue }
    }
    
    public var align: String {
        get { jsObject[.align].fromJSValue()!}
        set { jsObject[.align] = newValue.jsValue }
    }
    
    public var hspace: UInt32 {
        get { jsObject[.hspace].fromJSValue()!}
        set { jsObject[.hspace] = newValue.jsValue }
    }
    
    public var vspace: UInt32 {
        get { jsObject[.vspace].fromJSValue()!}
        set { jsObject[.vspace] = newValue.jsValue }
    }
    
    public var longDesc: String {
        get { jsObject[.longDesc].fromJSValue()!}
        set { jsObject[.longDesc] = newValue.jsValue }
    }
    
    public var border: String {
        get { jsObject[.border].fromJSValue()!}
        set { jsObject[.border] = newValue.jsValue }
    }
    
    public var x: Int32 {
        jsObject[.x].fromJSValue()!
    }
    
    public var y: Int32 {
        jsObject[.y].fromJSValue()!
    }
}
