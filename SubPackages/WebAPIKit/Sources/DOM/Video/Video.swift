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


public enum VideoColorPrimaries: JSString, JSValueCompatible {
    case bt709 = "bt709"
    case bt470bg = "bt470bg"
    case smpte170m = "smpte170m"
    case bt2020 = "bt2020"
    case smpte432 = "smpte432"
    
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

public class VideoColorSpace: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.VideoColorSpace].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
       self.jsObject = jsObject
    }
    
    @inlinable public convenience init(init: VideoColorSpaceInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }
    
    public var primaries: VideoColorPrimaries? {
        jsObject[.primaries].fromJSValue()
    }
    
    public var transfer: VideoTransferCharacteristics? {
        jsObject[.transfer].fromJSValue()
    }
    
    public var matrix: VideoMatrixCoefficients? {
        jsObject[.matrix].fromJSValue()
    }
    
    public var fullRange: Bool? {
        jsObject[.fullRange].fromJSValue()
    }
    
    @inlinable public func toJSON() -> VideoColorSpaceInit {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class VideoColorSpaceInit: BridgedDictionary {
    public convenience init(primaries: VideoColorPrimaries?, transfer: VideoTransferCharacteristics?, matrix: VideoMatrixCoefficients?, fullRange: Bool?) {
        let object = JSObject.global[.Object].function!.new()
        object[.primaries] = _toJSValue(primaries)
        object[.transfer] = _toJSValue(transfer)
        object[.matrix] = _toJSValue(matrix)
        object[.fullRange] = _toJSValue(fullRange)
        self.init(unsafelyWrapping: object)
    }
    
    public var primaries: VideoColorPrimaries? {
        get { jsObject[.primaries].fromJSValue()}
        set { jsObject[.primaries] = newValue.jsValue }
    }
    
    public var transfer: VideoTransferCharacteristics? {
        get { jsObject[.transfer].fromJSValue()}
        set { jsObject[.transfer] = newValue.jsValue }
    }
    
    public var matrix: VideoMatrixCoefficients? {
        get { jsObject[.matrix].fromJSValue()}
        set { jsObject[.matrix] = newValue.jsValue }
    }
    
    public var fullRange: Bool? {
        get { jsObject[.fullRange].fromJSValue()}
        set { jsObject[.fullRange] = newValue.jsValue }
    }
}

public class VideoDecoder: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.VideoDecoder].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _ondequeue = ClosureAttribute1Optional(jsObject: jsObject, name: .ondequeue)
        super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init(init: VideoDecoderInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }
    
    public var state: CodecState {
        jsObject[.state].fromJSValue()!
    }
    
    public var decodeQueueSize: UInt32 {
        jsObject[.decodeQueueSize].fromJSValue()!
    }
    
    @ClosureAttribute1Optional
    public var ondequeue: EventHandler
    
    @inlinable public func configure(config: VideoDecoderConfig) {
        let this = jsObject
        _ = this[.configure].function!(this: this, arguments: [_toJSValue(config)])
    }
    
    @inlinable public func decode(chunk: EncodedVideoChunk) {
        let this = jsObject
        _ = this[.decode].function!(this: this, arguments: [_toJSValue(chunk)])
    }
    
    @inlinable public func flush() -> JSPromise {
        let this = jsObject
        return this[.flush].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func flush() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.flush].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }
    
    @inlinable public func reset() {
        let this = jsObject
        _ = this[.reset].function!(this: this, arguments: [])
    }
    
    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
    
    @inlinable public class func isConfigSupported(config: VideoDecoderConfig) -> JSPromise {
        let this = constructor!
        return this[.isConfigSupported].function!(this: this, arguments: [_toJSValue(config)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public class func isConfigSupported(config: VideoDecoderConfig) async throws -> VideoDecoderSupport {
        let this = constructor!
        let _promise: JSPromise = this[.isConfigSupported].function!(this: this, arguments: [_toJSValue(config)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

public class VideoDecoderConfig: BridgedDictionary {
    public convenience init(codec: String,
                            description: AllowSharedBufferSource,
                            codedWidth: UInt32,
                            codedHeight: UInt32,
                            displayAspectWidth: UInt32,
                            displayAspectHeight: UInt32,
                            colorSpace: VideoColorSpaceInit,
                            hardwareAcceleration: HardwareAcceleration,
                            optimizeForLatency: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.codec] = _toJSValue(codec)
        object[.description] = _toJSValue(description)
        object[.codedWidth] = _toJSValue(codedWidth)
        object[.codedHeight] = _toJSValue(codedHeight)
        object[.displayAspectWidth] = _toJSValue(displayAspectWidth)
        object[.displayAspectHeight] = _toJSValue(displayAspectHeight)
        object[.colorSpace] = _toJSValue(colorSpace)
        object[.hardwareAcceleration] = _toJSValue(hardwareAcceleration)
        object[.optimizeForLatency] = _toJSValue(optimizeForLatency)
        self.init(unsafelyWrapping: object)
    }
    
   public var codec: String {
        get { jsObject[.codec].fromJSValue()!}
        set { jsObject[.codec] = newValue.jsValue }
    }
    
    public var description: AllowSharedBufferSource {
        get { jsObject[.description].fromJSValue()!}
        set { jsObject[.description] = newValue.jsValue }
    }
    
    public var codedWidth: UInt32 {
        get { jsObject[.codedWidth].fromJSValue()!}
        set { jsObject[.codedWidth] = newValue.jsValue }
    }
    
    public var codedHeight: UInt32 {
        get { jsObject[.codedHeight].fromJSValue()!}
        set { jsObject[.codedHeight] = newValue.jsValue }
    }
    
    public var displayAspectWidth: UInt32 {
        get { jsObject[.displayAspectWidth].fromJSValue()!}
        set { jsObject[.displayAspectWidth] = newValue.jsValue }
    }
    
    public var displayAspectHeight: UInt32 {
        get { jsObject[.displayAspectHeight].fromJSValue()!}
        set { jsObject[.displayAspectHeight] = newValue.jsValue }
    }
    
    public var colorSpace: VideoColorSpaceInit {
        get { jsObject[.colorSpace].fromJSValue()!}
        set { jsObject[.colorSpace] = newValue.jsValue }
    }
    
    public var hardwareAcceleration: HardwareAcceleration {
        get { jsObject[.hardwareAcceleration].fromJSValue()!}
        set { jsObject[.hardwareAcceleration] = newValue.jsValue }
    }
    
    public var optimizeForLatency: Bool {
        get { jsObject[.optimizeForLatency].fromJSValue()!}
        set { jsObject[.optimizeForLatency] = newValue.jsValue }
    }
}

public enum HardwareAcceleration: JSString, JSValueCompatible {
    case noPreference = "no-preference"
    case preferHardware = "prefer-hardware"
    case preferSoftware = "prefer-software"
    
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

public class VideoDecoderInit: BridgedDictionary {
    public convenience init(output: @escaping VideoFrameOutputCallback, error: @escaping WebCodecsErrorCallback) {
        let object = JSObject.global[.Object].function!.new()
        ClosureAttribute1Void[.output, in: object] = output
        ClosureAttribute1Void[.error, in: object] = error
        self.init(unsafelyWrapping: object)
    }
    
    public required init(unsafelyWrapping object: JSObject) {
        _output = ClosureAttribute1Void(jsObject: object, name: .output)
        _error = ClosureAttribute1Void(jsObject: object, name: .error)
        super.init(unsafelyWrapping: object)
    }
    
    @ClosureAttribute1Void
    public var output: VideoFrameOutputCallback
    
    @ClosureAttribute1Void
    public var error: WebCodecsErrorCallback
}

public class VideoDecoderSupport: BridgedDictionary {
    public convenience init(supported: Bool, config: VideoDecoderConfig) {
        let object = JSObject.global[.Object].function!.new()
        object[.supported] = _toJSValue(supported)
        object[.config] = _toJSValue(config)
        self.init(unsafelyWrapping: object)
    }
    
    public var supported: Bool {
        get { jsObject[.supported].fromJSValue()!}
        set { jsObject[.supported] = newValue.jsValue }
    }
    
    public var config: VideoDecoderConfig {
        get { jsObject[.config].fromJSValue()!}
        set { jsObject[.config] = newValue.jsValue }
    }
}

public class VideoEncoder: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.VideoEncoder].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _ondequeue = ClosureAttribute1Optional(jsObject: jsObject, name: .ondequeue)
        super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init(init: VideoEncoderInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }
    
    public var state: CodecState {
        jsObject[.state].fromJSValue()!
    }
    
    public var encodeQueueSize: UInt32 {
        jsObject[.encodeQueueSize].fromJSValue()!
    }
    
    @ClosureAttribute1Optional
    public var ondequeue: EventHandler
    
    @inlinable public func configure(config: VideoEncoderConfig) {
        let this = jsObject
        _ = this[.configure].function!(this: this, arguments: [_toJSValue(config)])
    }
    
    @inlinable public func encode(frame: VideoFrame, options: VideoEncoderEncodeOptions? = nil) {
        let this = jsObject
        _ = this[.encode].function!(this: this, arguments: [_toJSValue(frame), _toJSValue(options)])
    }
    
    @inlinable public func flush() -> JSPromise {
        let this = jsObject
        return this[.flush].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func flush() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.flush].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }
    
    @inlinable public func reset() {
        let this = jsObject
        _ = this[.reset].function!(this: this, arguments: [])
    }
    
    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
    
    @inlinable public class func isConfigSupported(config: VideoEncoderConfig) -> JSPromise {
        let this = constructor!
        return this[.isConfigSupported].function!(this: this, arguments: [_toJSValue(config)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public class func isConfigSupported(config: VideoEncoderConfig) async throws -> VideoEncoderSupport {
        let this = constructor!
        let _promise: JSPromise = this[.isConfigSupported].function!(this: this, arguments: [_toJSValue(config)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

public enum VideoEncoderBitrateMode: JSString, JSValueCompatible {
    case constant = "constant"
    case variable = "variable"
    case quantizer = "quantizer"
    
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

public class VideoEncoderConfig: BridgedDictionary {
    public convenience init(codec: String, width: UInt32, height: UInt32, displayWidth: UInt32, displayHeight: UInt32, bitrate: UInt64, framerate: Double, hardwareAcceleration: HardwareAcceleration, alpha: AlphaOption, scalabilityMode: String, bitrateMode: VideoEncoderBitrateMode, latencyMode: LatencyMode) {
        let object = JSObject.global[.Object].function!.new()
        object[.codec] = _toJSValue(codec)
        object[.width] = _toJSValue(width)
        object[.height] = _toJSValue(height)
        object[.displayWidth] = _toJSValue(displayWidth)
        object[.displayHeight] = _toJSValue(displayHeight)
        object[.bitrate] = _toJSValue(bitrate)
        object[.framerate] = _toJSValue(framerate)
        object[.hardwareAcceleration] = _toJSValue(hardwareAcceleration)
        object[.alpha] = _toJSValue(alpha)
        object[.scalabilityMode] = _toJSValue(scalabilityMode)
        object[.bitrateMode] = _toJSValue(bitrateMode)
        object[.latencyMode] = _toJSValue(latencyMode)
        self.init(unsafelyWrapping: object)
    }
    
    public var codec: String {
        get { jsObject[.codec].fromJSValue()!}
        set { jsObject[.codec] = newValue.jsValue }
    }
    
    public var width: UInt32 {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }
    
    public var height: UInt32 {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }
    
    public var displayWidth: UInt32 {
        get { jsObject[.displayWidth].fromJSValue()!}
        set { jsObject[.displayWidth] = newValue.jsValue }
    }
    
    public var displayHeight: UInt32 {
        get { jsObject[.displayHeight].fromJSValue()!}
        set { jsObject[.displayHeight] = newValue.jsValue }
    }
    
    public var bitrate: UInt64 {
        get { jsObject[.bitrate].fromJSValue()!}
        set { jsObject[.bitrate] = newValue.jsValue }
    }
    
    public var framerate: Double {
        get { jsObject[.framerate].fromJSValue()!}
        set { jsObject[.framerate] = newValue.jsValue }
    }
    
    public var hardwareAcceleration: HardwareAcceleration {
        get { jsObject[.hardwareAcceleration].fromJSValue()!}
        set { jsObject[.hardwareAcceleration] = newValue.jsValue }
    }
    
    public var alpha: AlphaOption {
        get { jsObject[.alpha].fromJSValue()!}
        set { jsObject[.alpha] = newValue.jsValue }
    }
    
    public var scalabilityMode: String {
        get { jsObject[.scalabilityMode].fromJSValue()!}
        set { jsObject[.scalabilityMode] = newValue.jsValue }
    }
    
    public var bitrateMode: VideoEncoderBitrateMode {
        get { jsObject[.bitrateMode].fromJSValue()!}
        set { jsObject[.bitrateMode] = newValue.jsValue }
    }
    
    public var latencyMode: LatencyMode {
        get { jsObject[.latencyMode].fromJSValue()!}
        set { jsObject[.latencyMode] = newValue.jsValue }
    }
}

public class VideoEncoderEncodeOptions: BridgedDictionary {
    public convenience init(keyFrame: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.keyFrame] = _toJSValue(keyFrame)
        self.init(unsafelyWrapping: object)
    }
    
   public var keyFrame: Bool {
        get { jsObject[.keyFrame].fromJSValue()!}
        set { jsObject[.keyFrame] = newValue.jsValue }
    }
}

public typealias EncodedVideoChunkOutputCallback = (EncodedVideoChunk, EncodedVideoChunkMetadata) -> Void

public class VideoEncoderInit: BridgedDictionary {
    public convenience init(output: @escaping EncodedVideoChunkOutputCallback, error: @escaping WebCodecsErrorCallback) {
        let object = JSObject.global[.Object].function!.new()
        ClosureAttribute2Void[.output, in: object] = output
        ClosureAttribute1Void[.error, in: object] = error
        self.init(unsafelyWrapping: object)
    }
    
    public required init(unsafelyWrapping object: JSObject) {
        _output = ClosureAttribute2Void(jsObject: object, name: .output)
        _error = ClosureAttribute1Void(jsObject: object, name: .error)
        super.init(unsafelyWrapping: object)
    }
    
    @ClosureAttribute2Void
    public var output: EncodedVideoChunkOutputCallback
    
    @ClosureAttribute1Void
    public var error: WebCodecsErrorCallback
}

public class VideoEncoderSupport: BridgedDictionary {
    public convenience init(supported: Bool, config: VideoEncoderConfig) {
        let object = JSObject.global[.Object].function!.new()
        object[.supported] = _toJSValue(supported)
        object[.config] = _toJSValue(config)
        self.init(unsafelyWrapping: object)
    }
    
   public var supported: Bool {
        get { jsObject[.supported].fromJSValue()!}
        set { jsObject[.supported] = newValue.jsValue }
    }
    
    public var config: VideoEncoderConfig {
        get { jsObject[.config].fromJSValue()!}
        set { jsObject[.config] = newValue.jsValue }
    }
}

public enum VideoFacingModeEnum: JSString, JSValueCompatible {
    case user = "user"
    case environment = "environment"
    case left = "left"
    case right = "right"
    
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

public class VideoFrame: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.VideoFrame].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
       self.jsObject = jsObject
    }
    
    @inlinable public convenience init(image: HTMLCanvasElement, init: VideoFrameInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(image), _toJSValue(`init`)]))
    }
    @inlinable public convenience init(image: HTMLOrSVGImageElement, init: VideoFrameInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(image), _toJSValue(`init`)]))
    }
    @inlinable public convenience init(image: HTMLVideoElement, init: VideoFrameInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(image), _toJSValue(`init`)]))
    }
    @inlinable public convenience init(image: ImageBitmap, init: VideoFrameInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(image), _toJSValue(`init`)]))
    }
    @inlinable public convenience init(image: OffscreenCanvas, init: VideoFrameInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(image), _toJSValue(`init`)]))
    }
    @inlinable public convenience init(image: VideoFrame, init: VideoFrameInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(image), _toJSValue(`init`)]))
    }
    
    @inlinable public convenience init(data: AllowSharedBufferSource, init: VideoFrameBufferInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(data), _toJSValue(`init`)]))
    }
    
    public var format: VideoPixelFormat? {
        jsObject[.format].fromJSValue()
    }
    
    public var codedWidth: UInt32 {
        jsObject[.codedWidth].fromJSValue()!
    }
    
    public var codedHeight: UInt32 {
        jsObject[.codedHeight].fromJSValue()!
    }
    
    public var codedRect: DOMRectReadOnly? {
        jsObject[.codedRect].fromJSValue()
    }
    
    public var visibleRect: DOMRectReadOnly? {
        jsObject[.visibleRect].fromJSValue()
    }
    
    public var displayWidth: UInt32 {
        jsObject[.displayWidth].fromJSValue()!
    }
    
    public var displayHeight: UInt32 {
        jsObject[.displayHeight].fromJSValue()!
    }
    
    public var duration: UInt64? {
        jsObject[.duration].fromJSValue()
    }
    
    public var timestamp: Int64 {
        jsObject[.timestamp].fromJSValue()!
    }
    
    public var colorSpace: VideoColorSpace {
        jsObject[.colorSpace].fromJSValue()!
    }
    
    @inlinable public func metadata() -> VideoFrameMetadata {
        let this = jsObject
        return this[.metadata].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func allocationSize(options: VideoFrameCopyToOptions? = nil) -> UInt32 {
        let this = jsObject
        return this[.allocationSize].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }
    
    @inlinable public func copyTo(destination: AllowSharedBufferSource, options: VideoFrameCopyToOptions? = nil) -> JSPromise {
        let this = jsObject
        return this[.copyTo].function!(this: this, arguments: [_toJSValue(destination), _toJSValue(options)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func copyTo(destination: AllowSharedBufferSource, options: VideoFrameCopyToOptions? = nil) async throws -> [PlaneLayout] {
        let this = jsObject
        let _promise: JSPromise = this[.copyTo].function!(this: this, arguments: [_toJSValue(destination), _toJSValue(options)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @inlinable public func clone() -> Self {
        let this = jsObject
        return this[.clone].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
}

public class VideoFrameBufferInit: BridgedDictionary {
    public convenience init(format: VideoPixelFormat, codedWidth: UInt32, codedHeight: UInt32, timestamp: Int64, duration: UInt64, layout: [PlaneLayout], visibleRect: DOMRectInit, displayWidth: UInt32, displayHeight: UInt32, colorSpace: VideoColorSpaceInit, transfer: [ArrayBuffer]) {
        let object = JSObject.global[.Object].function!.new()
        object[.format] = _toJSValue(format)
        object[.codedWidth] = _toJSValue(codedWidth)
        object[.codedHeight] = _toJSValue(codedHeight)
        object[.timestamp] = _toJSValue(timestamp)
        object[.duration] = _toJSValue(duration)
        object[.layout] = _toJSValue(layout)
        object[.visibleRect] = _toJSValue(visibleRect)
        object[.displayWidth] = _toJSValue(displayWidth)
        object[.displayHeight] = _toJSValue(displayHeight)
        object[.colorSpace] = _toJSValue(colorSpace)
        object[.transfer] = _toJSValue(transfer)
        self.init(unsafelyWrapping: object)
    }
    
    public var format: VideoPixelFormat {
        get { jsObject[.format].fromJSValue()!}
        set { jsObject[.format] = newValue.jsValue }
    }
    
    public var codedWidth: UInt32 {
        get { jsObject[.codedWidth].fromJSValue()!}
        set { jsObject[.codedWidth] = newValue.jsValue }
    }
    
    public var codedHeight: UInt32 {
        get { jsObject[.codedHeight].fromJSValue()!}
        set { jsObject[.codedHeight] = newValue.jsValue }
    }
    
    public var timestamp: Int64 {
        get { jsObject[.timestamp].fromJSValue()!}
        set { jsObject[.timestamp] = newValue.jsValue }
    }
    
    public var duration: UInt64 {
        get { jsObject[.duration].fromJSValue()!}
        set { jsObject[.duration] = newValue.jsValue }
    }
    
    public var layout: [PlaneLayout] {
        get { jsObject[.layout].fromJSValue()!}
        set { jsObject[.layout] = newValue.jsValue }
    }
    
    public var visibleRect: DOMRectInit {
        get { jsObject[.visibleRect].fromJSValue()!}
        set { jsObject[.visibleRect] = newValue.jsValue }
    }
    
    public var displayWidth: UInt32 {
        get { jsObject[.displayWidth].fromJSValue()!}
        set { jsObject[.displayWidth] = newValue.jsValue }
    }
    
    public var displayHeight: UInt32 {
        get { jsObject[.displayHeight].fromJSValue()!}
        set { jsObject[.displayHeight] = newValue.jsValue }
    }
    
    public var colorSpace: VideoColorSpaceInit {
        get { jsObject[.colorSpace].fromJSValue()!}
        set { jsObject[.colorSpace] = newValue.jsValue }
    }
    
    public var transfer: [ArrayBuffer] {
        get { jsObject[.transfer].fromJSValue()!}
        set { jsObject[.transfer] = newValue.jsValue }
    }
}

public class VideoFrameCopyToOptions: BridgedDictionary {
    public convenience init(rect: DOMRectInit, layout: [PlaneLayout]) {
        let object = JSObject.global[.Object].function!.new()
        object[.rect] = _toJSValue(rect)
        object[.layout] = _toJSValue(layout)
        self.init(unsafelyWrapping: object)
    }
    
    public var rect: DOMRectInit {
        get { jsObject[.rect].fromJSValue()!}
        set { jsObject[.rect] = newValue.jsValue }
    }
    
    public var layout: [PlaneLayout] {
        get { jsObject[.layout].fromJSValue()!}
        set { jsObject[.layout] = newValue.jsValue }
    }
}

public class VideoFrameInit: BridgedDictionary {
    public convenience init(duration: UInt64, timestamp: Int64, alpha: AlphaOption, visibleRect: DOMRectInit, displayWidth: UInt32, displayHeight: UInt32, metadata: VideoFrameMetadata) {
        let object = JSObject.global[.Object].function!.new()
        object[.duration] = _toJSValue(duration)
        object[.timestamp] = _toJSValue(timestamp)
        object[.alpha] = _toJSValue(alpha)
        object[.visibleRect] = _toJSValue(visibleRect)
        object[.displayWidth] = _toJSValue(displayWidth)
        object[.displayHeight] = _toJSValue(displayHeight)
        object[.metadata] = _toJSValue(metadata)
        self.init(unsafelyWrapping: object)
    }
    
    public var duration: UInt64 {
        get { jsObject[.duration].fromJSValue()!}
        set { jsObject[.duration] = newValue.jsValue }
    }
    
    public var timestamp: Int64 {
        get { jsObject[.timestamp].fromJSValue()!}
        set { jsObject[.timestamp] = newValue.jsValue }
    }
    
    public var alpha: AlphaOption {
        get { jsObject[.alpha].fromJSValue()!}
        set { jsObject[.alpha] = newValue.jsValue }
    }
    
    public var visibleRect: DOMRectInit {
        get { jsObject[.visibleRect].fromJSValue()!}
        set { jsObject[.visibleRect] = newValue.jsValue }
    }
    
    public var displayWidth: UInt32 {
        get { jsObject[.displayWidth].fromJSValue()!}
        set { jsObject[.displayWidth] = newValue.jsValue }
    }
    
    public var displayHeight: UInt32 {
        get { jsObject[.displayHeight].fromJSValue()!}
        set { jsObject[.displayHeight] = newValue.jsValue }
    }
    
    public var metadata: VideoFrameMetadata {
        get { jsObject[.metadata].fromJSValue()!}
        set { jsObject[.metadata] = newValue.jsValue }
    }
}

public class VideoFrameMetadata: BridgedDictionary {
    public convenience init() {
        let object = JSObject.global[.Object].function!.new()
        
        self.init(unsafelyWrapping: object)
    }
    
    public required init(unsafelyWrapping object: JSObject) {
        super.init(unsafelyWrapping: object)
    }
}

public enum VideoMatrixCoefficients: JSString, JSValueCompatible {
    case rgb = "rgb"
    case bt709 = "bt709"
    case bt470bg = "bt470bg"
    case smpte170m = "smpte170m"
    case bt2020Ncl = "bt2020-ncl"
    
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

public enum VideoPixelFormat: JSString, JSValueCompatible {
    case i420 = "I420"
    case i420A = "I420A"
    case i422 = "I422"
    case i444 = "I444"
    case nV12 = "NV12"
    case rGBA = "RGBA"
    case rGBX = "RGBX"
    case bGRA = "BGRA"
    case bGRX = "BGRX"
    
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

public enum VideoResizeModeEnum: JSString, JSValueCompatible {
    case none = "none"
    case cropAndScale = "crop-and-scale"
    
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

public class VideoTrack: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.VideoTrack].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
       self.jsObject = jsObject
    }
    
    public var id: String {
        jsObject[.id].fromJSValue()!
    }
    
    public var kind: String {
        jsObject[.kind].fromJSValue()!
    }
    
    public var label: String {
        jsObject[.label].fromJSValue()!
    }
    
    public var language: String {
        jsObject[.language].fromJSValue()!
    }
    
    public var selected: Bool {
        get { jsObject[.selected].fromJSValue()!}
        set { jsObject[.selected] = newValue.jsValue }
    }
    
    public var sourceBuffer: SourceBuffer? {
        jsObject[.sourceBuffer].fromJSValue()
    }
}

public class VideoTrackList: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.VideoTrackList].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onchange = ClosureAttribute1Optional(jsObject: jsObject, name: .onchange)
        _onaddtrack = ClosureAttribute1Optional(jsObject: jsObject, name: .onaddtrack)
        _onremovetrack = ClosureAttribute1Optional(jsObject: jsObject, name: .onremovetrack)
        super.init(unsafelyWrapping: jsObject)
    }
    
    public var length: UInt32 {
        jsObject[.length].fromJSValue()!
    }
    
    @inlinable public subscript(key: Int) -> VideoTrack {
        jsObject[key].fromJSValue()!
    }
    
    @inlinable public func getTrackById(id: String) -> VideoTrack? {
        let this = jsObject
        return this[.getTrackById].function!(this: this, arguments: [_toJSValue(id)]).fromJSValue()
    }
    
    public var selectedIndex: Int32 {
        jsObject[.selectedIndex].fromJSValue()!
    }
    
    @ClosureAttribute1Optional
    public var onchange: EventHandler
    
    @ClosureAttribute1Optional
    public var onaddtrack: EventHandler
    
    @ClosureAttribute1Optional
    public var onremovetrack: EventHandler
}

public enum VideoTransferCharacteristics: JSString, JSValueCompatible {
    case bt709 = "bt709"
    case smpte170m = "smpte170m"
    case iec6196621 = "iec61966-2-1"
    case linear = "linear"
    case pq = "pq"
    case hlg = "hlg"
    
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

public class EncodedVideoChunk: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.EncodedVideoChunk].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(init: EncodedVideoChunkInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(`init`)]))
    }
    
    public var type: EncodedVideoChunkType {
        jsObject[.type].fromJSValue()!
    }
    
    public var timestamp: Int64 {
        jsObject[.timestamp].fromJSValue()!
    }
    
    public var duration: UInt64? {
        jsObject[.duration].fromJSValue()
    }
    
    public var byteLength: UInt32 {
        jsObject[.byteLength].fromJSValue()!
    }
    
    @inlinable public func copyTo(destination: AllowSharedBufferSource) {
        let this = jsObject
        _ = this[.copyTo].function!(this: this, arguments: [_toJSValue(destination)])
    }
}

