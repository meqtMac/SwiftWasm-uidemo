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

public class HTMLTrackElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTrackElement].function }

    public var kind: String {
        get { jsObject[.kind].fromJSValue()! }
        set { jsObject[.kind] = newValue.jsValue }
    }

    public var src: String {
        get { jsObject[.src].fromJSValue()! }
        set { jsObject[.src] = newValue.jsValue }
    }

    public var srclang: String {
        get { jsObject[.srclang].fromJSValue()! }
        set { jsObject[.srclang] = newValue.jsValue }
    }

    public var label: String {
        get { jsObject[.label].fromJSValue()! }
        set { jsObject[.label] = newValue.jsValue }
    }

    public var `default`: Bool {
        get { jsObject[.default].fromJSValue()! }
        set { jsObject[.default] = newValue.jsValue }
    }

    public static let NONE: UInt16 = 0

    public static let LOADING: UInt16 = 1

    public static let LOADED: UInt16 = 2

    public static let ERROR: UInt16 = 3

    public var readyState: UInt16 {
        jsObject[.readyState].fromJSValue()!
    }

    public var track: TextTrack {
        jsObject[.track].fromJSValue()!
    }
}
