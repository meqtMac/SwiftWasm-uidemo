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

public class InputDeviceInfo: MediaDeviceInfo {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.InputDeviceInfo].function }
    @inlinable public func getCapabilities() -> MediaTrackCapabilities {
        let this = jsObject
        return this[.getCapabilities].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class MediaDeviceInfo: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.MediaDeviceInfo].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var deviceId: String {
        jsObject[.deviceId].fromJSValue()!
    }
    
    public var kind: MediaDeviceKind {
        jsObject[.kind].fromJSValue()!
    }
    
    public var label: String {
        jsObject[.label].fromJSValue()!
    }
    
    public var groupId: String {
        jsObject[.groupId].fromJSValue()!
    }
    
    @inlinable public func toJSON() -> JSObject {
        let this = jsObject
        return this[.toJSON].function!(this: this, arguments: []).fromJSValue()!
    }
}

public enum MediaDeviceKind: JSString, JSValueCompatible {
    case audioinput = "audioinput"
    case audiooutput = "audiooutput"
    case videoinput = "videoinput"
    
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

public class MediaDevices: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MediaDevices].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _ondevicechange = ClosureAttribute1Optional(jsObject: jsObject, name: .ondevicechange)
        super.init(unsafelyWrapping: jsObject)
    }
    
    @ClosureAttribute1Optional
    public var ondevicechange: EventHandler
    
    @inlinable public func enumerateDevices() -> JSPromise {
        let this = jsObject
        return this[.enumerateDevices].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func enumerateDevices() async throws -> [MediaDeviceInfo] {
        let this = jsObject
        let _promise: JSPromise = this[.enumerateDevices].function!(this: this, arguments: []).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
    
    @inlinable public func getSupportedConstraints() -> MediaTrackSupportedConstraints {
        let this = jsObject
        return this[.getSupportedConstraints].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func getUserMedia(constraints: MediaStreamConstraints? = nil) -> JSPromise {
        let this = jsObject
        return this[.getUserMedia].function!(this: this, arguments: [_toJSValue(constraints)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func getUserMedia(constraints: MediaStreamConstraints? = nil) async throws -> MediaStream {
        let this = jsObject
        let _promise: JSPromise = this[.getUserMedia].function!(this: this, arguments: [_toJSValue(constraints)]).fromJSValue()!
        return try await _promise.value.fromJSValue()!
    }
}

public class MediaError: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.MediaError].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public static let MEDIA_ERR_ABORTED: UInt16 = 1
    
    public static let MEDIA_ERR_NETWORK: UInt16 = 2
    
    public static let MEDIA_ERR_DECODE: UInt16 = 3
    
    public static let MEDIA_ERR_SRC_NOT_SUPPORTED: UInt16 = 4
    
    public var code: UInt16 {
        jsObject[.code].fromJSValue()!
    }
    
    public var message: String {
        jsObject[.message].fromJSValue()!
    }
}

public class MediaQueryList: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MediaQueryList].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onchange = ClosureAttribute1Optional(jsObject: jsObject, name: .onchange)
        super.init(unsafelyWrapping: jsObject)
    }
    
    public var media: String {
        jsObject[.media].fromJSValue()!
    }
    
    public var matches: Bool {
        jsObject[.matches].fromJSValue()!
    }
    
    @inlinable public func addListener(callback: EventListener?) {
        let this = jsObject
        _ = this[.addListener].function!(this: this, arguments: [_toJSValue(callback)])
    }
    
    @inlinable public func removeListener(callback: EventListener?) {
        let this = jsObject
        _ = this[.removeListener].function!(this: this, arguments: [_toJSValue(callback)])
    }
    
    @ClosureAttribute1Optional
    public var onchange: EventHandler
}

public class MediaQueryListEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MediaQueryListEvent].function }
    
    @inlinable public convenience init(type: String, eventInitDict: MediaQueryListEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public var media: String {
        jsObject[.media].fromJSValue()!
    }
    
    public var matches: Bool {
        jsObject[.matches].fromJSValue()!
    }
}

