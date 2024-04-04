//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

//import Foundation
//import ECMAScript
//import JavaScriptBigIntSupport
//import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public class HTMLMapElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLMapElement].function }

    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }

    public var areas: HTMLCollection {
        jsObject[.areas].fromJSValue()!
    }
}
