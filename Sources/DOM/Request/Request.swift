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


public enum HeadersInit: JSValueCompatible {
    case dict([String: String])
    case array([[String]])
    
    public static func construct(from value: JSValue) -> Self? {
        if let dict: [String: String] = value.fromJSValue() {
            return .dict(dict)
        }
        if let array: [[String]] = value.fromJSValue() {
            return .array(array)
        }
        return nil
    }
    
    public var jsValue: JSValue {
        switch self {
        case let .dict(dict):
            return dict.jsValue
        case let .array(array):
            return array.jsValue
        }
    }
}

public enum RequestCache: JSString, JSValueCompatible {
    case `default` = "default"
    case noStore = "no-store"
    case reload = "reload"
    case noCache = "no-cache"
    case forceCache = "force-cache"
    case onlyIfCached = "only-if-cached"
    
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

public enum RequestCredentials: JSString, JSValueCompatible {
    case omit = "omit"
    case sameOrigin = "same-origin"
    case include = "include"
    
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

public enum RequestDestination: JSString, JSValueCompatible {
    case _empty = ""
    case audio = "audio"
    case audioworklet = "audioworklet"
    case document = "document"
    case embed = "embed"
    case font = "font"
    case frame = "frame"
    case iframe = "iframe"
    case image = "image"
    case manifest = "manifest"
    case object = "object"
    case paintworklet = "paintworklet"
    case report = "report"
    case script = "script"
    case sharedworker = "sharedworker"
    case style = "style"
    case track = "track"
    case video = "video"
    case worker = "worker"
    case xslt = "xslt"
    
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

public enum RequestDuplex: JSString, JSValueCompatible {
    case half = "half"
    
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

public class RequestInit: BridgedDictionary {
    
    public convenience init(method: String,
                            headers: [[String]],
                            body: XMLHttpRequestBodyInit?,
                            referrer: String,
                            referrerPolicy: ReferrerPolicy,
                            mode: RequestMode,
                            credentials: RequestCredentials,
                            cache: RequestCache,
                            redirect: RequestRedirect,
                            integrity: String,
                            keepalive: Bool,
                            signal: AbortSignal?,
                            duplex: RequestDuplex,
                            priority: RequestPriority,
                            window: JSValue) {
        let object = JSObject.global[.Object].function!.new()
        object[.method] = _toJSValue(method)
        object[.headers] = _toJSValue(headers)
        object[.body] = _toJSValue(body)
        object[.referrer] = _toJSValue(referrer)
        object[.referrerPolicy] = _toJSValue(referrerPolicy)
        object[.mode] = _toJSValue(mode)
        object[.credentials] = _toJSValue(credentials)
        object[.cache] = _toJSValue(cache)
        object[.redirect] = _toJSValue(redirect)
        object[.integrity] = _toJSValue(integrity)
        object[.keepalive] = _toJSValue(keepalive)
        object[.signal] = _toJSValue(signal)
        object[.duplex] = _toJSValue(duplex)
        object[.priority] = _toJSValue(priority)
        object[.window] = _toJSValue(window)
        self.init(unsafelyWrapping: object)
    }
    public convenience init(method: String,
                            headers: [String: String],
                            body: XMLHttpRequestBodyInit?,
                            referrer: String,
                            referrerPolicy: ReferrerPolicy,
                            mode: RequestMode,
                            credentials: RequestCredentials,
                            cache: RequestCache,
                            redirect: RequestRedirect,
                            integrity: String,
                            keepalive: Bool,
                            signal: AbortSignal?,
                            duplex: RequestDuplex,
                            priority: RequestPriority,
                            window: JSValue) {
        let object = JSObject.global[.Object].function!.new()
        object[.method] = _toJSValue(method)
        object[.headers] = _toJSValue(headers)
        object[.body] = _toJSValue(body)
        object[.referrer] = _toJSValue(referrer)
        object[.referrerPolicy] = _toJSValue(referrerPolicy)
        object[.mode] = _toJSValue(mode)
        object[.credentials] = _toJSValue(credentials)
        object[.cache] = _toJSValue(cache)
        object[.redirect] = _toJSValue(redirect)
        object[.integrity] = _toJSValue(integrity)
        object[.keepalive] = _toJSValue(keepalive)
        object[.signal] = _toJSValue(signal)
        object[.duplex] = _toJSValue(duplex)
        object[.priority] = _toJSValue(priority)
        object[.window] = _toJSValue(window)
        self.init(unsafelyWrapping: object)
    }
    
    
    public var method: String {
        get { jsObject[.method].fromJSValue()!}
        set { jsObject[.method] = newValue.jsValue }
    }
    
