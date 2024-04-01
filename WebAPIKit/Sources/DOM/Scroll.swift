//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import JavaScriptKit
import WebAPIBase

public enum ScrollBehavior: JSString, JSValueCompatible {
    case auto = "auto"
    case instant = "instant"
    case smooth = "smooth"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public class ScrollIntoViewOptions: BridgedDictionary {
    public convenience init(block: ScrollLogicalPosition, inline: ScrollLogicalPosition) {
        let object = JSObject.global[.Object].function!.new()
        object[.block] = _toJSValue(block)
        object[.inline] = _toJSValue(inline)
        self.init(unsafelyWrapping: object)
    }

    public var block: ScrollLogicalPosition {
        get { jsObject[.block].fromJSValue()!}
        set { jsObject[.block] = newValue.jsValue }
    }

    public var inline: ScrollLogicalPosition {
        get { jsObject[.inline].fromJSValue()!}
        set { jsObject[.inline] = newValue.jsValue }
    }
}

public enum ScrollLogicalPosition: JSString, JSValueCompatible {
    case start = "start"
    case center = "center"
    case end = "end"
    case nearest = "nearest"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public class ScrollOptions: BridgedDictionary {
    public convenience init(behavior: ScrollBehavior) {
        let object = JSObject.global[.Object].function!.new()
        object[.behavior] = _toJSValue(behavior)
        self.init(unsafelyWrapping: object)
    }
    
    public var behavior: ScrollBehavior {
        get { jsObject[.behavior].fromJSValue()!}
        set { jsObject[.behavior] = newValue.jsValue }
    }
}

public enum ScrollRestoration: JSString, JSValueCompatible {
    case auto = "auto"
    case manual = "manual"

    @inlinable public static func construct(from jsValue: JSValue) -> Self? {
        if let string = jsValue.jsString {
            return Self(rawValue: string)
        }
        return nil
    }

    @inlinable public init?(string: String) {
        self.init(rawValue: JSString(string))
    }

    @inlinable public var jsValue: JSValue { rawValue.jsValue }
}

public class ScrollToOptions: BridgedDictionary {
    public convenience init(left: Double, top: Double) {
        let object = JSObject.global[.Object].function!.new()
        object[.left] = _toJSValue(left)
        object[.top] = _toJSValue(top)
        self.init(unsafelyWrapping: object)
    }
    
    public var left: Double {
        get { jsObject[.left].fromJSValue()!}
        set { jsObject[.left] = newValue.jsValue }
    }

    public var top: Double {
        get { jsObject[.top].fromJSValue()!}
        set { jsObject[.top] = newValue.jsValue }
    }
}

