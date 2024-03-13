//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import JavaScriptKit
import JavaScriptEventLoop
import JavaScriptBigIntSupport
import WebAPIBase
import ECMAScript

public class TransformStream: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.TransformStream].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(transformer: JSObject? = nil, writableStrategy: QueuingStrategy? = nil, readableStrategy: QueuingStrategy? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(transformer), _toJSValue(writableStrategy), _toJSValue(readableStrategy)]))
    }
    
    public var readable: ReadableStream {
        jsObject[.readable].fromJSValue()!
    }
    
    public var writable: WritableStream {
        jsObject[.writable].fromJSValue()!
    }
}

public class TransformStreamDefaultController: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.TransformStreamDefaultController].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var desiredSize: Double? {
        jsObject[.desiredSize].fromJSValue()
    }
    
    @inlinable public func enqueue(chunk: JSValue? = nil) {
        let this = jsObject
        _ = this[.enqueue].function!(this: this, arguments: [_toJSValue(chunk)])
    }
    
    @inlinable public func error(reason: JSValue? = nil) {
        let this = jsObject
        _ = this[.error].function!(this: this, arguments: [_toJSValue(reason)])
    }
    
    @inlinable public func terminate() {
        let this = jsObject
        _ = this[.terminate].function!(this: this, arguments: [])
    }
}

public class Transformer: BridgedDictionary {
    public convenience init(start: @escaping TransformerStartCallback, transform: @escaping TransformerTransformCallback, flush: @escaping TransformerFlushCallback, readableType: JSValue, writableType: JSValue) {
        let object = JSObject.global[.Object].function!.new()
        ClosureAttribute1[.start, in: object] = start
        ClosureAttribute2[.transform, in: object] = transform
        ClosureAttribute1[.flush, in: object] = flush
        object[.readableType] = _toJSValue(readableType)
        object[.writableType] = _toJSValue(writableType)
        self.init(unsafelyWrapping: object)
    }
    
    public required init(unsafelyWrapping object: JSObject) {
        _start = ClosureAttribute1(jsObject: object, name: .start)
        _transform = ClosureAttribute2(jsObject: object, name: .transform)
        _flush = ClosureAttribute1(jsObject: object, name: .flush)
        super.init(unsafelyWrapping: object)
    }
    
    @ClosureAttribute1
    public var start: TransformerStartCallback
    
    @ClosureAttribute2
    public var transform: TransformerTransformCallback
    
    @ClosureAttribute1
    public var flush: TransformerFlushCallback
    
    public var readableType: JSValue {
        get { jsObject[.readableType].fromJSValue()!}
        set { jsObject[.readableType] = newValue.jsValue }
    }
    
    public var writableType: JSValue {
        get { jsObject[.writableType].fromJSValue()!}
        set { jsObject[.writableType] = newValue.jsValue }
    }
}

