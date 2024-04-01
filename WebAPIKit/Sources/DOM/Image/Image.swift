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

public class ImageBitmap: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ImageBitmap].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var width: UInt32 {
        jsObject[.width].fromJSValue()!
    }
    
    public var height: UInt32 {
        jsObject[.height].fromJSValue()!
    }
    
    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
}

public class ImageBitmapOptions: BridgedDictionary {
    public convenience init(imageOrientation: ImageOrientation, premultiplyAlpha: PremultiplyAlpha, colorSpaceConversion: ColorSpaceConversion, resizeWidth: UInt32, resizeHeight: UInt32, resizeQuality: ResizeQuality) {
        let object = JSObject.global[.Object].function!.new()
        object[.imageOrientation] = _toJSValue(imageOrientation)
        object[.premultiplyAlpha] = _toJSValue(premultiplyAlpha)
        object[.colorSpaceConversion] = _toJSValue(colorSpaceConversion)
        object[.resizeWidth] = _toJSValue(resizeWidth)
        object[.resizeHeight] = _toJSValue(resizeHeight)
        object[.resizeQuality] = _toJSValue(resizeQuality)
        self.init(unsafelyWrapping: object)
    }
    
    public var imageOrientation: ImageOrientation {
        get { jsObject[.imageOrientation].fromJSValue()!}
        set { jsObject[.imageOrientation] = newValue.jsValue }
    }
    
    public var premultiplyAlpha: PremultiplyAlpha {
        get { jsObject[.premultiplyAlpha].fromJSValue()!}
        set { jsObject[.premultiplyAlpha] = newValue.jsValue }
    }
    
    public var colorSpaceConversion: ColorSpaceConversion {
        get { jsObject[.colorSpaceConversion].fromJSValue()!}
        set { jsObject[.colorSpaceConversion] = newValue.jsValue }
    }
    
    public var resizeWidth: UInt32 {
        get { jsObject[.resizeWidth].fromJSValue()!}
        set { jsObject[.resizeWidth] = newValue.jsValue }
    }
    
    public var resizeHeight: UInt32 {
        get { jsObject[.resizeHeight].fromJSValue()!}
        set { jsObject[.resizeHeight] = newValue.jsValue }
    }
    
    public var resizeQuality: ResizeQuality {
        get { jsObject[.resizeQuality].fromJSValue()!}
        set { jsObject[.resizeQuality] = newValue.jsValue }
    }
}

public class ImageBitmapRenderingContext: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ImageBitmapRenderingContext].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var canvas: RenderingCanvas {
        jsObject[.canvas].fromJSValue()!
    }
    
    @inlinable public func transferFromImageBitmap(bitmap: ImageBitmap?) {
        let this = jsObject
        _ = this[.transferFromImageBitmap].function!(this: this, arguments: [_toJSValue(bitmap)])
    }
}

public class ImageBitmapRenderingContextSettings: BridgedDictionary {
    public convenience init(alpha: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.alpha] = _toJSValue(alpha)
        self.init(unsafelyWrapping: object)
    }
    
    public var alpha: Bool {
        get { jsObject[.alpha].fromJSValue()!}
        set { jsObject[.alpha] = newValue.jsValue }
    }
}

public class ImageData: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ImageData].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(sw: UInt32, sh: UInt32, settings: ImageDataSettings? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(sw), _toJSValue(sh), _toJSValue(settings)]))
    }
    
    @inlinable public convenience init(data: Uint8ClampedArray, sw: UInt32, sh: UInt32? = nil, settings: ImageDataSettings? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(data), _toJSValue(sw), _toJSValue(sh), _toJSValue(settings)]))
    }
    
    public var width: UInt32 {
        jsObject[.width].fromJSValue()!
    }
    
    public var height: UInt32 {
        jsObject[.height].fromJSValue()!
    }
    
    public var data: Uint8ClampedArray {
        jsObject[.data].fromJSValue()!
    }
    
    public var colorSpace: PredefinedColorSpace {
        jsObject[.colorSpace].fromJSValue()!
    }
}

public class ImageDataSettings: BridgedDictionary {
    public convenience init(colorSpace: PredefinedColorSpace) {
        let object = JSObject.global[.Object].function!.new()
        object[.colorSpace] = _toJSValue(colorSpace)
        self.init(unsafelyWrapping: object)
    }
    public var colorSpace: PredefinedColorSpace {
        get { jsObject[.colorSpace].fromJSValue()!}
        set { jsObject[.colorSpace] = newValue.jsValue }
    }
}

public class ImageDecodeOptions: BridgedDictionary {
    public convenience init(frameIndex: UInt32, completeFramesOnly: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.frameIndex] = _toJSValue(frameIndex)
        object[.completeFramesOnly] = _toJSValue(completeFramesOnly)
        self.init(unsafelyWrapping: object)
    }
    
    public var frameIndex: UInt32 {
        get { jsObject[.frameIndex].fromJSValue()!}
        set { jsObject[.frameIndex] = newValue.jsValue }
    }
    
    public var completeFramesOnly: Bool {
        get { jsObject[.completeFramesOnly].fromJSValue()!}
        set { jsObject[.completeFramesOnly] = newValue.jsValue }
    }
}

public class ImageDecodeResult: BridgedDictionary {
    public convenience init(image: VideoFrame, complete: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.image] = _toJSValue(image)
        object[.complete] = _toJSValue(complete)
        self.init(unsafelyWrapping: object)
    }
    
    public var image: VideoFrame {
        get { jsObject[.image].fromJSValue()!}
        set { jsObject[.image] = newValue.jsValue }
    }
    
    public var complete: Bool {
        get { jsObject[.complete].fromJSValue()!}
        set { jsObject[.complete] = newValue.jsValue }
    }
}

