//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/13.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


public class DOMMatrix: DOMMatrixReadOnly {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.DOMMatrix].function }
    
    //    @inlinable public convenience init(init: String_or_seq_of_Double? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    //    }
    
    @inlinable public convenience init(init: String? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }
    
    @inlinable public convenience init(init: [Double]? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }
    
    
    
    @inlinable override public class func fromMatrix(other: DOMMatrixInit? = nil) -> Self {
        let this = constructor!
        return this[.fromMatrix].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }
    
    @inlinable override public class func fromFloat32Array(array32: Float32Array) -> Self {
        let this = constructor!
        return this[.fromFloat32Array].function!(this: this, arguments: [_toJSValue(array32)]).fromJSValue()!
    }
    
    @inlinable override public class func fromFloat64Array(array64: Float64Array) -> Self {
        let this = constructor!
        return this[.fromFloat64Array].function!(this: this, arguments: [_toJSValue(array64)]).fromJSValue()!
    }
    
//    @usableFromInline let _a: ReadWriteAttribute<Double>
    @inlinable override public var a: Double {
        get { jsObject[.a].fromJSValue()! }
        set { jsObject[.a] = newValue.jsValue }
    }
    
    @inlinable override public var b: Double {
        get { jsObject[.b].fromJSValue()! }
        set { jsObject[.b] = newValue.jsValue }
    }
    
     @inlinable override public var c: Double{
        get { jsObject[.c].fromJSValue()! }
        set { jsObject[.c] = newValue.jsValue }
    }
    
     @inlinable override public var d: Double{
        get { jsObject[.d].fromJSValue()! }
        set { jsObject[.d] = newValue.jsValue }
    }
    
     @inlinable override public var e: Double{
        get { jsObject[.e].fromJSValue()! }
        set { jsObject[.e] = newValue.jsValue }
    }
    
     @inlinable override public var f: Double{
        get { jsObject[.f].fromJSValue()! }
        set { jsObject[.f] = newValue.jsValue }
    }
    
     @inlinable override public var m11: Double{
        get { jsObject[.m11].fromJSValue()! }
        set { jsObject[.m11] = newValue.jsValue }
    }
    
     @inlinable override public var m12: Double{
        get { jsObject[.m12].fromJSValue()! }
        set { jsObject[.m12] = newValue.jsValue }
    }
    
     @inlinable override public var m13: Double{
        get { jsObject[.m13].fromJSValue()! }
        set { jsObject[.m13] = newValue.jsValue }
    }
    
     @inlinable override public var m14: Double{
        get { jsObject[.m14].fromJSValue()! }
        set { jsObject[.m14] = newValue.jsValue }
    }
    
     @inlinable override public var m21: Double{
        get { jsObject[.m21].fromJSValue()! }
        set { jsObject[.m21] = newValue.jsValue }
    }
    
     @inlinable override public var m22: Double{
        get { jsObject[.m22].fromJSValue()! }
        set { jsObject[.m22] = newValue.jsValue }
    }
    
     @inlinable override public var m23: Double{
        get { jsObject[.m23].fromJSValue()! }
        set { jsObject[.m23] = newValue.jsValue }
    }
    
     @inlinable override public var m24: Double{
        get { jsObject[.m24].fromJSValue()! }
        set { jsObject[.m24] = newValue.jsValue }
    }
    
     @inlinable override public var m31: Double{
        get { jsObject[.m31].fromJSValue()! }
        set { jsObject[.m31] = newValue.jsValue }
    }
    
     @inlinable override public var m32: Double{
        get { jsObject[.m32].fromJSValue()! }
        set { jsObject[.m32] = newValue.jsValue }
    }
    
     @inlinable override public var m33: Double{
        get { jsObject[.m33].fromJSValue()! }
        set { jsObject[.m33] = newValue.jsValue }
    }
    
     @inlinable override public var m34: Double{
        get { jsObject[.m34].fromJSValue()! }
        set { jsObject[.m34] = newValue.jsValue }
    }
    
     @inlinable override public var m41: Double{
        get { jsObject[.m41].fromJSValue()! }
        set { jsObject[.m41] = newValue.jsValue }
    }
    
     @inlinable override public var m42: Double{
        get { jsObject[.m42].fromJSValue()! }
        set { jsObject[.m42] = newValue.jsValue }
    }
    
     @inlinable override public var m43: Double{
        get { jsObject[.m43].fromJSValue()! }
        set { jsObject[.m43] = newValue.jsValue }
    }
    
     @inlinable override public var m44: Double{
        get { jsObject[.m44].fromJSValue()! }
        set { jsObject[.m44] = newValue.jsValue }
    }
    
    @inlinable public func multiplySelf(other: DOMMatrixInit? = nil) -> Self {
        let this = jsObject
        return this[.multiplySelf].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }
    
    @inlinable public func preMultiplySelf(other: DOMMatrixInit? = nil) -> Self {
        let this = jsObject
        return this[.preMultiplySelf].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }
    
    @inlinable public func translateSelf(tx: Double? = nil, ty: Double? = nil, tz: Double? = nil) -> Self {
        let this = jsObject
        return this[.translateSelf].function!(this: this, arguments: [_toJSValue(tx), _toJSValue(ty), _toJSValue(tz)]).fromJSValue()!
    }
    
    @inlinable public func scaleSelf(scaleX: Double? = nil, scaleY: Double? = nil, scaleZ: Double? = nil, originX: Double? = nil, originY: Double? = nil, originZ: Double? = nil) -> Self {
        let this = jsObject
        return this[.scaleSelf].function!(this: this, arguments: [_toJSValue(scaleX), _toJSValue(scaleY), _toJSValue(scaleZ), _toJSValue(originX), _toJSValue(originY), _toJSValue(originZ)]).fromJSValue()!
    }
    
    @inlinable public func scale3dSelf(scale: Double? = nil, originX: Double? = nil, originY: Double? = nil, originZ: Double? = nil) -> Self {
        let this = jsObject
        return this[.scale3dSelf].function!(this: this, arguments: [_toJSValue(scale), _toJSValue(originX), _toJSValue(originY), _toJSValue(originZ)]).fromJSValue()!
    }
    
    @inlinable public func rotateSelf(rotX: Double? = nil, rotY: Double? = nil, rotZ: Double? = nil) -> Self {
        let this = jsObject
        return this[.rotateSelf].function!(this: this, arguments: [_toJSValue(rotX), _toJSValue(rotY), _toJSValue(rotZ)]).fromJSValue()!
    }
    
    @inlinable public func rotateFromVectorSelf(x: Double? = nil, y: Double? = nil) -> Self {
        let this = jsObject
        return this[.rotateFromVectorSelf].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)]).fromJSValue()!
    }
    
    @inlinable public func rotateAxisAngleSelf(x: Double? = nil, y: Double? = nil, z: Double? = nil, angle: Double? = nil) -> Self {
        let this = jsObject
        return this[.rotateAxisAngleSelf].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(angle)]).fromJSValue()!
    }
    
    @inlinable public func skewXSelf(sx: Double? = nil) -> Self {
        let this = jsObject
        return this[.skewXSelf].function!(this: this, arguments: [_toJSValue(sx)]).fromJSValue()!
    }
    
    @inlinable public func skewYSelf(sy: Double? = nil) -> Self {
        let this = jsObject
        return this[.skewYSelf].function!(this: this, arguments: [_toJSValue(sy)]).fromJSValue()!
    }
    
    @inlinable public func invertSelf() -> Self {
        let this = jsObject
        return this[.invertSelf].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func setMatrixValue(transformList: String) -> Self {
        let this = jsObject
        return this[.setMatrixValue].function!(this: this, arguments: [_toJSValue(transformList)]).fromJSValue()!
    }
}