public class EncodedVideoChunkInit: BridgedDictionary {
    public convenience init(type: EncodedVideoChunkType, timestamp: Int64, duration: UInt64, data: AllowSharedBufferSource) {
        let object = JSObject.global[.Object].function!.new()
        object[.type] = _toJSValue(type)
        object[.timestamp] = _toJSValue(timestamp)
        object[.duration] = _toJSValue(duration)
        object[.data] = _toJSValue(data)
        self.init(unsafelyWrapping: object)
    }
    
    public var type: EncodedVideoChunkType {
        get { jsObject[.type].fromJSValue()!}
        set { jsObject[.type] = newValue.jsValue }
    }
    
    public var timestamp: Int64 {
        get { jsObject[.timestamp].fromJSValue()!}
        set { jsObject[.timestamp] = newValue.jsValue }
    }
    
    public var duration: UInt64 {
        get { jsObject[.duration].fromJSValue()!}
        set { jsObject[.duration] = newValue.jsValue }
    }
    
    public var data: AllowSharedBufferSource {
        get { jsObject[.data].fromJSValue()!}
        set { jsObject[.data] = newValue.jsValue }
    }
}

public class EncodedVideoChunkMetadata: BridgedDictionary {
    public convenience init(decoderConfig: VideoDecoderConfig, svc: SvcOutputMetadata, alphaSideData: BufferSource) {
        let object = JSObject.global[.Object].function!.new()
        object[.decoderConfig] = _toJSValue(decoderConfig)
        object[.svc] = _toJSValue(svc)
        object[.alphaSideData] = _toJSValue(alphaSideData)
        self.init(unsafelyWrapping: object)
    }
    
    public var decoderConfig: VideoDecoderConfig {
        get { jsObject[.decoderConfig].fromJSValue()!}
        set { jsObject[.decoderConfig] = newValue.jsValue }
    }
    
    public var svc: SvcOutputMetadata {
        get { jsObject[.svc].fromJSValue()!}
        set { jsObject[.svc] = newValue.jsValue }
    }
    
    public var alphaSideData: BufferSource {
        get { jsObject[.alphaSideData].fromJSValue()!}
        set { jsObject[.alphaSideData] = newValue.jsValue }
    }
}

public enum EncodedVideoChunkType: JSString, JSValueCompatible {
    case key = "key"
    case delta = "delta"
    
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
