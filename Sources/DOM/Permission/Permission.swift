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

public class PermissionDescriptor: BridgedDictionary {
    public convenience init(name: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.name] = _toJSValue(name)
        self.init(unsafelyWrapping: object)
    }
    
    public var name: String {
        get { jsObject[.name].fromJSValue()!}
        set { jsObject[.name] = newValue.jsValue }
    }
}

public class PermissionSetParameters: BridgedDictionary {
    public convenience init(descriptor: PermissionDescriptor, state: PermissionState) {
        let object = JSObject.global[.Object].function!.new()
        object[.descriptor] = _toJSValue(descriptor)
        object[.state] = _toJSValue(state)
        self.init(unsafelyWrapping: object)
    }
    
    public var descriptor: PermissionDescriptor {
        get { jsObject[.descriptor].fromJSValue()!}
        set { jsObject[.descriptor] = newValue.jsValue }
    }
    
    public var state: PermissionState {
        get { jsObject[.state].fromJSValue()!}
        set { jsObject[.state] = newValue.jsValue }
    }
}

public enum PermissionState: JSString, JSValueCompatible {
    case granted = "granted"
    case denied = "denied"
    case prompt = "prompt"
    
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

public class PermissionStatus: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.PermissionStatus].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onchange = ClosureAttribute1Optional(jsObject: jsObject, name: .onchange)
        super.init(unsafelyWrapping: jsObject)
    }
    
    public var state: PermissionState {
        jsObject[.state].fromJSValue()!
    }
    
    public var name: String {
        jsObject[.name].fromJSValue()!
    }
    
    @ClosureAttribute1Optional
    public var onchange: EventHandler
}

public class Permissions: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.Permissions].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public func query(permissionDesc: JSObject) -> JSPromise {
        let this = jsObject
        return this[.query].function!(this: this, arguments: [_toJSValue(permissionDesc)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func query(permissionDesc: JSObject) async throws -> PermissionStatus {
        let this = jsObject
        let _promise: JSPromise = this[.query].function!(this: this, arguments: [_toJSValue(permissionDesc)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

