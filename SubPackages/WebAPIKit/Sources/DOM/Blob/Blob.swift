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

public class Blob: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.Blob].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public convenience init(blobParts: [BlobPart]? = nil, options: BlobPropertyBag? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(blobParts), _toJSValue(options)]))
    }

public var size: UInt64 {
jsObject[.size].fromJSValue()!
    }

public var type: String {
jsObject[.type].fromJSValue()!
    }

    @inlinable public func slice(start: Int64? = nil, end: Int64? = nil, contentType: String? = nil) -> Self {
        let this = jsObject
        return this[.slice].function!(this: this, arguments: [_toJSValue(start), _toJSValue(end), _toJSValue(contentType)]).fromJSValue()!
    }

    @inlinable public func stream() -> ReadableStream {
        let this = jsObject
        return this[.stream].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func text() async throws -> String {
        let this = jsObject
        let _promise: JSPromise = this[.text].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

   @inlinable public func arrayBuffer() async throws -> ArrayBuffer {
        let this = jsObject
        let _promise: JSPromise = this[.arrayBuffer].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}





public class BlobPropertyBag: BridgedDictionary {
    public convenience init(type: String, endings: EndingType) {
        let object = JSObject.global[.Object].function!.new()
        object[.type] = _toJSValue(type)
        object[.endings] = _toJSValue(endings)
        self.init(unsafelyWrapping: object)
    }

    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }

    public var endings: EndingType {
        get { jsObject[.endings].fromJSValue()!}
        set { jsObject[.endings] = newValue.jsValue }
    }
}

public extension Blob {
    enum BlobPart: JSValueCompatible {
        case blob(Blob)
        case bufferSource(BufferSource)
        case string(String)
        
        public static func construct(from value: JSValue) -> Self? {
            if let blob: Blob = value.fromJSValue() {
                return .blob(blob)
            }
            if let bufferSource: BufferSource = value.fromJSValue() {
                return .bufferSource(bufferSource)
            }
            if let string: String = value.fromJSValue() {
                return .string(string)
            }
            return nil
        }
        
        public var jsValue: JSValue {
            switch self {
            case let .blob(blob):
                return blob.jsValue
            case let .bufferSource(bufferSource):
                return bufferSource.jsValue
            case let .string(string):
                return string.jsValue
            }
        }
    }
}
