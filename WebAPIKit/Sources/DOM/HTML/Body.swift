//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase


public protocol Body: JSBridgedClass {}
public extension Body {
    @inlinable var body: ReadableStream? { jsObject[.body].fromJSValue() }

    @inlinable var bodyUsed: Bool { jsObject[.bodyUsed].fromJSValue()! }

    @inlinable func arrayBuffer() -> JSPromise {
        let this = jsObject
        return this[.arrayBuffer].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func arrayBuffer() async throws -> ArrayBuffer {
        let this = jsObject
        let _promise: JSPromise = this[.arrayBuffer].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable func blob() -> JSPromise {
        let this = jsObject
        return this[.blob].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func blob() async throws -> Blob {
        let this = jsObject
        let _promise: JSPromise = this[.blob].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable func formData() -> JSPromise {
        let this = jsObject
        return this[.formData].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func formData() async throws -> FormData {
        let this = jsObject
        let _promise: JSPromise = this[.formData].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable func json() -> JSPromise {
        let this = jsObject
        return this[.json].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func json() async throws -> JSValue {
        let this = jsObject
        let _promise: JSPromise = this[.json].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable func text() -> JSPromise {
        let this = jsObject
        return this[.text].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable func text() async throws -> String {
        let this = jsObject
        let _promise: JSPromise = this[.text].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}


