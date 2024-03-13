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

public class HTMLModElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLModElement].function }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    public var cite: String {
        get { jsObject[.cite].fromJSValue()!}
        set { jsObject[.cite] = newValue.jsValue }
    }

    public var dateTime: String {
        get { jsObject[.dateTime].fromJSValue()!}
        set { jsObject[.dateTime] = newValue.jsValue }
    }
}
