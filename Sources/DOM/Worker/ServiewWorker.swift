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

public class ServiceWorker: EventTarget, AbstractWorker {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.ServiceWorker].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onstatechange = ClosureAttribute1Optional(jsObject: jsObject, name: .onstatechange)
        super.init(unsafelyWrapping: jsObject)
    }
    
    public var scriptURL: String {
        jsObject[.scriptURL].fromJSValue()!
    }
    
    public var state: ServiceWorkerState {
        jsObject[.state].fromJSValue()!
    }
    
    @inlinable public func postMessage(message: JSValue, transfer: [JSObject]) {
        let this = jsObject
        _ = this[.postMessage].function!(this: this, arguments: [_toJSValue(message), _toJSValue(transfer)])
    }
    
    @inlinable public func postMessage(message: JSValue, options: StructuredSerializeOptions? = nil) {
        let this = jsObject
        _ = this[.postMessage].function!(this: this, arguments: [_toJSValue(message), _toJSValue(options)])
    }
    
    @ClosureAttribute1Optional
    public var onstatechange: EventHandler
}

public class ServiceWorkerContainer: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.ServiceWorkerContainer].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
       _oncontrollerchange = ClosureAttribute1Optional(jsObject: jsObject, name: .oncontrollerchange)
        _onmessage = ClosureAttribute1Optional(jsObject: jsObject, name: .onmessage)
        _onmessageerror = ClosureAttribute1Optional(jsObject: jsObject, name: .onmessageerror)
        super.init(unsafelyWrapping: jsObject)
    }
    
    public var controller: ServiceWorker? {
        jsObject[.controller].fromJSValue()
    }
    
    public var ready: JSPromise {
        jsObject[.ready].fromJSValue()!
    }
    
    @inlinable public func register(scriptURL: String, options: RegistrationOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.register].function!(this: this, arguments: [_toJSValue(scriptURL), _toJSValue(options)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func register(scriptURL: String, options: RegistrationOptions? = nil) async throws -> ServiceWorkerRegistration {
        let this = jsObject
        let _promise: JSPromise = this[.register].function!(this: this, arguments: [_toJSValue(scriptURL), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @inlinable public func getRegistration(clientURL: String? = nil) -> JSPromise {
        let this = jsObject
        return this[.getRegistration].function!(this: this, arguments: [_toJSValue(clientURL)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func getRegistration(clientURL: String? = nil) async throws -> ServiceWorkerRegistration? {
        let this = jsObject
        let _promise: JSPromise = this[.getRegistration].function!(this: this, arguments: [_toJSValue(clientURL)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @inlinable public func getRegistrations() -> JSPromise {
        let this = jsObject
        return this[.getRegistrations].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func getRegistrations() async throws -> [ServiceWorkerRegistration] {
        let this = jsObject
        let _promise: JSPromise = this[.getRegistrations].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @inlinable public func startMessages() {
        let this = jsObject
        _ = this[.startMessages].function!(this: this, arguments: [])
    }
    
    @ClosureAttribute1Optional
    public var oncontrollerchange: EventHandler
    
    @ClosureAttribute1Optional
    public var onmessage: EventHandler
    
    @ClosureAttribute1Optional
    public var onmessageerror: EventHandler
}

public class ServiceWorkerRegistration: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.ServiceWorkerRegistration].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onupdatefound = ClosureAttribute1Optional(jsObject: jsObject, name: .onupdatefound)
        super.init(unsafelyWrapping: jsObject)
    }
    
    public var installing: ServiceWorker? {
        jsObject[.installing].fromJSValue()
    }
    
    public var waiting: ServiceWorker? {
        jsObject[.waiting].fromJSValue()
    }
    
    public var active: ServiceWorker? {
        jsObject[.active].fromJSValue()
    }
    
    public var navigationPreload: NavigationPreloadManager {
        jsObject[.navigationPreload].fromJSValue()!
    }
    
    public var scope: String {
        jsObject[.scope].fromJSValue()!
    }
    
    public var updateViaCache: ServiceWorkerUpdateViaCache {
        jsObject[.updateViaCache].fromJSValue()!
    }
    
    @inlinable public func update() -> JSPromise {
        let this = jsObject
        return this[.update].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func update() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.update].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }
    
    @inlinable public func unregister() -> JSPromise {
        let this = jsObject
        return this[.unregister].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func unregister() async throws -> Bool {
        let this = jsObject
        let _promise: JSPromise = this[.unregister].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @ClosureAttribute1Optional
    public var onupdatefound: EventHandler
}

public enum ServiceWorkerState: JSString, JSValueCompatible {
    case parsed = "parsed"
    case installing = "installing"
    case installed = "installed"
    case activating = "activating"
    case activated = "activated"
    case redundant = "redundant"
    
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

public enum ServiceWorkerUpdateViaCache: JSString, JSValueCompatible {
    case imports = "imports"
    case all = "all"
    case none = "none"
    
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
