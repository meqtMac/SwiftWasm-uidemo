//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/9/14.
//

import JavaScriptKit
import WebAPIBase
import JavaScriptEventLoop

public class Text: CharacterData, Slottable, GeometryUtils {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.Text].function }
    
    @inlinable public convenience init(data: String? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(data)]))
    }
    
    @inlinable public func splitText(offset: UInt32) -> Self {
        let this = jsObject
        return this[.splitText].function!(this: this, arguments: [_toJSValue(offset)]).fromJSValue()!
    }
    
    public var wholeText: String {
        jsObject[.wholeText].fromJSValue()!
    }
}

public class TextMetrics: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.TextMetrics].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var width: Double {
        jsObject[.width].fromJSValue()!
    }
    
    public var actualBoundingBoxLeft: Double {
        jsObject[.actualBoundingBoxLeft].fromJSValue()!
    }
    
    public var actualBoundingBoxRight: Double {
        jsObject[.actualBoundingBoxRight].fromJSValue()!
    }
    
    public var fontBoundingBoxAscent: Double {
        jsObject[.fontBoundingBoxAscent].fromJSValue()!
    }
    
    public var fontBoundingBoxDescent: Double {
        jsObject[.fontBoundingBoxDescent].fromJSValue()!
    }
    
    public var actualBoundingBoxAscent: Double {
        jsObject[.actualBoundingBoxAscent].fromJSValue()!
    }
    
    public var actualBoundingBoxDescent: Double {
        jsObject[.actualBoundingBoxDescent].fromJSValue()!
    }
    
    public var emHeightAscent: Double {
        jsObject[.emHeightAscent].fromJSValue()!
    }
    
    public var emHeightDescent: Double {
        jsObject[.emHeightDescent].fromJSValue()!
    }
    
    public var hangingBaseline: Double {
        jsObject[.hangingBaseline].fromJSValue()!
    }
    
    public var alphabeticBaseline: Double {
        jsObject[.alphabeticBaseline].fromJSValue()!
    }
    
    public var ideographicBaseline: Double {
        jsObject[.ideographicBaseline].fromJSValue()!
    }
}

public class TextTrack: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.TextTrack].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _oncuechange = ClosureAttribute1Optional(jsObject: jsObject, name: .oncuechange)
        super.init(unsafelyWrapping: jsObject)
    }
    
    public var kind: TextTrackKind {
        jsObject[.kind].fromJSValue()!
    }
    
    public var label: String {
        jsObject[.label].fromJSValue()!
    }
    
    public var language: String {
        jsObject[.language].fromJSValue()!
    }
    
    public var id: String {
        jsObject[.id].fromJSValue()!
    }
    
    public var inBandMetadataTrackDispatchType: String {
        jsObject[.inBandMetadataTrackDispatchType].fromJSValue()!
    }
    
    public var mode: TextTrackMode {
        get { jsObject[.mode].fromJSValue()!}
        set { jsObject[.mode] = newValue.jsValue }
    }
    
    public var cues: TextTrackCueList? {
        jsObject[.cues].fromJSValue()
    }
    
    public var activeCues: TextTrackCueList? {
        jsObject[.activeCues].fromJSValue()
    }
    
    @inlinable public func addCue(cue: TextTrackCue) {
        let this = jsObject
        _ = this[.addCue].function!(this: this, arguments: [_toJSValue(cue)])
    }
    
    @inlinable public func removeCue(cue: TextTrackCue) {
        let this = jsObject
        _ = this[.removeCue].function!(this: this, arguments: [_toJSValue(cue)])
    }
    
    @ClosureAttribute1Optional
    public var oncuechange: EventHandler
    
    public var sourceBuffer: SourceBuffer? {
        jsObject[.sourceBuffer].fromJSValue()
    }
}

public class TextTrackCue: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.TextTrackCue].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onenter = ClosureAttribute1Optional(jsObject: jsObject, name: .onenter)
        _onexit = ClosureAttribute1Optional(jsObject: jsObject, name: .onexit)
        super.init(unsafelyWrapping: jsObject)
    }
    
    public var track: TextTrack? {
        jsObject[.track].fromJSValue()
    }
    
    public var id: String {
        get { jsObject[.id].fromJSValue()!}
        set { jsObject[.id] = newValue.jsValue }
    }
    
    public var startTime: Double {
        get { jsObject[.startTime].fromJSValue()!}
        set { jsObject[.startTime] = newValue.jsValue }
    }
    
    public var endTime: Double {
        get { jsObject[.endTime].fromJSValue()!}
        set { jsObject[.endTime] = newValue.jsValue }
    }
    
    public var pauseOnExit: Bool {
        get { jsObject[.pauseOnExit].fromJSValue()!}
        set { jsObject[.pauseOnExit] = newValue.jsValue }
    }
    
    @ClosureAttribute1Optional
    public var onenter: EventHandler
    
    @ClosureAttribute1Optional
    public var onexit: EventHandler
}

public class TextTrackCueList: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.TextTrackCueList].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    public var length: UInt32 {
        jsObject[.length].fromJSValue()!
    }
    
    @inlinable public subscript(key: Int) -> TextTrackCue {
        jsObject[key].fromJSValue()!
    }
    
    @inlinable public func getCueById(id: String) -> TextTrackCue? {
        let this = jsObject
        return this[.getCueById].function!(this: this, arguments: [_toJSValue(id)]).fromJSValue()
    }
}

public enum TextTrackKind: JSString, JSValueCompatible {
    case subtitles = "subtitles"
    case captions = "captions"
    case descriptions = "descriptions"
    case chapters = "chapters"
    case metadata = "metadata"
    
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

public class TextTrackList: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.TextTrackList].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onchange = ClosureAttribute1Optional(jsObject: jsObject, name: .onchange)
        _onaddtrack = ClosureAttribute1Optional(jsObject: jsObject, name: .onaddtrack)
        _onremovetrack = ClosureAttribute1Optional(jsObject: jsObject, name: .onremovetrack)
        super.init(unsafelyWrapping: jsObject)
    }
    
    public var length: UInt32 {
        jsObject[.length].fromJSValue()!
    }
    
    @inlinable public subscript(key: Int) -> TextTrack {
        jsObject[key].fromJSValue()!
    }
    
    @inlinable public func getTrackById(id: String) -> TextTrack? {
        let this = jsObject
        return this[.getTrackById].function!(this: this, arguments: [_toJSValue(id)]).fromJSValue()
    }
    
    @ClosureAttribute1Optional
    public var onchange: EventHandler
    
    @ClosureAttribute1Optional
    public var onaddtrack: EventHandler
    
    @ClosureAttribute1Optional
    public var onremovetrack: EventHandler
}

public enum TextTrackMode: JSString, JSValueCompatible {
    case disabled = "disabled"
    case hidden = "hidden"
    case showing = "showing"
    
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

