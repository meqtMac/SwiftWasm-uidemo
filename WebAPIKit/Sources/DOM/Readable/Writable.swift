//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import JavaScriptKit
import JavaScriptBigIntSupport
import WebAPIBase
import JavaScriptEventLoop

open class WritableStream: JSBridgedClass {
    @inlinable open class var constructor: JSFunction? { JSObject.global[.WritableStream].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(underlyingSink: JSObject? = nil, strategy: QueuingStrategy? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(underlyingSink), _toJSValue(strategy)]))
    }
    
    public var locked: Bool {
        jsObject[.locked].fromJSValue()!
    }
    
    @inlinable public func abort(reason: JSValue? = nil) -> JSPromise {
        let this = jsObject
        return this[.abort].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func abort(reason: JSValue? = nil) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.abort].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
        _ = try await _promise.value
    }
    
    @inlinable public func close() -> JSPromise {
        let this = jsObject
        return this[.close].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func close() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.close].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }
    
    @inlinable public func getWriter() -> WritableStreamDefaultWriter {
        let this = jsObject
        return this[.getWriter].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class WritableStreamDefaultController: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.WritableStreamDefaultController].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var signal: AbortSignal {
        jsObject[.signal].fromJSValue()!
    }
    
    @inlinable public func error(e: JSValue? = nil) {
        let this = jsObject
        _ = this[.error].function!(this: this, arguments: [_toJSValue(e)])
    }
}

public class WritableStreamDefaultWriter: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.WritableStreamDefaultWriter].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(stream: WritableStream) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(stream)]))
    }
    
    public var closed: JSPromise {
        jsObject[.closed].fromJSValue()!
    }
    
    public var desiredSize: Double? {
        jsObject[.desiredSize].fromJSValue()
    }
    
    public var ready: JSPromise {
        jsObject[.ready].fromJSValue()!
    }
    
    @inlinable public func abort(reason: JSValue? = nil) -> JSPromise {
        let this = jsObject
        return this[.abort].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func abort(reason: JSValue? = nil) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.abort].function!(this: this, arguments: [_toJSValue(reason)]).fromJSValue()!
        _ = try await _promise.value
    }
    
    @inlinable public func close() -> JSPromise {
        let this = jsObject
        return this[.close].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func close() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.close].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }
    
    @inlinable public func releaseLock() {
        let this = jsObject
        _ = this[.releaseLock].function!(this: this, arguments: [])
    }
    
    @inlinable public func write(chunk: JSValue? = nil) -> JSPromise {
        let this = jsObject
        return this[.write].function!(this: this, arguments: [_toJSValue(chunk)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func write(chunk: JSValue? = nil) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.write].function!(this: this, arguments: [_toJSValue(chunk)]).fromJSValue()!
        _ = try await _promise.value
    }
}

