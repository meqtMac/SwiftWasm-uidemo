//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/14.
//

import JavaScriptKit
import JavaScriptBigIntSupport
import WebAPIBase
import JavaScriptEventLoop


public class ReadableByteStreamController: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ReadableByteStreamController].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var byobRequest: ReadableStreamBYOBRequest? {
        jsObject[.byobRequest].fromJSValue()
    }
    
    public var desiredSize: Double? {
        jsObject[.desiredSize].fromJSValue()
    }
    
    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
    
    @inlinable public func enqueue(chunk: ArrayBufferView) {
        let this = jsObject
        _ = this[.enqueue].function!(this: this, arguments: [_toJSValue(chunk)])
    }
    
    @inlinable public func error(e: JSValue? = nil) {
        let this = jsObject
        _ = this[.error].function!(this: this, arguments: [_toJSValue(e)])
    }
}

public class ReadableStream: JSBridgedClass, AsyncSequence {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ReadableStream].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(underlyingSource: JSObject? = nil, strategy: QueuingStrategy? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(underlyingSource), _toJSValue(strategy)]))
    }
    
    @inlinable public class func from(asyncIterable: JSValue) -> Self {
        let this = constructor!
        return this[.from].function!(this: this, arguments: [_toJSValue(asyncIterable)]).fromJSValue()!
    }
    
    public var locked: Bool {
        jsObject[.locked].fromJSValue()!
    }
    
    @inlinable public func cancel(reason: JSValue? = nil) -> JSPromise {
        let this = jsObject
        return this[.cancel].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func cancel(reason: JSValue? = nil) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.cancel].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
        _ = try await _promise.value
    }
    
    @inlinable public func getReader(options: ReadableStreamGetReaderOptions? = nil) -> ReadableStreamReader {
        let this = jsObject
        return this[.getReader].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }
    
    @inlinable public func pipeThrough(transform: ReadableWritablePair, options: StreamPipeOptions? = nil) -> Self {
        let this = jsObject
        return this[.pipeThrough].function!(this: this, arguments: [_toJSValue(transform), _toJSValue(options)]).fromJSValue()!
    }
    
    @inlinable public func pipeTo(destination: WritableStream, options: StreamPipeOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.pipeTo].function!(this: this, arguments: [_toJSValue(destination), _toJSValue(options)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func pipeTo(destination: WritableStream, options: StreamPipeOptions? = nil) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.pipeTo].function!(this: this, arguments: [_toJSValue(destination), _toJSValue(options)]).fromJSValue()!
        _ = try await _promise.value
    }
    
    @inlinable public func tee() -> [ReadableStream] {
        let this = jsObject
        return this[.tee].function!(this: this, arguments: []).fromJSValue()!
    }
    
    public typealias Element = JSValue
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public func makeAsyncIterator() -> ValueIterableAsyncIterator<ReadableStream> {
        ValueIterableAsyncIterator(sequence: self)
    }
}

public class ReadableStreamBYOBReader: JSBridgedClass, ReadableStreamGenericReader {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ReadableStreamBYOBReader].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(stream: ReadableStream) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(stream)]))
    }
    
    @inlinable public func read(view: ArrayBufferView) -> JSPromise {
        let this = jsObject
        return this[.read].function!(this: this, arguments: [_toJSValue(view)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func read(view: ArrayBufferView) async throws -> ReadableStreamReadResult {
        let this = jsObject
        let _promise: JSPromise = this[.read].function!(this: this, arguments: [_toJSValue(view)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @inlinable public func releaseLock() {
        let this = jsObject
        _ = this[.releaseLock].function!(this: this, arguments: [])
    }
}

public class ReadableStreamBYOBRequest: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ReadableStreamBYOBRequest].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var view: ArrayBufferView? {
        jsObject[.view].fromJSValue()
    }
    
    @inlinable public func respond(bytesWritten: UInt64) {
        let this = jsObject
        _ = this[.respond].function!(this: this, arguments: [_toJSValue(bytesWritten)])
    }
    
    @inlinable public func respondWithNewView(view: ArrayBufferView) {
        let this = jsObject
        _ = this[.respondWithNewView].function!(this: this, arguments: [_toJSValue(view)])
    }
}

public class ReadableStreamDefaultController: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ReadableStreamDefaultController].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var desiredSize: Double? {
        jsObject[.desiredSize].fromJSValue()
    }
    
    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
    
    @inlinable public func enqueue(chunk: JSValue? = nil) {
        let this = jsObject
        _ = this[.enqueue].function!(this: this, arguments: [_toJSValue(chunk)])
    }
    
    @inlinable public func error(e: JSValue? = nil) {
        let this = jsObject
        _ = this[.error].function!(this: this, arguments: [_toJSValue(e)])
    }
}

public class ReadableStreamDefaultReader: JSBridgedClass, ReadableStreamGenericReader {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ReadableStreamDefaultReader].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(stream: ReadableStream) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(stream)]))
    }
    
    @inlinable public func read() -> JSPromise {
        let this = jsObject
        return this[.read].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func read() async throws -> ReadableStreamReadResult {
        let this = jsObject
        let _promise: JSPromise = this[.read].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @inlinable public func releaseLock() {
        let this = jsObject
        _ = this[.releaseLock].function!(this: this, arguments: [])
    }
}

public protocol ReadableStreamGenericReader: JSBridgedClass {}
public extension ReadableStreamGenericReader {
    @inlinable var closed: JSPromise { jsObject[.closed].fromJSValue()! }
    
    @inlinable func cancel(reason: JSValue? = nil) -> JSPromise {
        let this = jsObject
        return this[.cancel].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func cancel(reason: JSValue? = nil) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.cancel].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
        _ = try await _promise.value
    }
}

