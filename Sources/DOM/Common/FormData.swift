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

public class FormData: JSBridgedClass, Sequence {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.FormData].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public convenience init(form: HTMLFormElement? = nil, submitter: HTMLElement? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(form), _toJSValue(submitter)]))
    }

    @inlinable public func append(name: String, value: String) {
        let this = jsObject
        _ = this[.append].function!(this: this, arguments: [_toJSValue(name), _toJSValue(value)])
    }

    @inlinable public func append(name: String, blobValue: Blob, filename: String? = nil) {
        let this = jsObject
        _ = this[.append].function!(this: this, arguments: [_toJSValue(name), _toJSValue(blobValue), _toJSValue(filename)])
    }

    @inlinable public func delete(name: String) {
        let this = jsObject
        _ = this[.delete].function!(this: this, arguments: [_toJSValue(name)])
    }

    @inlinable public func get(name: String) -> FormDataEntryValue? {
        let this = jsObject
        return this[.get].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()
    }

    @inlinable public func getAll(name: String) -> [FormDataEntryValue] {
        let this = jsObject
        return this[.getAll].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()!
    }

    @inlinable public func has(name: String) -> Bool {
        let this = jsObject
        return this[.has].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()!
    }

    @inlinable public func set(name: String, value: String) {
        let this = jsObject
        _ = this[.set].function!(this: this, arguments: [_toJSValue(name), _toJSValue(value)])
    }

    @inlinable public func set(name: String, blobValue: Blob, filename: String? = nil) {
        let this = jsObject
        _ = this[.set].function!(this: this, arguments: [_toJSValue(name), _toJSValue(blobValue), _toJSValue(filename)])
    }

    public typealias Element = String
    public func makeIterator() -> ValueIterableIterator<FormData> {
        ValueIterableIterator(sequence: self)
    }
}

public enum FormDataEntryValue: JSValueCompatible {
    case file(File)
    case string(String)

    public static func construct(from value: JSValue) -> Self? {
        if let file: File = value.fromJSValue() {
            return .file(file)
        }
        if let string: String = value.fromJSValue() {
            return .string(string)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .file(file):
            return file.jsValue
        case let .string(string):
            return string.jsValue
        }
    }
}
