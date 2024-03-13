//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import JavaScriptKit
import WebAPIBase
import JavaScriptEventLoop


public class Cache: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.Cache].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public func match(request: RequestInfo, options: CacheQueryOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.match].function!(this: this, arguments: [_toJSValue(request), _toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func match(request: RequestInfo, options: CacheQueryOptions? = nil) async throws -> Response? {
        let this = jsObject
        let _promise: JSPromise = this[.match].function!(this: this, arguments: [_toJSValue(request), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable public func matchAll(request: RequestInfo? = nil, options: CacheQueryOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.matchAll].function!(this: this, arguments: [_toJSValue(request), _toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func matchAll(request: RequestInfo? = nil, options: CacheQueryOptions? = nil) async throws -> [Response] {
        let this = jsObject
        let _promise: JSPromise = this[.matchAll].function!(this: this, arguments: [_toJSValue(request), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable public func add(request: RequestInfo) -> JSPromise {
        let this = jsObject
        return this[.add].function!(this: this, arguments: [_toJSValue(request)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func add(request: RequestInfo) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.add].function!(this: this, arguments: [_toJSValue(request)]).fromJSValue()!
        _ = try await _promise.value
    }

    @inlinable public func addAll(requests: [RequestInfo]) -> JSPromise {
        let this = jsObject
        return this[.addAll].function!(this: this, arguments: [_toJSValue(requests)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func addAll(requests: [RequestInfo]) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.addAll].function!(this: this, arguments: [_toJSValue(requests)]).fromJSValue()!
        _ = try await _promise.value
    }

    @inlinable public func put(request: RequestInfo, response: Response) -> JSPromise {
        let this = jsObject
        return this[.put].function!(this: this, arguments: [_toJSValue(request), _toJSValue(response)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func put(request: RequestInfo, response: Response) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.put].function!(this: this, arguments: [_toJSValue(request), _toJSValue(response)]).fromJSValue()!
        _ = try await _promise.value
    }

    @inlinable public func delete(request: RequestInfo, options: CacheQueryOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.delete].function!(this: this, arguments: [_toJSValue(request), _toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func delete(request: RequestInfo, options: CacheQueryOptions? = nil) async throws -> Bool {
        let this = jsObject
        let _promise: JSPromise = this[.delete].function!(this: this, arguments: [_toJSValue(request), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable public func keys(request: RequestInfo? = nil, options: CacheQueryOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.keys].function!(this: this, arguments: [_toJSValue(request), _toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func keys(request: RequestInfo? = nil, options: CacheQueryOptions? = nil) async throws -> [Request] {
        let this = jsObject
        let _promise: JSPromise = this[.keys].function!(this: this, arguments: [_toJSValue(request), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

public class CacheQueryOptions: BridgedDictionary {
    public convenience init(ignoreSearch: Bool, ignoreMethod: Bool, ignoreVary: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.ignoreSearch] = _toJSValue(ignoreSearch)
        object[.ignoreMethod] = _toJSValue(ignoreMethod)
        object[.ignoreVary] = _toJSValue(ignoreVary)
        self.init(unsafelyWrapping: object)
    }

    public var ignoreSearch: Bool {
        get { jsObject[.ignoreSearch].fromJSValue()!}
        set { jsObject[.ignoreSearch] = newValue.jsValue }
    }

    public var ignoreMethod: Bool {
        get { jsObject[.ignoreMethod].fromJSValue()!}
        set { jsObject[.ignoreMethod] = newValue.jsValue }
    }

    public var ignoreVary: Bool {
        get { jsObject[.ignoreVary].fromJSValue()!}
        set { jsObject[.ignoreVary] = newValue.jsValue }
    }
}

public class CacheStorage: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.CacheStorage].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public func match(request: RequestInfo, options: MultiCacheQueryOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.match].function!(this: this, arguments: [_toJSValue(request), _toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func match(request: RequestInfo, options: MultiCacheQueryOptions? = nil) async throws -> Response? {
        let this = jsObject
        let _promise: JSPromise = this[.match].function!(this: this, arguments: [_toJSValue(request), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable public func has(cacheName: String) -> JSPromise {
        let this = jsObject
        return this[.has].function!(this: this, arguments: [_toJSValue(cacheName)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func has(cacheName: String) async throws -> Bool {
        let this = jsObject
        let _promise: JSPromise = this[.has].function!(this: this, arguments: [_toJSValue(cacheName)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable public func open(cacheName: String) -> JSPromise {
        let this = jsObject
        return this[.open].function!(this: this, arguments: [_toJSValue(cacheName)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func open(cacheName: String) async throws -> Cache {
        let this = jsObject
        let _promise: JSPromise = this[.open].function!(this: this, arguments: [_toJSValue(cacheName)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable public func delete(cacheName: String) -> JSPromise {
        let this = jsObject
        return this[.delete].function!(this: this, arguments: [_toJSValue(cacheName)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func delete(cacheName: String) async throws -> Bool {
        let this = jsObject
        let _promise: JSPromise = this[.delete].function!(this: this, arguments: [_toJSValue(cacheName)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @inlinable public func keys() -> JSPromise {
        let this = jsObject
        return this[.keys].function!(this: this, arguments: []).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func keys() async throws -> [String] {
        let this = jsObject
        let _promise: JSPromise = this[.keys].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

public enum RequestInfo: JSValueCompatible {
    case request(Request)
    case string(String)

    public static func construct(from value: JSValue) -> Self? {
        if let request: Request = value.fromJSValue() {
            return .request(request)
        }
        if let string: String = value.fromJSValue() {
            return .string(string)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .request(request):
            return request.jsValue
        case let .string(string):
            return string.jsValue
        }
    }
}