public class ReadableStreamGetReaderOptions: BridgedDictionary {
    public convenience init(mode: ReadableStreamReaderMode) {
        let object = JSObject.global[.Object].function!.new()
        object[.mode] = _toJSValue(mode)
        self.init(unsafelyWrapping: object)
    }
    
    public var mode: ReadableStreamReaderMode {
        get { jsObject[.mode].fromJSValue()!}
        set { jsObject[.mode] = newValue.jsValue }
    }
}

public class ReadableStreamIteratorOptions: BridgedDictionary {
    public convenience init(preventCancel: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.preventCancel] = _toJSValue(preventCancel)
        self.init(unsafelyWrapping: object)
    }
    
    public var preventCancel: Bool {
        get { jsObject[.preventCancel].fromJSValue()!}
        set { jsObject[.preventCancel] = newValue.jsValue }
    }
}

public class ReadableStreamReadResult: BridgedDictionary {
    public convenience init(value: JSValue, done: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.value] = _toJSValue(value)
        object[.done] = _toJSValue(done)
        self.init(unsafelyWrapping: object)
    }
    
   public var value: JSValue {
        get { jsObject[.value].fromJSValue()!}
        set { jsObject[.value] = newValue.jsValue }
    }
    
    public var done: Bool {
        get { jsObject[.done].fromJSValue()!}
        set { jsObject[.done] = newValue.jsValue }
    }
}

public enum ReadableStreamReaderMode: JSString, JSValueCompatible {
    case byob = "byob"
    
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

public enum ReadableStreamType: JSString, JSValueCompatible {
    case bytes = "bytes"
    
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

public class ReadableWritablePair: BridgedDictionary {
    public convenience init(readable: ReadableStream, writable: WritableStream) {
        let object = JSObject.global[.Object].function!.new()
        object[.readable] = _toJSValue(readable)
        object[.writable] = _toJSValue(writable)
        self.init(unsafelyWrapping: object)
    }
    
   public var readable: ReadableStream {
        get { jsObject[.readable].fromJSValue()!}
        set { jsObject[.readable] = newValue.jsValue }
    }
    
    public var writable: WritableStream {
        get { jsObject[.writable].fromJSValue()!}
        set { jsObject[.writable] = newValue.jsValue }
    }
}

public enum ReadableStreamController: JSValueCompatible {
    case readableByteStreamController(ReadableByteStreamController)
    case readableStreamDefaultController(ReadableStreamDefaultController)
    
    public static func construct(from value: JSValue) -> Self? {
        if let readableByteStreamController: ReadableByteStreamController = value.fromJSValue() {
            return .readableByteStreamController(readableByteStreamController)
        }
        if let readableStreamDefaultController: ReadableStreamDefaultController = value.fromJSValue() {
            return .readableStreamDefaultController(readableStreamDefaultController)
        }
        return nil
    }
    
    public var jsValue: JSValue {
        switch self {
        case let .readableByteStreamController(readableByteStreamController):
            return readableByteStreamController.jsValue
        case let .readableStreamDefaultController(readableStreamDefaultController):
            return readableStreamDefaultController.jsValue
        }
    }
}

public enum ReadableStreamReader: JSValueCompatible {
    case readableStreamBYOBReader(ReadableStreamBYOBReader)
    case readableStreamDefaultReader(ReadableStreamDefaultReader)
    
    public static func construct(from value: JSValue) -> Self? {
        if let readableStreamBYOBReader: ReadableStreamBYOBReader = value.fromJSValue() {
            return .readableStreamBYOBReader(readableStreamBYOBReader)
        }
        if let readableStreamDefaultReader: ReadableStreamDefaultReader = value.fromJSValue() {
            return .readableStreamDefaultReader(readableStreamDefaultReader)
        }
        return nil
    }
    
    public var jsValue: JSValue {
        switch self {
        case let .readableStreamBYOBReader(readableStreamBYOBReader):
            return readableStreamBYOBReader.jsValue
        case let .readableStreamDefaultReader(readableStreamDefaultReader):
            return readableStreamDefaultReader.jsValue
        }
    }
}
