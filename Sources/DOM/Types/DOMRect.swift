//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/13.
//

import Foundation
import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


public class DOMPoint: DOMPointReadOnly {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.DOMPoint].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
       super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init(x: Double? = nil, y: Double? = nil, z: Double? = nil, w: Double? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(w)]))
    }
    
    @inlinable override public class func fromPoint(other: DOMPointInit? = nil) -> Self {
        let this = constructor!
        return this[.fromPoint].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }
    
     @inlinable override public var x: Double{
        get { jsObject[.x].fromJSValue()! }
        set { jsObject[.x] = newValue.jsValue }
    }
    
     @inlinable override public var y: Double{
        get { jsObject[.y].fromJSValue()! }
        set { jsObject[.y] = newValue.jsValue }
    }
    
     @inlinable override public var z: Double{
        get { jsObject[.z].fromJSValue()! }
        set { jsObject[.z] = newValue.jsValue }
    }
    
     @inlinable override public var w: Double{
        get { jsObject[.w].fromJSValue()! }
        set { jsObject[.w] = newValue.jsValue }
    }
}

public class DOMPointInit: BridgedDictionary {
    public convenience init(x: Double, y: Double, z: Double, w: Double) {
        let object = JSObject.global[.Object].function!.new()
        object[.x] = _toJSValue(x)
        object[.y] = _toJSValue(y)
        object[.z] = _toJSValue(z)
        object[.w] = _toJSValue(w)
        self.init(unsafelyWrapping: object)
    }
    
    public var x: Double {
        get { jsObject[.x].fromJSValue()!}
        set { jsObject[.x] = newValue.jsValue }
    }
    
    public var y: Double {
        get { jsObject[.y].fromJSValue()!}
        set { jsObject[.y] = newValue.jsValue }
    }
    
    public var z: Double {
        get { jsObject[.z].fromJSValue()!}
        set { jsObject[.z] = newValue.jsValue }
    }
    
    public var w: Double {
        get { jsObject[.w].fromJSValue()!}
        set { jsObject[.w] = newValue.jsValue }
    }
}

public class DOMPointReadOnly: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMPointReadOnly].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(x: Double? = nil, y: Double? = nil, z: Double? = nil, w: Double? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(z), _toJSValue(w)]))
    }
    
    @inlinable public class func fromPoint(other: DOMPointInit? = nil) -> Self {
        let this = constructor!
        return this[.fromPoint].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }
    
    public var x: Double {
        jsObject[.x].fromJSValue()!
    }
    
    public var y: Double {
        jsObject[.y].fromJSValue()!
    }
    
    public var z: Double {
        jsObject[.z].fromJSValue()!
    }
    
    public var w: Double {
        jsObject[.w].fromJSValue()!
    }
    
    @inlinable public func matrixTransform(matrix: DOMMatrixInit? = nil) -> DOMPoint {
        let this = jsObject
        return this[.matrixTransform].function!(this: this, arguments: [_toJSValue(matrix)]).fromJSValue()!
    }
    
    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class DOMQuad: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMQuad].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(p1: DOMPointInit? = nil, p2: DOMPointInit? = nil, p3: DOMPointInit? = nil, p4: DOMPointInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(p1), _toJSValue(p2), _toJSValue(p3), _toJSValue(p4)]))
    }
    
    @inlinable public class func fromRect(other: DOMRectInit? = nil) -> Self {
        let this = constructor!
        return this[.fromRect].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }
    
    @inlinable public class func fromQuad(other: DOMQuadInit? = nil) -> Self {
        let this = constructor!
        return this[.fromQuad].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }
    
    public var p1: DOMPoint {
        jsObject[.p1].fromJSValue()!
    }
    
    public var p2: DOMPoint {
        jsObject[.p2].fromJSValue()!
    }
    
    public var p3: DOMPoint {
        jsObject[.p3].fromJSValue()!
    }
    
    public var p4: DOMPoint {
        jsObject[.p4].fromJSValue()!
    }
    
    @inlinable public func getBounds() -> DOMRect {
        let this = jsObject
        return this[.getBounds].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class DOMQuadInit: BridgedDictionary {
    public convenience init(p1: DOMPointInit, p2: DOMPointInit, p3: DOMPointInit, p4: DOMPointInit) {
        let object = JSObject.global[.Object].function!.new()
        object[.p1] = _toJSValue(p1)
        object[.p2] = _toJSValue(p2)
        object[.p3] = _toJSValue(p3)
        object[.p4] = _toJSValue(p4)
        self.init(unsafelyWrapping: object)
    }
    
    public required init(unsafelyWrapping object: JSObject) {
        super.init(unsafelyWrapping: object)
    }
    
    public var p1: DOMPointInit {
        get { jsObject[.p1].fromJSValue()!}
        set { jsObject[.p1] = newValue.jsValue }
    }
    
    public var p2: DOMPointInit {
        get { jsObject[.p2].fromJSValue()!}
        set { jsObject[.p2] = newValue.jsValue }
    }
    
    public var p3: DOMPointInit {
        get { jsObject[.p3].fromJSValue()!}
        set { jsObject[.p3] = newValue.jsValue }
    }
    
    public var p4: DOMPointInit {
        get { jsObject[.p4].fromJSValue()!}
        set { jsObject[.p4] = newValue.jsValue }
    }
}

public class DOMRect: DOMRectReadOnly {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.DOMRect].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
       super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init(x: Double? = nil, y: Double? = nil, width: Double? = nil, height: Double? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height)]))
    }
    
    @inlinable override public class func fromRect(other: DOMRectInit? = nil) -> Self {
        let this = constructor!
        return this[.fromRect].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }
    
     @inlinable override public var x: Double{
        get { jsObject[.x].fromJSValue()! }
        set { jsObject[.x] = newValue.jsValue }
    }
    
     @inlinable override public var y: Double{
        get { jsObject[.y].fromJSValue()! }
        set { jsObject[.y] = newValue.jsValue }
    }
    
     @inlinable override public var width: Double{
        get { jsObject[.width].fromJSValue()! }
        set { jsObject[.width] = newValue.jsValue }
    }
    
     @inlinable override public var height: Double{
        get { jsObject[.height].fromJSValue()! }
        set { jsObject[.height] = newValue.jsValue }
    }
}

