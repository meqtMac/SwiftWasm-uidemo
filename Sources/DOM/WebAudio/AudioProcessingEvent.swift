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

public typealias AudioDataOutputCallback = (AudioData) -> Void

public class AudioProcessingEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.AudioProcessingEvent].function }
    
    @inlinable public convenience init(type: String, eventInitDict: AudioProcessingEventInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public var playbackTime: Double {
        jsObject[.playbackTime].fromJSValue()!
    }
    
    public var inputBuffer: AudioBuffer {
        jsObject[.inputBuffer].fromJSValue()!
    }
    
    public var outputBuffer: AudioBuffer {
        jsObject[.outputBuffer].fromJSValue()!
    }
}

public class AudioProcessingEventInit: BridgedDictionary {
    public convenience init(playbackTime: Double, inputBuffer: AudioBuffer, outputBuffer: AudioBuffer) {
        let object = JSObject.global[.Object].function!.new()
        object[.playbackTime] = _toJSValue(playbackTime)
        object[.inputBuffer] = _toJSValue(inputBuffer)
        object[.outputBuffer] = _toJSValue(outputBuffer)
        self.init(unsafelyWrapping: object)
    }
    
    public var playbackTime: Double {
        get { jsObject[.playbackTime].fromJSValue()!}
        set { jsObject[.playbackTime] = newValue.jsValue }
    }
    
    public var inputBuffer: AudioBuffer {
        get { jsObject[.inputBuffer].fromJSValue()!}
        set { jsObject[.inputBuffer] = newValue.jsValue }
    }
    
    public var outputBuffer: AudioBuffer {
        get { jsObject[.outputBuffer].fromJSValue()!}
        set { jsObject[.outputBuffer] = newValue.jsValue }
    }
}
