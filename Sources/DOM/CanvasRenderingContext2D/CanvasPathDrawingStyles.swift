//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/8/30.
//
import JavaScriptKit
import WebAPIBase

public protocol CanvasPathDrawingStyles {
    var lineWidth: Double { get set }
    var lineCap: LineCap { get set }
    var lineJoin: LineJoin { get set }
    var miterLimit: Double { get set }
    func setLineDash(segments: [Double])
    func getLineDash() -> [Double]
    var lineDashOffset: Double { get set }
}

public enum LineCap: JSString, CaseIterable {
    case butt = "butt"
    case round = "round"
    case square = "square"
}

public enum LineJoin: JSString, CaseIterable {
    case round = "round"
    case bevel = "bevel"
    case miter = "miter"
}

public extension CanvasPathDrawingStyles where Self: JSBridgedClass {
    @inlinable var lineWidth: Double {
        get { jsObject[.lineWidth].fromJSValue()! }
        nonmutating set { jsObject[.lineWidth] = _toJSValue(newValue) }
    }

    @inlinable var lineCap: LineCap {
        get { jsObject[.lineCap].fromJSValue()! }
        nonmutating set { jsObject[.lineCap] = _toJSValue(newValue) }
    }

    @inlinable var lineJoin: LineJoin {
        get { jsObject[.lineJoin].fromJSValue()! }
        nonmutating set { jsObject[.lineJoin] = _toJSValue(newValue) }
    }

    @inlinable var miterLimit: Double {
        get { jsObject[.miterLimit].fromJSValue()! }
        nonmutating set { jsObject[.miterLimit] = _toJSValue(newValue) }
    }

    @inlinable func setLineDash(segments: [Double]) {
        let this = jsObject
        _ = this[.setLineDash].function!(this: this, arguments: [_toJSValue(segments)])
    }

    @inlinable func getLineDash() -> [Double] {
        let this = jsObject
        return this[.getLineDash].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable var lineDashOffset: Double {
        get { jsObject[.lineDashOffset].fromJSValue()! }
        nonmutating set { jsObject[.lineDashOffset] = _toJSValue(newValue) }
    }
}



extension LineCap: JSValueCompatible {
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

extension LineJoin: JSValueCompatible {
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
