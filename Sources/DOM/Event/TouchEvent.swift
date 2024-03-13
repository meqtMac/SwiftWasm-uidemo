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


public class TouchEvent: UIEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.TouchEvent].function }

    @inlinable public convenience init(type: String, eventInitDict: TouchEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }

public var touches: TouchList {
jsObject[.touches].fromJSValue()!
    }

public var targetTouches: TouchList {
jsObject[.targetTouches].fromJSValue()!
    }

public var changedTouches: TouchList {
jsObject[.changedTouches].fromJSValue()!
    }

public var altKey: Bool {
jsObject[.altKey].fromJSValue()!
    }

public var metaKey: Bool {
jsObject[.metaKey].fromJSValue()!
    }

public var ctrlKey: Bool {
jsObject[.ctrlKey].fromJSValue()!
    }

public var shiftKey: Bool {
jsObject[.shiftKey].fromJSValue()!
    }

    @inlinable public subscript(key: String) -> Bool {
        jsObject[key].fromJSValue()!
    }

    @inlinable public func getModifierState(keyArg: String) -> Bool {
        let this = jsObject
        return this[.getModifierState].function!(this: this, arguments: [_toJSValue(keyArg)]).fromJSValue()!
    }
}

public class TouchEventInit: BridgedDictionary {
    public convenience init(touches: [Touch], targetTouches: [Touch], changedTouches: [Touch]) {
        let object = JSObject.global[.Object].function!.new()
        object[.touches] = _toJSValue(touches)
        object[.targetTouches] = _toJSValue(targetTouches)
        object[.changedTouches] = _toJSValue(changedTouches)
        self.init(unsafelyWrapping: object)
    }

    public var touches: [Touch] {
        get { jsObject[.touches].fromJSValue()!}
        set { jsObject[.touches] = newValue.jsValue }
    }

    public var targetTouches: [Touch] {
        get { jsObject[.targetTouches].fromJSValue()!}
        set { jsObject[.targetTouches] = newValue.jsValue }
    }

    public var changedTouches: [Touch] {
        get { jsObject[.changedTouches].fromJSValue()!}
        set { jsObject[.changedTouches] = newValue.jsValue }
    }
}

public class Touch: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.Touch].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
       self.jsObject = jsObject
    }

    @inlinable public convenience init(touchInitDict: TouchInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(touchInitDict)]))
    }

public var identifier: Int32 {
jsObject[.identifier].fromJSValue()!
    }

public var target: EventTarget {
jsObject[.target].fromJSValue()!
    }

public var screenX: Double {
jsObject[.screenX].fromJSValue()!
    }

public var screenY: Double {
jsObject[.screenY].fromJSValue()!
    }

public var clientX: Double {
jsObject[.clientX].fromJSValue()!
    }

public var clientY: Double {
jsObject[.clientY].fromJSValue()!
    }

public var pageX: Double {
jsObject[.pageX].fromJSValue()!
    }

public var pageY: Double {
jsObject[.pageY].fromJSValue()!
    }

public var radiusX: Float {
jsObject[.radiusX].fromJSValue()!
    }

public var radiusY: Float {
jsObject[.radiusY].fromJSValue()!
    }

public var rotationAngle: Float {
jsObject[.rotationAngle].fromJSValue()!
    }

public var force: Float {
jsObject[.force].fromJSValue()!
    }

public var altitudeAngle: Float {
jsObject[.altitudeAngle].fromJSValue()!
    }

public var azimuthAngle: Float {
jsObject[.azimuthAngle].fromJSValue()!
    }

public var touchType: TouchType {
jsObject[.touchType].fromJSValue()!
    }
}