public class ImageDecoder: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ImageDecoder].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(init: ImageDecoderInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }
    
    public var type: String {
        jsObject[.type].fromJSValue()!
    }
    
    public var complete: Bool {
        jsObject[.complete].fromJSValue()!
    }
    
    public var completed: JSPromise {
        jsObject[.completed].fromJSValue()!
    }
    
    public var tracks: ImageTrackList {
        jsObject[.tracks].fromJSValue()!
    }
    
    @inlinable public func decode(options: ImageDecodeOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.decode].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func decode(options: ImageDecodeOptions? = nil) async throws -> ImageDecodeResult {
        let this = jsObject
        let _promise: JSPromise = this[.decode].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @inlinable public func reset() {
        let this = jsObject
        _ = this[.reset].function!(this: this, arguments: [])
    }
    
    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
    
    @inlinable public class func isTypeSupported(type: String) -> JSPromise {
        let this = constructor!
        return this[.isTypeSupported].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public class func isTypeSupported(type: String) async throws -> Bool {
        let this = constructor!
        let _promise: JSPromise = this[.isTypeSupported].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

public class ImageDecoderInit: BridgedDictionary {
    public convenience init(type: String, data: ImageBufferSource, colorSpaceConversion: ColorSpaceConversion, desiredWidth: UInt32, desiredHeight: UInt32, preferAnimation: Bool, transfer: [ArrayBuffer]) {
        let object = JSObject.global[.Object].function!.new()
        object[.type] = _toJSValue(type)
        object[.data] = _toJSValue(data)
        object[.colorSpaceConversion] = _toJSValue(colorSpaceConversion)
        object[.desiredWidth] = _toJSValue(desiredWidth)
        object[.desiredHeight] = _toJSValue(desiredHeight)
        object[.preferAnimation] = _toJSValue(preferAnimation)
        object[.transfer] = _toJSValue(transfer)
        self.init(unsafelyWrapping: object)
    }
    
    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }
    
    public var data: ImageBufferSource {
        get { jsObject[.data].fromJSValue()!}
        set { jsObject[.data] = newValue.jsValue }
    }
    
    public var colorSpaceConversion: ColorSpaceConversion {
        get { jsObject[.colorSpaceConversion].fromJSValue()!}
        set { jsObject[.colorSpaceConversion] = newValue.jsValue }
    }
    
    public var desiredWidth: UInt32 {
        get { jsObject[.desiredWidth].fromJSValue()!}
        set { jsObject[.desiredWidth] = newValue.jsValue }
    }
    
    public var desiredHeight: UInt32 {
        get { jsObject[.desiredHeight].fromJSValue()!}
        set { jsObject[.desiredHeight] = newValue.jsValue }
    }
    
    public var preferAnimation: Bool {
        get { jsObject[.preferAnimation].fromJSValue()!}
        set { jsObject[.preferAnimation] = newValue.jsValue }
    }
    
    public var transfer: [ArrayBuffer] {
        get { jsObject[.transfer].fromJSValue()!}
        set { jsObject[.transfer] = newValue.jsValue }
    }
}

public enum ImageBufferSource: JSValueCompatible {
    case bufferSource(BufferSource)
    case readableStream(ReadableStream)
    
    public static func construct(from value: JSValue) -> Self? {
        if let bufferSource: BufferSource = value.fromJSValue() {
            return .bufferSource(bufferSource)
        }
        if let readableStream: ReadableStream = value.fromJSValue() {
            return .readableStream(readableStream)
        }
        return nil
    }
    
    public var jsValue: JSValue {
        switch self {
        case let .bufferSource(bufferSource):
            return bufferSource.jsValue
        case let .readableStream(readableStream):
            return readableStream.jsValue
        }
    }
}

public class ImageEncodeOptions: BridgedDictionary {
    public convenience init(type: String, quality: Double) {
        let object = JSObject.global[.Object].function!.new()
        object[.type] = _toJSValue(type)
        object[.quality] = _toJSValue(quality)
        self.init(unsafelyWrapping: object)
    }
    
    public var type: String {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }
    
    public var quality: Double {
        get { jsObject[.quality].fromJSValue()!}
        set { jsObject[.quality] = newValue.jsValue }
    }
}

public enum ImageOrientation: JSString, JSValueCompatible {
    case fromImage = "from-image"
    case flipY = "flipY"
    
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

public enum ImageSmoothingQuality: JSString, JSValueCompatible {
    case low = "low"
    case medium = "medium"
    case high = "high"
    
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

public class ImageTrack: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ImageTrack].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var animated: Bool {
        jsObject[.animated].fromJSValue()!
    }
    
    public var frameCount: UInt32 {
        jsObject[.frameCount].fromJSValue()!
    }
    
    public var repetitionCount: Float {
        jsObject[.repetitionCount].fromJSValue()!
    }
    
    public var selected: Bool {
        get { jsObject[.selected].fromJSValue()!}
        set { jsObject[.selected] = newValue.jsValue }
    }
}

public class ImageTrackList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.ImageTrackList].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public subscript(key: Int) -> ImageTrack {
        jsObject[key].fromJSValue()!
    }
    
    public var ready: JSPromise {
        jsObject[.ready].fromJSValue()!
    }
    
    public var length: UInt32 {
        jsObject[.length].fromJSValue()!
    }
    
    public var selectedIndex: Int32 {
        jsObject[.selectedIndex].fromJSValue()!
    }
    
    public var selectedTrack: ImageTrack? {
        jsObject[.selectedTrack].fromJSValue()
    }
}

