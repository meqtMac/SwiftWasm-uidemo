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

public class HTMLMediaElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLMediaElement].function }
    
    
    public var error: MediaError? {
        jsObject[.error].fromJSValue()
    }
    
    public var src: String {
        get { jsObject[.src].fromJSValue()!}
        set { jsObject[.src] = newValue.jsValue }
    }
    
    public var srcObject: MediaProvider? {
        get { jsObject[.srcObject].fromJSValue()}
        set { jsObject[.srcObject] = newValue.jsValue }
    }
    
    public var currentSrc: String {
        jsObject[.currentSrc].fromJSValue()!
    }
    
    public var crossOrigin: String? {
        get { jsObject[.crossOrigin].fromJSValue()}
        set { jsObject[.crossOrigin] = newValue.jsValue }
    }
    
    public static let NETWORK_EMPTY: UInt16 = 0
    
    public static let NETWORK_IDLE: UInt16 = 1
    
    public static let NETWORK_LOADING: UInt16 = 2
    
    public static let NETWORK_NO_SOURCE: UInt16 = 3
    
    public var networkState: UInt16 {
        jsObject[.networkState].fromJSValue()!
    }
    
    public var preload: String {
        get { jsObject[.preload].fromJSValue()!}
        set { jsObject[.preload] = newValue.jsValue }
    }
    
    public var buffered: TimeRanges {
        jsObject[.buffered].fromJSValue()!
    }
    
    @inlinable public func load() {
        let this = jsObject
        _ = this[.load].function!(this: this, arguments: [])
    }
    
    @inlinable public func canPlayType(type: String) -> CanPlayTypeResult {
        let this = jsObject
        return this[.canPlayType].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()!
    }
    
    public static let HAVE_NOTHING: UInt16 = 0
    
    public static let HAVE_METADATA: UInt16 = 1
    
    public static let HAVE_CURRENT_DATA: UInt16 = 2
    
    public static let HAVE_FUTURE_DATA: UInt16 = 3
    
    public static let HAVE_ENOUGH_DATA: UInt16 = 4
    
    public var readyState: UInt16 {
        jsObject[.readyState].fromJSValue()!
    }
    
    public var seeking: Bool {
        jsObject[.seeking].fromJSValue()!
    }
    
    public var currentTime: Double {
        get { jsObject[.currentTime].fromJSValue()!}
        set { jsObject[.currentTime] = newValue.jsValue }
    }
    
    @inlinable public func fastSeek(time: Double) {
        let this = jsObject
        _ = this[.fastSeek].function!(this: this, arguments: [_toJSValue(time)])
    }
    
    public var duration: Double {
        jsObject[.duration].fromJSValue()!
    }
    
    @inlinable public func getStartDate() -> JSObject {
        let this = jsObject
        return this[.getStartDate].function!(this: this, arguments: []).fromJSValue()!
    }
    
    public var paused: Bool {
        jsObject[.paused].fromJSValue()!
    }
    
    public var defaultPlaybackRate: Double {
        get { jsObject[.defaultPlaybackRate].fromJSValue()!}
        set { jsObject[.defaultPlaybackRate] = newValue.jsValue }
    }
    
    public var playbackRate: Double {
        get { jsObject[.playbackRate].fromJSValue()!}
        set { jsObject[.playbackRate] = newValue.jsValue }
    }
    
    public var preservesPitch: Bool {
        get { jsObject[.preservesPitch].fromJSValue()!}
        set { jsObject[.preservesPitch] = newValue.jsValue }
    }
    
    public var played: TimeRanges {
        jsObject[.played].fromJSValue()!
    }
    
    public var seekable: TimeRanges {
        jsObject[.seekable].fromJSValue()!
    }
    
    public var ended: Bool {
        jsObject[.ended].fromJSValue()!
    }
    
    public var autoplay: Bool {
        get { jsObject[.autoplay].fromJSValue()!}
        set { jsObject[.autoplay] = newValue.jsValue }
    }
    
    public var loop: Bool {
        get { jsObject[.loop].fromJSValue()!}
        set { jsObject[.loop] = newValue.jsValue }
    }
    
    @inlinable public func play() -> JSPromise {
        let this = jsObject
        return this[.play].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inlinable public func play() async throws {
        let this = jsObject
        let _promise: JSPromise = this[.play].function!(this: this, arguments: []).fromJSValue()!
        _ = try await _promise.value
    }
    
    @inlinable public func pause() {
        let this = jsObject
        _ = this[.pause].function!(this: this, arguments: [])
    }
    
    public var controls: Bool {
        get { jsObject[.controls].fromJSValue()!}
        set { jsObject[.controls] = newValue.jsValue }
    }
    
    public var volume: Double {
        get { jsObject[.volume].fromJSValue()!}
        set { jsObject[.volume] = newValue.jsValue }
    }
    
    public var muted: Bool {
        get { jsObject[.muted].fromJSValue()!}
        set { jsObject[.muted] = newValue.jsValue }
    }
    
    public var defaultMuted: Bool {
        get { jsObject[.defaultMuted].fromJSValue()!}
        set { jsObject[.defaultMuted] = newValue.jsValue }
    }
    
    public var audioTracks: AudioTrackList {
        jsObject[.audioTracks].fromJSValue()!
    }
    
    public var videoTracks: VideoTrackList {
        jsObject[.videoTracks].fromJSValue()!
    }
    
    public var textTracks: TextTrackList {
        jsObject[.textTracks].fromJSValue()!
    }
    
    @inlinable public func addTextTrack(kind: TextTrackKind, label: String? = nil, language: String? = nil) -> TextTrack {
        let this = jsObject
        return this[.addTextTrack].function!(this: this, arguments: [_toJSValue(kind), _toJSValue(label), _toJSValue(language)]).fromJSValue()!
        
    }
}

public enum MediaProvider: JSValueCompatible {
    case blob(Blob)
    case mediaSource(MediaSource)
    case mediaStream(MediaStream)
    
    public static func construct(from value: JSValue) -> Self? {
        if let blob: Blob = value.fromJSValue() {
            return .blob(blob)
        }
        if let mediaSource: MediaSource = value.fromJSValue() {
            return .mediaSource(mediaSource)
        }
        if let mediaStream: MediaStream = value.fromJSValue() {
            return .mediaStream(mediaStream)
        }
        return nil
    }
    
    public var jsValue: JSValue {
        switch self {
        case let .blob(blob):
            return blob.jsValue
        case let .mediaSource(mediaSource):
            return mediaSource.jsValue
        case let .mediaStream(mediaStream):
            return mediaStream.jsValue
        }
    }
}