public class TouchInit: BridgedDictionary {
    public convenience init(identifier: Int32, target: EventTarget, clientX: Double, clientY: Double, screenX: Double, screenY: Double, pageX: Double, pageY: Double, radiusX: Float, radiusY: Float, rotationAngle: Float, force: Float, altitudeAngle: Double, azimuthAngle: Double, touchType: TouchType) {
        let object = JSObject.global[.Object].function!.new()
        object[.identifier] = _toJSValue(identifier)
        object[.target] = _toJSValue(target)
        object[.clientX] = _toJSValue(clientX)
        object[.clientY] = _toJSValue(clientY)
        object[.screenX] = _toJSValue(screenX)
        object[.screenY] = _toJSValue(screenY)
        object[.pageX] = _toJSValue(pageX)
        object[.pageY] = _toJSValue(pageY)
        object[.radiusX] = _toJSValue(radiusX)
        object[.radiusY] = _toJSValue(radiusY)
        object[.rotationAngle] = _toJSValue(rotationAngle)
        object[.force] = _toJSValue(force)
        object[.altitudeAngle] = _toJSValue(altitudeAngle)
        object[.azimuthAngle] = _toJSValue(azimuthAngle)
        object[.touchType] = _toJSValue(touchType)
        self.init(unsafelyWrapping: object)
    }

    public var identifier: Int32 {
        get { jsObject[.identifier].fromJSValue()!}
        set { jsObject[.identifier] = newValue.jsValue }
    }

    public var target: EventTarget {
        get { jsObject[.target].fromJSValue()!}
        set { jsObject[.target] = newValue.jsValue }
    }

    public var clientX: Double {
        get { jsObject[.clientX].fromJSValue()!}
        set { jsObject[.clientX] = newValue.jsValue }
    }

    public var clientY: Double {
        get { jsObject[.clientY].fromJSValue()!}
        set { jsObject[.clientY] = newValue.jsValue }
    }

    public var screenX: Double {
        get { jsObject[.screenX].fromJSValue()!}
        set { jsObject[.screenX] = newValue.jsValue }
    }

    public var screenY: Double {
        get { jsObject[.screenY].fromJSValue()!}
        set { jsObject[.screenY] = newValue.jsValue }
    }

    public var pageX: Double {
        get { jsObject[.pageX].fromJSValue()!}
        set { jsObject[.pageX] = newValue.jsValue }
    }

    public var pageY: Double {
        get { jsObject[.pageY].fromJSValue()!}
        set { jsObject[.pageY] = newValue.jsValue }
    }

    public var radiusX: Float {
        get { jsObject[.radiusX].fromJSValue()!}
        set { jsObject[.radiusX] = newValue.jsValue }
    }

    public var radiusY: Float {
        get { jsObject[.radiusY].fromJSValue()!}
        set { jsObject[.radiusY] = newValue.jsValue }
    }

    public var rotationAngle: Float {
        get { jsObject[.rotationAngle].fromJSValue()!}
        set { jsObject[.rotationAngle] = newValue.jsValue }
    }

    public var force: Float {
        get { jsObject[.force].fromJSValue()!}
        set { jsObject[.force] = newValue.jsValue }
    }

    public var altitudeAngle: Double {
        get { jsObject[.altitudeAngle].fromJSValue()!}
        set { jsObject[.altitudeAngle] = newValue.jsValue }
    }

    public var azimuthAngle: Double {
        get { jsObject[.azimuthAngle].fromJSValue()!}
        set { jsObject[.azimuthAngle] = newValue.jsValue }
    }

    public var touchType: TouchType {
        get { jsObject[.touchType].fromJSValue()!}
        set { jsObject[.touchType] = newValue.jsValue }
    }
}

public class TouchList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.TouchList].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

public var length: UInt32 {
jsObject[.length].fromJSValue()!
    }

    @inlinable public subscript(key: Int) -> Touch? {
        jsObject[key].fromJSValue()
    }

    @inlinable public func item(index: UInt32) -> Touch? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }
}

public enum TouchType: JSString, JSValueCompatible {
    case direct = "direct"
    case stylus = "stylus"

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

