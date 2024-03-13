//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/8/30.
//

import JavaScriptKit
import WebAPIBase

/// CanvasFillStrokeStyles
public protocol CanvasFillStrokeStyles {
    func setStrokeStyle(_ color: JSColor)
    func setStrokeStyle(_ pattern: CanvasPattern)
    func setStrokeStyle(_ gradient: CanvasGradient)
    func setFillStyle(_ color: JSColor)
    func setFillStyle(_ pattern: CanvasPattern)
    func setFillStyle(_ gradient: CanvasGradient)
    func createLinearGradient(x0: Double, y0: Double,
                              x1: Double, y1: Double,
                              @CanvasGradient.ColorStopBuilder colorStops:  () -> [CanvasGradient.ColorStop]
    ) -> CanvasGradient
    
    func createRadialGradient(x0: Double, y0: Double, r0: Double,
                              x1: Double, y1: Double, r1: Double,
                              @CanvasGradient.ColorStopBuilder colorStops:  () -> [CanvasGradient.ColorStop]
    ) -> CanvasGradient
    
    func createConicGradient(startAngle: Double, x: Double, y: Double,
                             @CanvasGradient.ColorStopBuilder colorStops:  () -> [CanvasGradient.ColorStop]
    ) -> CanvasGradient
    
    func createPattern(image: HTMLCanvasElement, repetition: String) -> CanvasPattern?
    func createPattern(image: HTMLOrSVGImageElement, repetition: String) -> CanvasPattern?
    func createPattern(image: HTMLVideoElement, repetition: String) -> CanvasPattern?
    func createPattern(image: ImageBitmap, repetition: String) -> CanvasPattern?
    func createPattern(image: OffscreenCanvas, repetition: String) -> CanvasPattern?
    func createPattern(image: VideoFrame, repetition: String) -> CanvasPattern?
}

public enum JSColor {
    case rgb(UInt8,UInt8,UInt8)
    case rgba(UInt8,UInt8,UInt8,Double)
    case white
    case black
    case blue
    case yellow
    case green
    case red
}

extension JSColor: ConvertibleToJSValue {
    public var jsValue: JavaScriptKit.JSValue {
        switch self {
        case let .rgb(r, g, b):
            return "rgb(\(r), \(g), \(b))".jsValue
        case let .rgba(r, g, b, a):
            return "rgba(\(r), \(g), \(b), \(a))".jsValue
        case .white:
            return "white".jsValue
        case .black:
            return "black".jsValue
        case .blue:
            return "blue".jsValue
        case .yellow:
            return "yellow".jsValue
        case .green:
            return "green".jsValue
        case .red:
            return "red".jsValue
        }
    }
}

public struct CanvasGradient: JSBridgedClass {
    @inlinable
    public static var constructor: JSFunction? { JSObject.global[.CanvasGradient].function }
    
    public let jsObject: JSObject
    
    public init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @usableFromInline
    mutating func add(colorStop: ColorStop) {
        let this = jsObject
        _ = this[.addColorStop].function!(this: this, arguments: [colorStop.0.jsValue, colorStop.1.jsValue])
    }
    
    public typealias ColorStop = (offset: Double, JSColor)
    
    @resultBuilder
    public enum ColorStopBuilder {
        public typealias Element = ColorStop
        public typealias Component = [Element]
        
        public static func buildBlock(_ components: Element...) -> Component {
            return components
        }
        
        public static func buildBlock(_ components: Component...) -> Component {
            return components.flatMap { $0 }
        }
        
        public static func buildExpression(_ expression: Element) -> Component {
            return [expression]
        }
        
        public static func buildEither(first component: Component) -> Component {
            return component
        }
        
        public static func buildEither(second component: Component) -> Component {
            return component
        }
        
        public static func buildArray(_ components: [Component]) -> Component {
            return components.flatMap { $0 }
        }
        
        public static func buildOptional(_ component: Component?) -> Component {
            if let component {
                return component
            } else {
                return []
            }
        }
    }
    
    
}

public struct CanvasPattern: JSBridgedClass {
    @inlinable public static var constructor: JSFunction? { JSObject.global[.CanvasPattern].function }
    
    public let jsObject: JSObject
    
    public init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public func setTransform(transform: DOMMatrix2DInit? = nil) {
        let this = jsObject
        _ = this[.setTransform].function!(this: this, arguments: [_toJSValue(transform)])
    }
}

