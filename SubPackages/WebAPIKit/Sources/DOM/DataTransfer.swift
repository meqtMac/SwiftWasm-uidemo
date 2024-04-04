//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import JavaScriptKit
import WebAPIBase

public class DataTransfer: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DataTransfer].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }
    
    public var dropEffect: String {
        get { jsObject[.dropEffect].fromJSValue()!}
        set { jsObject[.dropEffect] = newValue.jsValue }
    }
    
    public var effectAllowed: String {
        get { jsObject[.effectAllowed].fromJSValue()!}
        set { jsObject[.effectAllowed] = newValue.jsValue }
    }
    
    public var items: DataTransferItemList {
        jsObject[.items].fromJSValue()!
    }
    
    @inlinable public func setDragImage(image: Element, x: Int32, y: Int32) {
        let this = jsObject
        _ = this[.setDragImage].function!(this: this, arguments: [_toJSValue(image), _toJSValue(x), _toJSValue(y)])
    }
    
    public var types: [String] {
        jsObject[.types].fromJSValue()!
    }
    
    @inlinable public func getData(format: String) -> String {
        let this = jsObject
        return this[.getData].function!(this: this, arguments: [_toJSValue(format)]).fromJSValue()!
    }
    
    @inlinable public func setData(format: String, data: String) {
        let this = jsObject
        _ = this[.setData].function!(this: this, arguments: [_toJSValue(format), _toJSValue(data)])
    }
    
    @inlinable public func clearData(format: String? = nil) {
        let this = jsObject
        _ = this[.clearData].function!(this: this, arguments: [_toJSValue(format)])
    }
    
    public var files: FileList {
        jsObject[.files].fromJSValue()!
    }
}

public class DataTransferItem: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DataTransferItem].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var kind: String {
        jsObject[.kind].fromJSValue()!
    }
    
    public var type: String {
        jsObject[.type].fromJSValue()!
    }
    
    @inlinable public func getAsString(callback: FunctionStringCallback?) {
        let this = jsObject
        _ = this[.getAsString].function!(this: this, arguments: [_toJSValue(callback)])
    }
    
    @inlinable public func getAsFile() -> File? {
        let this = jsObject
        return this[.getAsFile].function!(this: this, arguments: []).fromJSValue()
    }
}

public class DataTransferItemList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DataTransferItemList].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var length: UInt32 {
        jsObject[.length].fromJSValue()!
    }
    
    @inlinable public subscript(key: Int) -> DataTransferItem {
        jsObject[key].fromJSValue()!
    }
    
    @inlinable public func add(data: String, type: String) -> DataTransferItem? {
        let this = jsObject
        return this[.add].function!(this: this, arguments: [_toJSValue(data), _toJSValue(type)]).fromJSValue()
    }
    
    @inlinable public func add(data: File) -> DataTransferItem? {
        let this = jsObject
        return this[.add].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()
    }
    
    @inlinable public func remove(index: UInt32) {
        let this = jsObject
        _ = this[.remove].function!(this: this, arguments: [_toJSValue(index)])
    }
    
    @inlinable public func clear() {
        let this = jsObject
        _ = this[.clear].function!(this: this, arguments: [])
    }
}