public class DOMRectInit: BridgedDictionary {
    public convenience init(x: Double, y: Double, width: Double, height: Double) {
        let object = JSObject.global[.Object].function!.new()
        object[.x] = _toJSValue(x)
        object[.y] = _toJSValue(y)
        object[.width] = _toJSValue(width)
        object[.height] = _toJSValue(height)
        self.init(unsafelyWrapping: object)
    }
    
    public var x: Double {
        get { jsObject[.x].fromJSValue()!}
        set { jsObject[.x] = newValue.jsValue }
    }
    
    public var y: Double {
        get { jsObject[.y].fromJSValue()!}
        set { jsObject[.y] = newValue.jsValue }
    }
    
    public var width: Double {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }
    
    public var height: Double {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }
}

public class DOMRectList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMRectList].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var length: UInt32 {
        jsObject[.length].fromJSValue()!
    }
    
    @inlinable public subscript(key: Int) -> DOMRect? {
        jsObject[key].fromJSValue()
    }
    
    @inlinable public func item(index: UInt32) -> DOMRect? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }
}

public class DOMRectReadOnly: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMRectReadOnly].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(x: Double? = nil, y: Double? = nil, width: Double? = nil, height: Double? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(x), _toJSValue(y), _toJSValue(width), _toJSValue(height)]))
    }
    
    @inlinable public class func fromRect(other: DOMRectInit? = nil) -> Self {
        let this = constructor!
        return this[.fromRect].function!(this: this, arguments: [_toJSValue(other)]).fromJSValue()!
    }
    
    public var x: Double {
        jsObject[.x].fromJSValue()!
    }
    
    public var y: Double {
        jsObject[.y].fromJSValue()!
    }
    
    public var width: Double {
        jsObject[.width].fromJSValue()!
    }
    
    public var height: Double {
        jsObject[.height].fromJSValue()!
    }
    
    public var top: Double {
        jsObject[.top].fromJSValue()!
    }
    
    public var right: Double {
        jsObject[.right].fromJSValue()!
    }
    
    public var bottom: Double {
        jsObject[.bottom].fromJSValue()!
    }
    
    public var left: Double {
        jsObject[.left].fromJSValue()!
    }
    
    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}
