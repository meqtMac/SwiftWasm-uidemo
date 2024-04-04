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

public class HTMLMetaElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLMetaElement].function }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }

    public var httpEquiv: String {
        get { jsObject[.httpEquiv].fromJSValue()!}
        set { jsObject[.httpEquiv] = newValue.jsValue }
    }

    public var content: String {
        get { jsObject[.content].fromJSValue()!}
        set { jsObject[.content] = newValue.jsValue }
    }

    public var media: String {
        get { jsObject[.media].fromJSValue()!}
        set { jsObject[.media] = newValue.jsValue }
    }

    public var scheme: String {
        get { jsObject[.scheme].fromJSValue()!}
        set { jsObject[.scheme] = newValue.jsValue }
    }
}
