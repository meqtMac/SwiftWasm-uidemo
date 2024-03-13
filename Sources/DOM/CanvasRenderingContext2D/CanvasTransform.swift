//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/8/31.
//

import JavaScriptKit
import WebAPIBase

public protocol CanvasTransform {
    func scale(x: Double, y: Double)
    func rotate(angle: Double)
    func translate(x: Double, y: Double)
    func transform(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double)
    func getTransform() -> DOMMatrix
    func setTransform(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double)
    func setTransform(transform: DOMMatrix2DInit?)
    func resetTransform()
}

public extension CanvasTransform where Self: JSBridgedClass {
    @inlinable func scale(x: Double, y: Double) {
        let this = jsObject
        _ = this[.scale].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable func rotate(angle: Double) {
        let this = jsObject
        _ = this[.rotate].function!(this: this, arguments: [_toJSValue(angle)])
    }

    @inlinable func translate(x: Double, y: Double) {
        let this = jsObject
        _ = this[.translate].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable func transform(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double) {
        let this = jsObject
        _ = this[.transform].function!(this: this, arguments: [_toJSValue(a), _toJSValue(b), _toJSValue(c), _toJSValue(d), _toJSValue(e), _toJSValue(f)])
    }

    @inlinable func getTransform() -> DOMMatrix {
        let this = jsObject
        return this[.getTransform].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable func setTransform(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double) {
        let this = jsObject
        _ = this[.setTransform].function!(this: this, arguments: [_toJSValue(a), _toJSValue(b), _toJSValue(c), _toJSValue(d), _toJSValue(e), _toJSValue(f)])
    }

    @inlinable func setTransform(transform: DOMMatrix2DInit? = nil) {
        let this = jsObject
        _ = this[.setTransform].function!(this: this, arguments: [_toJSValue(transform)])
    }

    @inlinable func resetTransform() {
        let this = jsObject
        _ = this[.resetTransform].function!(this: this, arguments: [])
    }
}
