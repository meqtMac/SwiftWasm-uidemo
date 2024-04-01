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


public class Performance: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.Performance].function }
    
    @inlinable public func now() -> DOMHighResTimeStamp {
        let this = jsObject
        return this[.now].function!(this: this, arguments: []).fromJSValue()!
    }
    
    public var timeOrigin: DOMHighResTimeStamp {
        jsObject[.timeOrigin].fromJSValue()!
    }
    
    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func getEntries() -> PerformanceEntryList {
        let this = jsObject
        return this[.getEntries].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func getEntriesByType(type: String) -> PerformanceEntryList {
        let this = jsObject
        return this[.getEntriesByType].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }
    
    @inlinable public func getEntriesByName(name: String, type: String? = nil) -> PerformanceEntryList {
        let this = jsObject
        return this[.getEntriesByName].function!(this: this, arguments: [_toJSValue(name), _toJSValue(type)]).fromJSValue()!
    }
}

public class PerformanceEntry: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.PerformanceEntry].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
       self.jsObject = jsObject
    }
    
    public var name: String {
        jsObject[.name].fromJSValue()!
    }
    
    public var entryType: String {
        jsObject[.entryType].fromJSValue()!
    }
    
    public var startTime: DOMHighResTimeStamp {
        jsObject[.startTime].fromJSValue()!
    }
    
    public var duration: DOMHighResTimeStamp {
        jsObject[.duration].fromJSValue()!
    }
    
    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class PerformanceObserver: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.PerformanceObserver].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(callback: @escaping PerformanceObserverCallback) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(callback)]))
    }
    
    @inlinable public func observe(options: PerformanceObserverInit? = nil) {
        let this = jsObject
        _ = this[.observe].function!(this: this, arguments: [_toJSValue(options)])
    }
    
    @inlinable public func disconnect() {
        let this = jsObject
        _ = this[.disconnect].function!(this: this, arguments: [])
    }
    
    @inlinable public func takeRecords() -> PerformanceEntryList {
        let this = jsObject
        return this[.takeRecords].function!(this: this, arguments: []).fromJSValue()!
    }
    
    public var supportedEntryTypes: [String] {
        jsObject[.supportedEntryTypes].fromJSValue()!
    }
}

public class PerformanceObserverCallbackOptions: BridgedDictionary {
    public convenience init(droppedEntriesCount: UInt64) {
        let object = JSObject.global[.Object].function!.new()
        object[.droppedEntriesCount] = _toJSValue(droppedEntriesCount)
        self.init(unsafelyWrapping: object)
    }
    
    public var droppedEntriesCount: UInt64 {
        get { jsObject[.droppedEntriesCount].fromJSValue()!}
        set { jsObject[.droppedEntriesCount] = newValue.jsValue }
    }
}

public class PerformanceObserverEntryList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.PerformanceObserverEntryList].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public func getEntries() -> PerformanceEntryList {
        let this = jsObject
        return this[.getEntries].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func getEntriesByType(type: String) -> PerformanceEntryList {
        let this = jsObject
        return this[.getEntriesByType].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }
    
    @inlinable public func getEntriesByName(name: String, type: String? = nil) -> PerformanceEntryList {
        let this = jsObject
        return this[.getEntriesByName].function!(this: this, arguments: [_toJSValue(name), _toJSValue(type)]).fromJSValue()!
    }
}

public class PerformanceObserverInit: BridgedDictionary {
    public convenience init(entryTypes: [String], type: String, buffered: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.entryTypes] = _toJSValue(entryTypes)
        object[.type] = _toJSValue(type)
        object[.buffered] = _toJSValue(buffered)
        self.init(unsafelyWrapping: object)
    }
    
   
    public var entryTypes: [String] {
        get { jsObject[.entryTypes].fromJSValue()!}
        set { jsObject[.entryTypes] = newValue.jsValue }
    }
    
    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }
    
    public var buffered: Bool {
        get { jsObject[.buffered].fromJSValue()!}
        set { jsObject[.buffered] = newValue.jsValue }
    }
}