public class DOMMatrix2DInit: BridgedDictionary {
    public convenience init(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double, m11: Double, m12: Double, m21: Double, m22: Double, m41: Double, m42: Double) {
        let object = JSObject.global[.Object].function!.new()
        object[.a] = _toJSValue(a)
        object[.b] = _toJSValue(b)
        object[.c] = _toJSValue(c)
        object[.d] = _toJSValue(d)
        object[.e] = _toJSValue(e)
        object[.f] = _toJSValue(f)
        object[.m11] = _toJSValue(m11)
        object[.m12] = _toJSValue(m12)
        object[.m21] = _toJSValue(m21)
        object[.m22] = _toJSValue(m22)
        object[.m41] = _toJSValue(m41)
        object[.m42] = _toJSValue(m42)
        self.init(unsafelyWrapping: object)
    }
    
    public var a: Double {
        get { jsObject[.a].fromJSValue()!}
        set { jsObject[.a] = newValue.jsValue }
    }
    
    public var b: Double {
        get { jsObject[.b].fromJSValue()!}
        set { jsObject[.b] = newValue.jsValue }
    }
    
    public var c: Double {
        get { jsObject[.c].fromJSValue()!}
        set { jsObject[.c] = newValue.jsValue }
    }
    
    public var d: Double {
        get { jsObject[.d].fromJSValue()!}
        set { jsObject[.d] = newValue.jsValue }
    }
    
    public var e: Double {
        get { jsObject[.e].fromJSValue()!}
        set { jsObject[.e] = newValue.jsValue }
    }
    
