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


public class File: Blob {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.File].function }

    @inlinable public convenience init(fileBits: [BlobPart], fileName: String, options: FilePropertyBag? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(fileBits), _toJSValue(fileName), _toJSValue(options)]))
    }

public var name: String {
jsObject[.name].fromJSValue()!
    }

public var lastModified: Int64 {
jsObject[.lastModified].fromJSValue()!
    }
}

public class FileList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.FileList].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public subscript(key: Int) -> File? {
        jsObject[key].fromJSValue()
    }

    @inlinable public func item(index: UInt32) -> File? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }

public var length: UInt32 {
jsObject[.length].fromJSValue()!
    }
}

public class FilePropertyBag: BridgedDictionary {
    public convenience init(lastModified: Int64) {
        let object = JSObject.global[.Object].function!.new()
        object[.lastModified] = _toJSValue(lastModified)
        self.init(unsafelyWrapping: object)
    }

    public var lastModified: Int64 {
        get { jsObject[.lastModified].fromJSValue()!}
        set { jsObject[.lastModified] = newValue.jsValue }
    }
}

public class FileReader: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.FileReader].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
       _onloadstart = ClosureAttribute1Optional(jsObject: jsObject, name: .onloadstart)
        _onprogress = ClosureAttribute1Optional(jsObject: jsObject, name: .onprogress)
        _onload = ClosureAttribute1Optional(jsObject: jsObject, name: .onload)
        _onabort = ClosureAttribute1Optional(jsObject: jsObject, name: .onabort)
        _onerror = ClosureAttribute1Optional(jsObject: jsObject, name: .onerror)
        _onloadend = ClosureAttribute1Optional(jsObject: jsObject, name: .onloadend)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @inlinable public func readAsArrayBuffer(blob: Blob) {
        let this = jsObject
        _ = this[.readAsArrayBuffer].function!(this: this, arguments: [_toJSValue(blob)])
    }

    @inlinable public func readAsBinaryString(blob: Blob) {
        let this = jsObject
        _ = this[.readAsBinaryString].function!(this: this, arguments: [_toJSValue(blob)])
    }

    @inlinable public func readAsText(blob: Blob, encoding: String? = nil) {
        let this = jsObject
        _ = this[.readAsText].function!(this: this, arguments: [_toJSValue(blob), _toJSValue(encoding)])
    }

    @inlinable public func readAsDataURL(blob: Blob) {
        let this = jsObject
        _ = this[.readAsDataURL].function!(this: this, arguments: [_toJSValue(blob)])
    }

    @inlinable public func abort() {
        let this = jsObject
        _ = this[.abort].function!(this: this, arguments: [])
    }

    public static let EMPTY: UInt16 = 0

    public static let LOADING: UInt16 = 1

    public static let DONE: UInt16 = 2

public var readyState: UInt16 {
jsObject[.readyState].fromJSValue()!
    }

public var result: ArrayBuffer_or_String? {
jsObject[.result].fromJSValue()
    }

public var error: DOMException? {
jsObject[.error].fromJSValue()
    }

    @ClosureAttribute1Optional
    public var onloadstart: EventHandler

    @ClosureAttribute1Optional
    public var onprogress: EventHandler

    @ClosureAttribute1Optional
    public var onload: EventHandler

    @ClosureAttribute1Optional
    public var onabort: EventHandler

    @ClosureAttribute1Optional
    public var onerror: EventHandler

    @ClosureAttribute1Optional
    public var onloadend: EventHandler
}