    public var headers: HeadersInit {
        get { jsObject[.headers].fromJSValue()!}
        set { jsObject[.headers] = newValue.jsValue }
    }
    
    public var body: XMLHttpRequestBodyInit? {
        get { jsObject[.body].fromJSValue()}
        set { jsObject[.body] = newValue.jsValue }
    }
    
    public var referrer: String {
        get { jsObject[.referrer].fromJSValue()!}
        set { jsObject[.referrer] = newValue.jsValue }
    }
    
    public var referrerPolicy: ReferrerPolicy {
        get { jsObject[.referrerPolicy].fromJSValue()!}
        set { jsObject[.referrerPolicy] = newValue.jsValue }
    }
    
    public var mode: RequestMode {
        get { jsObject[.mode].fromJSValue()!}
        set { jsObject[.mode] = newValue.jsValue }
    }
    
    public var credentials: RequestCredentials {
        get { jsObject[.credentials].fromJSValue()!}
        set { jsObject[.credentials] = newValue.jsValue }
    }
    
    public var cache: RequestCache {
        get { jsObject[.cache].fromJSValue()!}
        set { jsObject[.cache] = newValue.jsValue }
    }
    
    public var redirect: RequestRedirect {
        get { jsObject[.redirect].fromJSValue()!}
        set { jsObject[.redirect] = newValue.jsValue }
    }
    
    public var integrity: String {
        get { jsObject[.integrity].fromJSValue()!}
        set { jsObject[.integrity] = newValue.jsValue }
    }
    
    public var keepalive: Bool {
        get { jsObject[.keepalive].fromJSValue()!}
        set { jsObject[.keepalive] = newValue.jsValue }
    }
    
    public var signal: AbortSignal? {
        get { jsObject[.signal].fromJSValue()}
        set { jsObject[.signal] = newValue.jsValue }
    }
    
    public var duplex: RequestDuplex {
        get { jsObject[.duplex].fromJSValue()!}
        set { jsObject[.duplex] = newValue.jsValue }
    }
    
    public var priority: RequestPriority {
        get { jsObject[.priority].fromJSValue()!}
        set { jsObject[.priority] = newValue.jsValue }
    }
    
    public var window: JSValue {
        get { jsObject[.window].fromJSValue()!}
        set { jsObject[.window] = newValue.jsValue }
    }
    
}

public enum RequestMode: JSString, JSValueCompatible {
    case navigate = "navigate"
    case sameOrigin = "same-origin"
    case noCors = "no-cors"
    case cors = "cors"
    
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

public enum RequestPriority: JSString, JSValueCompatible {
    case high = "high"
    case low = "low"
    case auto = "auto"
    
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

public enum RequestRedirect: JSString, JSValueCompatible {
    case follow = "follow"
    case error = "error"
    case manual = "manual"
    
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
public class Response: JSBridgedClass, Body {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.Response].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
       self.jsObject = jsObject
    }
    
    @inlinable public convenience init(body: XMLHttpRequestBodyInit? = nil, init: ResponseInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(body), _toJSValue(`init`)]))
    }
    
    @inlinable public class func error() -> Self {
        let this = constructor!
        return this[.error].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public class func redirect(url: String, status: UInt16? = nil) -> Self {
        let this = constructor!
        return this[.redirect].function!(this: this, arguments: [_toJSValue(url), _toJSValue(status)]).fromJSValue()!
    }
    
    @inlinable public class func json(data: JSValue, init: ResponseInit? = nil) -> Self {
        let this = constructor!
        return this[.json].function!(this: this, arguments: [_toJSValue(data), _toJSValue(`init`)]).fromJSValue()!
    }
    