    public var f: Double {
        get { jsObject[.f].fromJSValue()!}
        set { jsObject[.f] = newValue.jsValue }
    }
    
    public var m11: Double {
        get { jsObject[.m11].fromJSValue()!}
        set { jsObject[.m11] = newValue.jsValue }
    }
    
    public var m12: Double {
        get { jsObject[.m12].fromJSValue()!}
        set { jsObject[.m12] = newValue.jsValue }
    }
    
    public var m21: Double {
        get { jsObject[.m21].fromJSValue()!}
        set { jsObject[.m21] = newValue.jsValue }
    }
    
    public var m22: Double {
        get { jsObject[.m22].fromJSValue()!}
        set { jsObject[.m22] = newValue.jsValue }
    }
    
    public var m41: Double {
        get { jsObject[.m41].fromJSValue()!}
        set { jsObject[.m41] = newValue.jsValue }
    }
    
    public var m42: Double {
        get { jsObject[.m42].fromJSValue()!}
        set { jsObject[.m42] = newValue.jsValue }
    }
}

public class DOMMatrixInit: BridgedDictionary {
    public convenience init(m13: Double, m14: Double, m23: Double, m24: Double, m31: Double, m32: Double, m33: Double, m34: Double, m43: Double, m44: Double, is2D: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.m13] = _toJSValue(m13)
        object[.m14] = _toJSValue(m14)
        object[.m23] = _toJSValue(m23)
        object[.m24] = _toJSValue(m24)
        object[.m31] = _toJSValue(m31)
        object[.m32] = _toJSValue(m32)
        object[.m33] = _toJSValue(m33)
        object[.m34] = _toJSValue(m34)
        object[.m43] = _toJSValue(m43)
        object[.m44] = _toJSValue(m44)
        object[.is2D] = _toJSValue(is2D)
        self.init(unsafelyWrapping: object)
    }
    
    public var m13: Double {
        get { jsObject[.m13].fromJSValue()!}
        set { jsObject[.m13] = newValue.jsValue }
    }
    
    public var m14: Double {
        get { jsObject[.m14].fromJSValue()!}
        set { jsObject[.m14] = newValue.jsValue }
    }
    
    public var m23: Double {
        get { jsObject[.m23].fromJSValue()!}
        set { jsObject[.m23] = newValue.jsValue }
    }
    
    public var m24: Double {
        get { jsObject[.m24].fromJSValue()!}
        set { jsObject[.m24] = newValue.jsValue }
    }
    
    public var m31: Double {
        get { jsObject[.m31].fromJSValue()!}
        set { jsObject[.m31] = newValue.jsValue }
    }
    
    public var m32: Double {
        get { jsObject[.m32].fromJSValue()!}
        set { jsObject[.m32] = newValue.jsValue }
    }
    
    public var m33: Double {
        get { jsObject[.m33].fromJSValue()!}
        set { jsObject[.m33] = newValue.jsValue }
    }
    
    public var m34: Double {
        get { jsObject[.m34].fromJSValue()!}
        set { jsObject[.m34] = newValue.jsValue }
    }
    
    public var m43: Double {
        get { jsObject[.m43].fromJSValue()!}
        set { jsObject[.m43] = newValue.jsValue }
    }
    
    public var m44: Double {
        get { jsObject[.m44].fromJSValue()!}
        set { jsObject[.m44] = newValue.jsValue }
    }
    
    public var is2D: Bool {
        get { jsObject[.is2D].fromJSValue()!}
        set { jsObject[.is2D] = newValue.jsValue }
    }
}