public extension CanvasFillStrokeStyles where Self: JSBridgedClass {
    @inlinable
    func setStrokeStyle(_ color: JSColor) {
        jsObject[.strokeStyle] = _toJSValue(color)
    }
    
    @inlinable
    func setStrokeStyle(_ pattern: CanvasPattern) {
        jsObject[.strokeStyle] = _toJSValue(pattern)
    }
    
     @inlinable
    func setStrokeStyle(_ gradient: CanvasGradient) {
        jsObject[.strokeStyle] = _toJSValue(gradient)
    }
    
     @inlinable
    func setFillStyle(_ color: JSColor) {
        jsObject[.fillStyle] = _toJSValue(color)
    }
    
    @inlinable
    func setFillStyle(_ pattern: CanvasPattern) {
        jsObject[.fillStyle] = _toJSValue(pattern)
    }
    
     @inlinable
    func setFillStyle(_ gradient: CanvasGradient) {
        jsObject[.fillStyle] = _toJSValue(gradient)
    }
    
   
    @inlinable
    func createLinearGradient(x0: Double, y0: Double,
                              x1: Double, y1: Double,
                              @CanvasGradient.ColorStopBuilder colorStops:  () -> [CanvasGradient.ColorStop]
    ) -> CanvasGradient {
        var gradient: CanvasGradient =  jsObject[.createLinearGradient]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(x0), _toJSValue(y0), _toJSValue(x1), _toJSValue(y1)]
            ).fromJSValue()!
        
        for colorStop in colorStops() {
            gradient.add(colorStop: colorStop)
        }
        
        return gradient
    }
    
    @inlinable
    func createRadialGradient(x0: Double, y0: Double, r0: Double, 
                              x1: Double, y1: Double, r1: Double,
                              @CanvasGradient.ColorStopBuilder colorStops:  () -> [CanvasGradient.ColorStop]
    ) -> CanvasGradient {
        var gradient: CanvasGradient =  jsObject[.createRadialGradient]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(x0), _toJSValue(y0), _toJSValue(r0), _toJSValue(x1), _toJSValue(y1), _toJSValue(r1)]
            ).fromJSValue()!
        
        for colorStop in colorStops() {
            gradient.add(colorStop: colorStop)
        }
        
        return gradient
    }
    
    @inlinable
    func createConicGradient(startAngle: Double, x: Double, y: Double,
                             @CanvasGradient.ColorStopBuilder colorStops:  () -> [CanvasGradient.ColorStop]
    ) -> CanvasGradient {
        var gradient: CanvasGradient =  jsObject[.createConicGradient]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(startAngle), _toJSValue(x), _toJSValue(y)]
            ).fromJSValue()!
        
        for colorStop in colorStops() {
            gradient.add(colorStop: colorStop)
        }
        
        return gradient
    }
    
    @inlinable
    func createPattern(image: HTMLCanvasElement, repetition: String) -> CanvasPattern? {
        return jsObject[.createPattern]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(image), _toJSValue(repetition)]
            ).fromJSValue()
    }
    
    @inlinable
    func createPattern(image: HTMLOrSVGImageElement, repetition: String) -> CanvasPattern? {
        return jsObject[.createPattern]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(image), _toJSValue(repetition)]
            ).fromJSValue()
    }
    
    @inlinable
    func createPattern(image: HTMLVideoElement, repetition: String) -> CanvasPattern? {
        return jsObject[.createPattern]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(image), _toJSValue(repetition)]
            ).fromJSValue()
    }
    
    @inlinable
    func createPattern(image: ImageBitmap, repetition: String) -> CanvasPattern? {
        return jsObject[.createPattern]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(image), _toJSValue(repetition)]
            ).fromJSValue()
    }
    
    @inlinable
    func createPattern(image: OffscreenCanvas, repetition: String) -> CanvasPattern? {
        return jsObject[.createPattern]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(image), _toJSValue(repetition)]
            ).fromJSValue()
    }
    
    @inlinable
    func createPattern(image: VideoFrame, repetition: String) -> CanvasPattern? {
        return jsObject[.createPattern]
            .function!(
                this: jsObject,
                arguments: [_toJSValue(image), _toJSValue(repetition)]
            ).fromJSValue()
    }
}
