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


public class MediaStream: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MediaStream].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onaddtrack = ClosureAttribute1Optional(jsObject: jsObject, name: .onaddtrack)
        _onremovetrack = ClosureAttribute1Optional(jsObject: jsObject, name: .onremovetrack)
        super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }
    
    @inlinable public convenience init(stream: MediaStream) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(stream)]))
    }
    
    @inlinable public convenience init(tracks: [MediaStreamTrack]) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(tracks)]))
    }
    
    public var id: String {
        jsObject[.id].fromJSValue()!
    }
    
    @inlinable public func getAudioTracks() -> [MediaStreamTrack] {
        let this = jsObject
        return this[.getAudioTracks].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func getVideoTracks() -> [MediaStreamTrack] {
        let this = jsObject
        return this[.getVideoTracks].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func getTracks() -> [MediaStreamTrack] {
        let this = jsObject
        return this[.getTracks].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func getTrackById(trackId: String) -> MediaStreamTrack? {
        let this = jsObject
        return this[.getTrackById].function!(this: this, arguments: [_toJSValue(trackId)]).fromJSValue()
    }
    
    @inlinable public func addTrack(track: MediaStreamTrack) {
        let this = jsObject
        _ = this[.addTrack].function!(this: this, arguments: [_toJSValue(track)])
    }
    
    @inlinable public func removeTrack(track: MediaStreamTrack) {
        let this = jsObject
        _ = this[.removeTrack].function!(this: this, arguments: [_toJSValue(track)])
    }
    
    @inlinable public func clone() -> Self {
        let this = jsObject
        return this[.clone].function!(this: this, arguments: []).fromJSValue()!
    }
    
    public var active: Bool {
        jsObject[.active].fromJSValue()!
    }
    
    @ClosureAttribute1Optional
    public var onaddtrack: EventHandler
    
    @ClosureAttribute1Optional
    public var onremovetrack: EventHandler
}

public class MediaStreamConstraints: BridgedDictionary {
    public convenience init(video: Bool_or_MediaTrackConstraints, audio: Bool_or_MediaTrackConstraints) {
        let object = JSObject.global[.Object].function!.new()
        object[.video] = _toJSValue(video)
        object[.audio] = _toJSValue(audio)
        self.init(unsafelyWrapping: object)
    }
    
    public var video: Bool_or_MediaTrackConstraints {
        get { jsObject[.video].fromJSValue()!}
        set { jsObject[.video] = newValue.jsValue }
    }
    
    public var audio: Bool_or_MediaTrackConstraints {
        get { jsObject[.audio].fromJSValue()!}
        set { jsObject[.audio] = newValue.jsValue }
    }
}

public class MediaStreamTrack: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MediaStreamTrack].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onmute = ClosureAttribute1Optional(jsObject: jsObject, name: .onmute)
        _onunmute = ClosureAttribute1Optional(jsObject: jsObject, name: .onunmute)
        _onended = ClosureAttribute1Optional(jsObject: jsObject, name: .onended)
        super.init(unsafelyWrapping: jsObject)
    }
    
    public var kind: String {
        jsObject[.kind].fromJSValue()!
    }
    
    public var id: String {
        jsObject[.id].fromJSValue()!
    }
    
    public var label: String {
        jsObject[.label].fromJSValue()!
    }
    
    public var enabled: Bool {
        get { jsObject[.enabled].fromJSValue()!}
        set { jsObject[.enabled] = newValue.jsValue }
    }
    
    public var muted: Bool {
        jsObject[.muted].fromJSValue()!
    }
    
    @ClosureAttribute1Optional
    public var onmute: EventHandler
    
    @ClosureAttribute1Optional
    public var onunmute: EventHandler
    
    public var readyState: MediaStreamTrackState {
        jsObject[.readyState].fromJSValue()!
    }
    
    @ClosureAttribute1Optional
    public var onended: EventHandler
    
    @inlinable public func clone() -> Self {
        let this = jsObject
        return this[.clone].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func stop() {
        let this = jsObject
        _ = this[.stop].function!(this: this, arguments: [])
    }
    
    @inlinable public func getCapabilities() -> MediaTrackCapabilities {
        let this = jsObject
        return this[.getCapabilities].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func getConstraints() -> MediaTrackConstraints {
        let this = jsObject
        return this[.getConstraints].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func getSettings() -> MediaTrackSettings {
        let this = jsObject
        return this[.getSettings].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func applyConstraints(constraints: MediaTrackConstraints? = nil) -> JSPromise {
        let this = jsObject
        return this[.applyConstraints].function!(this: this, arguments: [_toJSValue(constraints)]).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func applyConstraints(constraints: MediaTrackConstraints? = nil) async throws {
        let this = jsObject
        let _promise: JSPromise = this[.applyConstraints].function!(this: this, arguments: [_toJSValue(constraints)]).fromJSValue()!
        _ = try await _promise.value
    }
}

public class MediaStreamTrackEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MediaStreamTrackEvent].function }
    
   
    @inlinable public convenience init(type: String, eventInitDict: MediaStreamTrackEventInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public var track: MediaStreamTrack {
        jsObject[.track].fromJSValue()!
    }
}

public class MediaStreamTrackEventInit: BridgedDictionary {
    public convenience init(track: MediaStreamTrack) {
        let object = JSObject.global[.Object].function!.new()
        object[.track] = _toJSValue(track)
        self.init(unsafelyWrapping: object)
    }
    
   public var track: MediaStreamTrack {
        get { jsObject[.track].fromJSValue()!}
        set { jsObject[.track] = newValue.jsValue }
    }
}

public enum MediaStreamTrackState: JSString, JSValueCompatible {
    case live = "live"
    case ended = "ended"
    
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

public enum Bool_or_MediaTrackConstraints: JSValueCompatible {
    case bool(Bool)
    case mediaTrackConstraints(MediaTrackConstraints)
    
    public static func construct(from value: JSValue) -> Self? {
        if let bool: Bool = value.fromJSValue() {
            return .bool(bool)
        }
        if let mediaTrackConstraints: MediaTrackConstraints = value.fromJSValue() {
            return .mediaTrackConstraints(mediaTrackConstraints)
        }
        return nil
    }
    
    public var jsValue: JSValue {
        switch self {
        case let .bool(bool):
            return bool.jsValue
        case let .mediaTrackConstraints(mediaTrackConstraints):
            return mediaTrackConstraints.jsValue
        }
    }
}