public class MediaQueryListEventInit: BridgedDictionary {
    public convenience init(media: String, matches: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.media] = _toJSValue(media)
        object[.matches] = _toJSValue(matches)
        self.init(unsafelyWrapping: object)
    }
    
    public var media: String {
        get { jsObject[.media].fromJSValue()!}
        set { jsObject[.media] = newValue.jsValue }
    }
    
    public var matches: Bool {
        get { jsObject[.matches].fromJSValue()!}
        set { jsObject[.matches] = newValue.jsValue }
    }
}

public class MediaRecorder: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MediaRecorder].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onstart = ClosureAttribute1Optional(jsObject: jsObject, name: .onstart)
        _onstop = ClosureAttribute1Optional(jsObject: jsObject, name: .onstop)
        _ondataavailable = ClosureAttribute1Optional(jsObject: jsObject, name: .ondataavailable)
        _onpause = ClosureAttribute1Optional(jsObject: jsObject, name: .onpause)
        _onresume = ClosureAttribute1Optional(jsObject: jsObject, name: .onresume)
        _onerror = ClosureAttribute1Optional(jsObject: jsObject, name: .onerror)
        super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init(stream: MediaStream, options: MediaRecorderOptions? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(stream), _toJSValue(options)]))
    }
    
    public var stream: MediaStream {
        jsObject[.stream].fromJSValue()!
    }
    
    public var mimeType: String {
        jsObject[.mimeType].fromJSValue()!
    }
    
    public var state: RecordingState {
        jsObject[.state].fromJSValue()!
    }
    
    @ClosureAttribute1Optional
    public var onstart: EventHandler
    
    @ClosureAttribute1Optional
    public var onstop: EventHandler
    
    @ClosureAttribute1Optional
    public var ondataavailable: EventHandler
    
    @ClosureAttribute1Optional
    public var onpause: EventHandler
    
    @ClosureAttribute1Optional
    public var onresume: EventHandler
    
    @ClosureAttribute1Optional
    public var onerror: EventHandler
    
    public var videoBitsPerSecond: UInt32 {
        jsObject[.videoBitsPerSecond].fromJSValue()!
    }
    
    public var audioBitsPerSecond: UInt32 {
        jsObject[.audioBitsPerSecond].fromJSValue()!
    }
    
    public var audioBitrateMode: BitrateMode {
        jsObject[.audioBitrateMode].fromJSValue()!
    }
    
    @inlinable public func start(timeslice: UInt32? = nil) {
        let this = jsObject
        _ = this[.start].function!(this: this, arguments: [_toJSValue(timeslice)])
    }
    
    @inlinable public func stop() {
        let this = jsObject
        _ = this[.stop].function!(this: this, arguments: [])
    }
    
    @inlinable public func pause() {
        let this = jsObject
        _ = this[.pause].function!(this: this, arguments: [])
    }
    
    @inlinable public func resume() {
        let this = jsObject
        _ = this[.resume].function!(this: this, arguments: [])
    }
    
    @inlinable public func requestData() {
        let this = jsObject
        _ = this[.requestData].function!(this: this, arguments: [])
    }
    
    @inlinable public class func isTypeSupported(type: String) -> Bool {
        let this = constructor!
        return this[.isTypeSupported].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }
}

public class MediaRecorderOptions: BridgedDictionary {
    public convenience init(mimeType: String, audioBitsPerSecond: UInt32, videoBitsPerSecond: UInt32, bitsPerSecond: UInt32, audioBitrateMode: BitrateMode, videoKeyFrameIntervalDuration: DOMHighResTimeStamp, videoKeyFrameIntervalCount: UInt32) {
        let object = JSObject.global[.Object].function!.new()
        object[.mimeType] = _toJSValue(mimeType)
        object[.audioBitsPerSecond] = _toJSValue(audioBitsPerSecond)
        object[.videoBitsPerSecond] = _toJSValue(videoBitsPerSecond)
        object[.bitsPerSecond] = _toJSValue(bitsPerSecond)
        object[.audioBitrateMode] = _toJSValue(audioBitrateMode)
        object[.videoKeyFrameIntervalDuration] = _toJSValue(videoKeyFrameIntervalDuration)
        object[.videoKeyFrameIntervalCount] = _toJSValue(videoKeyFrameIntervalCount)
        self.init(unsafelyWrapping: object)
    }
    