public class DOMMatrixReadOnly: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMMatrixReadOnly].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(init: String? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }
    
    @inlinable public convenience init(init: [Double]? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }
    
    
    @inlinable public class func fromMatrix(other: DOMMatrixInit? = nil) -> Self {
        let this = constructor!
        return this[.fromMatrix].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }
    
    @inlinable public class func fromFloat32Array(array32: Float32Array) -> Self {
        let this = constructor!
        return this[.fromFloat32Array].function!(this: this, arguments: [_toJSValue(array32)]).fromJSValue()!
    }
    
    @inlinable public class func fromFloat64Array(array64: Float64Array) -> Self {
        let this = constructor!
        return this[.fromFloat64Array].function!(this: this, arguments: [_toJSValue(array64)]).fromJSValue()!
    }
    
    public var a: Double {
        jsObject[.a].fromJSValue()!
    }
    
    public var b: Double {
        jsObject[.b].fromJSValue()!
    }
    
    public var c: Double {
        jsObject[.c].fromJSValue()!
    }
    
    public var d: Double {
        jsObject[.d].fromJSValue()!
    }
    
    public var e: Double {
        jsObject[.e].fromJSValue()!
    }
    
    public var f: Double {
        jsObject[.f].fromJSValue()!
    }
    
    public var m11: Double {
        jsObject[.m11].fromJSValue()!
    }
    
    public var m12: Double {
        jsObject[.m12].fromJSValue()!
    }
    
    public var m13: Double {
        jsObject[.m13].fromJSValue()!
    }
    
    public var m14: Double {
        jsObject[.m14].fromJSValue()!
    }
    
    public var m21: Double {
        jsObject[.m21].fromJSValue()!
    }
    
    public var m22: Double {
        jsObject[.m22].fromJSValue()!
    }
    
    public var m23: Double {
        jsObject[.m23].fromJSValue()!
    }
    
    public var m24: Double {
        jsObject[.m24].fromJSValue()!
    }
    
    public var m31: Double {
        jsObject[.m31].fromJSValue()!
    }
    
    public var m32: Double {
        jsObject[.m32].fromJSValue()!
    }
    
    public var m33: Double {
        jsObject[.m33].fromJSValue()!
    }
    
    public var m34: Double {
        jsObject[.m34].fromJSValue()!
    }
    
    public var m41: Double {
        jsObject[.m41].fromJSValue()!
    }
    
    public var m42: Double {
        jsObject[.m42].fromJSValue()!
    }
    
    public var m43: Double {
        jsObject[.m43].fromJSValue()!
    }
    
    public var m44: Double {
        jsObject[.m44].fromJSValue()!
    }
    
    public var is2D: Bool {
        jsObject[.is2D].fromJSValue()!
    }
    
    public var isIdentity: Bool {
        jsObject[.isIdentity].fromJSValue()!
    }
    
    @inlinable public func translate(tx: Double? = nil, ty: Double? = nil, tz: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.translate].function!(this: this, arguments: [_toJSValue(tx), _toJSValue(ty), _toJSValue(tz)]).fromJSValue()!
    }
    
    @inlinable public func scale(scaleX: Double? = nil, scaleY: Double? = nil, scaleZ: Double? = nil, originX: Double? = nil, originY: Double? = nil, originZ: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.scale].function!(this: this, arguments: [_toJSValue(scaleX), _toJSValue(scaleY), _toJSValue(scaleZ), _toJSValue(originX), _toJSValue(originY), _toJSValue(originZ)]).fromJSValue()!
    }
    
    @inlinable public func scaleNonUniform(scaleX: Double? = nil, scaleY: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.scaleNonUniform].function!(this: this, arguments: [_toJSValue(scaleX), _toJSValue(scaleY)]).fromJSValue()!
    }
    
    @inlinable public func scale3d(scale: Double? = nil, originX: Double? = nil, originY: Double? = nil, originZ: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.scale3d].function!(this: this, arguments: [_toJSValue(scale), _toJSValue(originX), _toJSValue(originY), _toJSValue(originZ)]).fromJSValue()!
    }
    
    @inlinable public func rotate(rotX: Double? = nil, rotY: Double? = nil, rotZ: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.rotate].function!(this: this, arguments: [_toJSValue(rotX), _toJSValue(rotY), _toJSValue(rotZ)]).fromJSValue()!
    }
    
    @inlinable public func rotateFromVector(x: Double? = nil, y: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.rotateFromVector].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)]).fromJSValue()!
    }
    
    @inlinable public func rotateAxisAngle(x: Double? = nil, y: Double? = nil, z: Double? = nil, angle: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.rotateAxisAngle].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(angle)]).fromJSValue()!
    }
    
    @inlinable public func skewX(sx: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.skewX].function!(this: this, arguments: [_toJSValue(sx)]).fromJSValue()!
    }
    
    @inlinable public func skewY(sy: Double? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.skewY].function!(this: this, arguments: [_toJSValue(sy)]).fromJSValue()!
    }
    
    @inlinable public func multiply(other: DOMMatrixInit? = nil) -> DOMMatrix {
        let this = jsObject
        return this[.multiply].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }
    
    @inlinable public func flipX() -> DOMMatrix {
        let this = jsObject
        return this[.flipX].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func flipY() -> DOMMatrix {
        let this = jsObject
        return this[.flipY].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func inverse() -> DOMMatrix {
        let this = jsObject
        return this[.inverse].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func transformPoint(point: DOMPointInit? = nil) -> DOMPoint {
        let this = jsObject
        return this[.transformPoint].function!(this: this, arguments: [_toJSValue(point)]).fromJSValue()!
    }
    
    @inlinable public func toFloat32Array() -> Float32Array {
        let this = jsObject
        return this[.toFloat32Array].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func toFloat64Array() -> Float64Array {
        let this = jsObject
        return this[.toFloat64Array].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public var description: String {
        jsObject[.toString]!().fromJSValue()!
    }
    
    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}