    public var type: ResponseType {
        jsObject[.type].fromJSValue()!
    }
    
    public var url: String {
        jsObject[.url].fromJSValue()!
    }
    
    public var redirected: Bool {
        jsObject[.redirected].fromJSValue()!
    }
    
    public var status: UInt16 {
        jsObject[.status].fromJSValue()!
    }
    
    public var ok: Bool {
        jsObject[.ok].fromJSValue()!
    }
    
    public var statusText: String {
        jsObject[.statusText].fromJSValue()!
    }
    
    public var headers: Headers {
        jsObject[.headers].fromJSValue()!
    }
    
    @inlinable public func clone() -> Self {
        let this = jsObject
        return this[.clone].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class ResponseInit: BridgedDictionary {
    public convenience init(status: UInt16, statusText: String, headers: [String: String]) {
        let object = JSObject.global[.Object].function!.new()
        object[.status] = _toJSValue(status)
        object[.statusText] = _toJSValue(statusText)
        object[.headers] = _toJSValue(headers)
        self.init(unsafelyWrapping: object)
    }
    
    public convenience init(status: UInt16, statusText: String, headers: [[String]]) {
        let object = JSObject.global[.Object].function!.new()
        object[.status] = _toJSValue(status)
        object[.statusText] = _toJSValue(statusText)
        object[.headers] = _toJSValue(headers)
        self.init(unsafelyWrapping: object)
    }
    
    public var status: UInt16 {
        get { jsObject[.status].fromJSValue()!}
        set { jsObject[.status] = newValue.jsValue }
    }
    
    public var statusText: String {
        get { jsObject[.statusText].fromJSValue()!}
        set { jsObject[.statusText] = newValue.jsValue }
    }
    
    public var headers: HeadersInit {
        get { jsObject[.headers].fromJSValue()!}
        set { jsObject[.headers] = newValue.jsValue }
    }
}

public enum ResponseType: JSString, JSValueCompatible {
    case basic = "basic"
    case cors = "cors"
    case `default` = "default"
    case error = "error"
    case opaque = "opaque"
    case opaqueredirect = "opaqueredirect"
    
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

public class Request: JSBridgedClass, Body {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.Request].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
       self.jsObject = jsObject
    }
    
    @inlinable public convenience init(input: RequestInfo, init: RequestInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(input), _toJSValue(`init`)]))
    }
    
    public var method: String {
        jsObject[.method].fromJSValue()!
    }
    
    public var url: String {
        jsObject[.url].fromJSValue()!
    }
    
    public var headers: Headers {
        jsObject[.headers].fromJSValue()!
    }
    
    public var destination: RequestDestination {
        jsObject[.destination].fromJSValue()!
    }
    
    public var referrer: String {
        jsObject[.referrer].fromJSValue()!
    }
    
    public var referrerPolicy: ReferrerPolicy {
        jsObject[.referrerPolicy].fromJSValue()!
    }
    
    public var mode: RequestMode {
        jsObject[.mode].fromJSValue()!
    }
    
    public var credentials: RequestCredentials {
        jsObject[.credentials].fromJSValue()!
    }
    
    public var cache: RequestCache {
        jsObject[.cache].fromJSValue()!
    }
    
    public var redirect: RequestRedirect {
        jsObject[.redirect].fromJSValue()!
    }
    
    public var integrity: String {
        jsObject[.integrity].fromJSValue()!
    }
    
    public var keepalive: Bool {
        jsObject[.keepalive].fromJSValue()!
    }
    
    public var isReloadNavigation: Bool {
        jsObject[.isReloadNavigation].fromJSValue()!
    }
    
    public var isHistoryNavigation: Bool {
        jsObject[.isHistoryNavigation].fromJSValue()!
    }
    
    public var signal: AbortSignal {
        jsObject[.signal].fromJSValue()!
    }
    
    public var duplex: RequestDuplex {
        jsObject[.duplex].fromJSValue()!
    }
    
    @inlinable public func clone() -> Self {
        let this = jsObject
        return this[.clone].function!(this: this, arguments: []).fromJSValue()!
    }
}