    public var mimeType: String {
        get { jsObject[.mimeType].fromJSValue()!}
        set { jsObject[.mimeType] = newValue.jsValue }
    }
    
    public var audioBitsPerSecond: UInt32 {
        get { jsObject[.audioBitsPerSecond].fromJSValue()!}
        set { jsObject[.audioBitsPerSecond] = newValue.jsValue }
    }
    
    public var videoBitsPerSecond: UInt32 {
        get { jsObject[.videoBitsPerSecond].fromJSValue()!}
        set { jsObject[.videoBitsPerSecond] = newValue.jsValue }
    }
    
    public var bitsPerSecond: UInt32 {
        get { jsObject[.bitsPerSecond].fromJSValue()!}
        set { jsObject[.bitsPerSecond] = newValue.jsValue }
    }
    
    public var audioBitrateMode: BitrateMode {
        get { jsObject[.audioBitrateMode].fromJSValue()!}
        set { jsObject[.audioBitrateMode] = newValue.jsValue }
    }
    
    public var videoKeyFrameIntervalDuration: DOMHighResTimeStamp {
        get { jsObject[.videoKeyFrameIntervalDuration].fromJSValue()!}
        set { jsObject[.videoKeyFrameIntervalDuration] = newValue.jsValue }
    }
    
    public var videoKeyFrameIntervalCount: UInt32 {
        get { jsObject[.videoKeyFrameIntervalCount].fromJSValue()!}
        set { jsObject[.videoKeyFrameIntervalCount] = newValue.jsValue }
    }
}

public class MediaSource: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MediaSource].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onsourceopen = ClosureAttribute1Optional(jsObject: jsObject, name: .onsourceopen)
        _onsourceended = ClosureAttribute1Optional(jsObject: jsObject, name: .onsourceended)
        _onsourceclose = ClosureAttribute1Optional(jsObject: jsObject, name: .onsourceclose)
        super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }
    
    public var handle: MediaSourceHandle {
        jsObject[.handle].fromJSValue()!
    }
    
    public var sourceBuffers: SourceBufferList {
        jsObject[.sourceBuffers].fromJSValue()!
    }
    
    public var activeSourceBuffers: SourceBufferList {
        jsObject[.activeSourceBuffers].fromJSValue()!
    }
    
    public var readyState: ReadyState {
        jsObject[.readyState].fromJSValue()!
    }
    
    public var duration: Double {
        get { jsObject[.duration].fromJSValue()!}
        set { jsObject[.duration] = newValue.jsValue }
    }
    
    @ClosureAttribute1Optional
    public var onsourceopen: EventHandler
    
    @ClosureAttribute1Optional
    public var onsourceended: EventHandler
    
    @ClosureAttribute1Optional
    public var onsourceclose: EventHandler
    
    public var canConstructInDedicatedWorker: Bool {
        jsObject[.canConstructInDedicatedWorker].fromJSValue()!
    }
    
    @inlinable public func addSourceBuffer(type: String) -> SourceBuffer {
        let this = jsObject
        return this[.addSourceBuffer].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }
    
    @inlinable public func removeSourceBuffer(sourceBuffer: SourceBuffer) {
        let this = jsObject
        _ = this[.removeSourceBuffer].function!(this: this, arguments: [_toJSValue(sourceBuffer)])
    }
    
    @inlinable public func endOfStream(error: EndOfStreamError? = nil) {
        let this = jsObject
        _ = this[.endOfStream].function!(this: this, arguments: [_toJSValue(error)])
    }
    
    @inlinable public func setLiveSeekableRange(start: Double, end: Double) {
        let this = jsObject
        _ = this[.setLiveSeekableRange].function!(this: this, arguments: [_toJSValue(start), _toJSValue(end)])
    }
    
    @inlinable public func clearLiveSeekableRange() {
        let this = jsObject
        _ = this[.clearLiveSeekableRange].function!(this: this, arguments: [])
    }
    
    @inlinable public class func isTypeSupported(type: String) -> Bool {
        let this = constructor!
        return this[.isTypeSupported].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }
}

public class MediaSourceHandle: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.MediaSourceHandle].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
}

