//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public class HTMLCanvasElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLCanvasElement].function }

    public var width: UInt32 {
        get {
            jsObject[.width].fromJSValue()!
        }
        set {
            jsObject[.width] = newValue.jsValue
        }
    }

    public var height: UInt32 {
        get {
            jsObject[.height].fromJSValue()!
        }
        set {
            jsObject[.height] = newValue.jsValue
        }
    }

    // XXX: member 'getContext' is ignored

    @inlinable public func toDataURL(type: String? = nil, quality: JSValue? = nil) -> String {
        let this = jsObject
        return this[.toDataURL].function!(this: this, arguments: [_toJSValue(type), _toJSValue(quality)]).fromJSValue()!
    }

    @inlinable public func toBlob(callback: @escaping BlobCallback, type: String? = nil, quality: JSValue? = nil) {
        let this = jsObject
        _ = this[.toBlob].function!(this: this, arguments: [_toJSValue(callback), _toJSValue(type), _toJSValue(quality)])
    }

    @inlinable public func transferControlToOffscreen() -> OffscreenCanvas {
        let this = jsObject
        return this[.transferControlToOffscreen].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class OffscreenCanvas: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.OffscreenCanvas].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _oncontextlost = ClosureAttribute1Optional(jsObject: jsObject, name: .oncontextlost)
        _oncontextrestored = ClosureAttribute1Optional(jsObject: jsObject, name: .oncontextrestored)
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init(width: UInt64, height: UInt64) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(width), _toJSValue(height)]))
    }

    public var width: UInt64 {
        get {
            jsObject[.width].fromJSValue()!
        }
        set {
            jsObject[.width] = newValue.jsValue
        }
    }

    public var height: UInt64 {
        get {
            jsObject[.height].fromJSValue()!
        }
        set {
            jsObject[.height] = newValue.jsValue
        }
    }

    // XXX: member 'getContext' is ignored

    @inlinable public func transferToImageBitmap() -> ImageBitmap {
        let this = jsObject
        return this[.transferToImageBitmap].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func convertToBlob(options: ImageEncodeOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.convertToBlob].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func convertToBlob(options: ImageEncodeOptions? = nil) async throws -> Blob {
        let this = jsObject
        let _promise: JSPromise = this[.convertToBlob].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }

    @ClosureAttribute1Optional
    public var oncontextlost: EventHandler

    @ClosureAttribute1Optional
    public var oncontextrestored: EventHandler
}
