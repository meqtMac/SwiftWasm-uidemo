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

public class MediaTrackCapabilities: BridgedDictionary {
    public convenience init(width: ULongRange, height: ULongRange, aspectRatio: DoubleRange, frameRate: DoubleRange, facingMode: [String], resizeMode: [String], sampleRate: ULongRange, sampleSize: ULongRange, echoCancellation: [Bool], autoGainControl: [Bool], noiseSuppression: [Bool], latency: DoubleRange, channelCount: ULongRange, deviceId: String, groupId: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.width] = _toJSValue(width)
        object[.height] = _toJSValue(height)
        object[.aspectRatio] = _toJSValue(aspectRatio)
        object[.frameRate] = _toJSValue(frameRate)
        object[.facingMode] = _toJSValue(facingMode)
        object[.resizeMode] = _toJSValue(resizeMode)
        object[.sampleRate] = _toJSValue(sampleRate)
        object[.sampleSize] = _toJSValue(sampleSize)
        object[.echoCancellation] = _toJSValue(echoCancellation)
        object[.autoGainControl] = _toJSValue(autoGainControl)
        object[.noiseSuppression] = _toJSValue(noiseSuppression)
        object[.latency] = _toJSValue(latency)
        object[.channelCount] = _toJSValue(channelCount)
        object[.deviceId] = _toJSValue(deviceId)
        object[.groupId] = _toJSValue(groupId)
        self.init(unsafelyWrapping: object)
    }
    
    public var width: ULongRange {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }
    
    public var height: ULongRange {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }
    
    public var aspectRatio: DoubleRange {
        get { jsObject[.aspectRatio].fromJSValue()!}
        set { jsObject[.aspectRatio] = newValue.jsValue }
    }
    
    public var frameRate: DoubleRange {
        get { jsObject[.frameRate].fromJSValue()!}
        set { jsObject[.frameRate] = newValue.jsValue }
    }
    
    public var facingMode: [String] {
        get { jsObject[.facingMode].fromJSValue()!}
        set { jsObject[.facingMode] = newValue.jsValue }
    }
    
    public var resizeMode: [String] {
        get { jsObject[.resizeMode].fromJSValue()!}
        set { jsObject[.resizeMode] = newValue.jsValue }
    }
    
    public var sampleRate: ULongRange {
        get { jsObject[.sampleRate].fromJSValue()!}
        set { jsObject[.sampleRate] = newValue.jsValue }
    }
    
    public var sampleSize: ULongRange {
        get { jsObject[.sampleSize].fromJSValue()!}
        set { jsObject[.sampleSize] = newValue.jsValue }
    }
    
    public var echoCancellation: [Bool] {
        get { jsObject[.echoCancellation].fromJSValue()!}
        set { jsObject[.echoCancellation] = newValue.jsValue }
    }
    
    public var autoGainControl: [Bool] {
        get { jsObject[.autoGainControl].fromJSValue()!}
        set { jsObject[.autoGainControl] = newValue.jsValue }
    }
    
    public var noiseSuppression: [Bool] {
        get { jsObject[.noiseSuppression].fromJSValue()!}
        set { jsObject[.noiseSuppression] = newValue.jsValue }
    }
    
    public var latency: DoubleRange {
        get { jsObject[.latency].fromJSValue()!}
        set { jsObject[.latency] = newValue.jsValue }
    }
    
    public var channelCount: ULongRange {
        get { jsObject[.channelCount].fromJSValue()!}
        set { jsObject[.channelCount] = newValue.jsValue }
    }
    
    public var deviceId: String {
        get { jsObject[.deviceId].fromJSValue()!}
        set { jsObject[.deviceId] = newValue.jsValue }
    }
    
    public var groupId: String {
        get { jsObject[.groupId].fromJSValue()!}
        set { jsObject[.groupId] = newValue.jsValue }
    }
}

public class MediaTrackConstraintSet: BridgedDictionary {
    public enum ConstrainDOMString: JSValueCompatible {
        public class ConstrainDOMStringParameters: BridgedDictionary {
            public convenience init(exact: String_or_seq_of_String, ideal: String_or_seq_of_String) {
                let object = JSObject.global[.Object].function!.new()
                object[.exact] = _toJSValue(exact)
                object[.ideal] = _toJSValue(ideal)
                self.init(unsafelyWrapping: object)
            }
            
//            public required init(unsafelyWrapping object: JSObject) {
//                _exact = ReadWriteAttribute(jsObject: object, name: .exact)
//                _ideal = ReadWriteAttribute(jsObject: object, name: .ideal)
//                super.init(unsafelyWrapping: object)
//            }
            
            public var exact: String_or_seq_of_String {
                get { jsObject[.exact].fromJSValue()! }
                set { jsObject[.exact] = newValue.jsValue }
            }
            
            public var ideal: String_or_seq_of_String {
                get { jsObject[.ideal].fromJSValue()! }
                set { jsObject[.ideal] = newValue.jsValue }
            }
            
            public enum String_or_seq_of_String: JSValueCompatible {
                case string(String)
                case seq_of_String([String])
                
                public static func construct(from value: JSValue) -> Self? {
                    if let string: String = value.fromJSValue() {
                        return .string(string)
                    }
                    if let seq_of_String: [String] = value.fromJSValue() {
                        return .seq_of_String(seq_of_String)
                    }
                    return nil
                }
                
                public var jsValue: JSValue {
                    switch self {
                    case let .string(string):
                        return string.jsValue
                    case let .seq_of_String(seq_of_String):
                        return seq_of_String.jsValue
                    }
                }
            }
        }
        case constrainDOMStringParameters(ConstrainDOMStringParameters)
        case string(String)
        case seq_of_String([String])
        
        public static func construct(from value: JSValue) -> Self? {
            if let constrainDOMStringParameters: ConstrainDOMStringParameters = value.fromJSValue() {
                return .constrainDOMStringParameters(constrainDOMStringParameters)
            }
            if let string: String = value.fromJSValue() {
                return .string(string)
            }
            if let seq_of_String: [String] = value.fromJSValue() {
                return .seq_of_String(seq_of_String)
            }
            return nil
        }
        
        public var jsValue: JSValue {
            switch self {
            case let .constrainDOMStringParameters(constrainDOMStringParameters):
                return constrainDOMStringParameters.jsValue
            case let .string(string):
                return string.jsValue
            case let .seq_of_String(seq_of_String):
                return seq_of_String.jsValue
            }
        }
    }
    public convenience init(width: ConstrainULong,
                            height: ConstrainULong,
                            aspectRatio: ConstrainDouble,
                            frameRate: ConstrainDouble,
                            facingMode: ConstrainDOMString,
                            resizeMode: ConstrainDOMString,
                            sampleRate: ConstrainULong,
                            sampleSize: ConstrainULong,
                            echoCancellation: ConstrainBoolean,
                            autoGainControl: ConstrainBoolean,
                            noiseSuppression: ConstrainBoolean,
                            latency: ConstrainDouble,
                            channelCount: ConstrainULong,
                            deviceId: ConstrainDOMString,
                            groupId: ConstrainDOMString) {
        let object = JSObject.global[.Object].function!.new()
        object[.width] = _toJSValue(width)
        object[.height] = _toJSValue(height)
        object[.aspectRatio] = _toJSValue(aspectRatio)
        object[.frameRate] = _toJSValue(frameRate)
        object[.facingMode] = _toJSValue(facingMode)
        object[.resizeMode] = _toJSValue(resizeMode)
        object[.sampleRate] = _toJSValue(sampleRate)
        object[.sampleSize] = _toJSValue(sampleSize)
        object[.echoCancellation] = _toJSValue(echoCancellation)
        object[.autoGainControl] = _toJSValue(autoGainControl)
        object[.noiseSuppression] = _toJSValue(noiseSuppression)
        object[.latency] = _toJSValue(latency)
        object[.channelCount] = _toJSValue(channelCount)
        object[.deviceId] = _toJSValue(deviceId)
        object[.groupId] = _toJSValue(groupId)
        self.init(unsafelyWrapping: object)
    }
    
    public var width: ConstrainULong {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }
    
    public var height: ConstrainULong {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }
    
    public var aspectRatio: ConstrainDouble {
        get { jsObject[.aspectRatio].fromJSValue()!}
        set { jsObject[.aspectRatio] = newValue.jsValue }
    }
    
    public var frameRate: ConstrainDouble {
        get { jsObject[.frameRate].fromJSValue()!}
        set { jsObject[.frameRate] = newValue.jsValue }
    }
    
    public var facingMode: ConstrainDOMString {
        get { jsObject[.facingMode].fromJSValue()!}
        set { jsObject[.facingMode] = newValue.jsValue }
    }
    
    public var resizeMode: ConstrainDOMString {
        get { jsObject[.resizeMode].fromJSValue()!}
        set { jsObject[.resizeMode] = newValue.jsValue }
    }
    
    public var sampleRate: ConstrainULong {
        get { jsObject[.sampleRate].fromJSValue()!}
        set { jsObject[.sampleRate] = newValue.jsValue }
    }
    
    public var sampleSize: ConstrainULong {
        get { jsObject[.sampleSize].fromJSValue()!}
        set { jsObject[.sampleSize] = newValue.jsValue }
    }
    
    public var echoCancellation: ConstrainBoolean {
        get { jsObject[.echoCancellation].fromJSValue()!}
        set { jsObject[.echoCancellation] = newValue.jsValue }
    }
    
    public var autoGainControl: ConstrainBoolean {
        get { jsObject[.autoGainControl].fromJSValue()!}
        set { jsObject[.autoGainControl] = newValue.jsValue }
    }
    
    public var noiseSuppression: ConstrainBoolean {
        get { jsObject[.noiseSuppression].fromJSValue()!}
        set { jsObject[.noiseSuppression] = newValue.jsValue }
    }
    
    public var latency: ConstrainDouble {
        get { jsObject[.latency].fromJSValue()!}
        set { jsObject[.latency] = newValue.jsValue }
    }
    
    public var channelCount: ConstrainULong {
        get { jsObject[.channelCount].fromJSValue()!}
        set { jsObject[.channelCount] = newValue.jsValue }
    }
    
    public var deviceId: ConstrainDOMString {
        get { jsObject[.deviceId].fromJSValue()!}
        set { jsObject[.deviceId] = newValue.jsValue }
    }
    
    public var groupId: ConstrainDOMString {
        get { jsObject[.groupId].fromJSValue()!}
        set { jsObject[.groupId] = newValue.jsValue }
    }
}

public class MediaTrackConstraints: BridgedDictionary {
    public convenience init(advanced: [MediaTrackConstraintSet]) {
        let object = JSObject.global[.Object].function!.new()
        object[.advanced] = _toJSValue(advanced)
        self.init(unsafelyWrapping: object)
    }
    
    public var advanced: [MediaTrackConstraintSet] {
        get { jsObject[.advanced].fromJSValue()!}
        set { jsObject[.advanced] = newValue.jsValue }
    }
}

public class MediaTrackSettings: BridgedDictionary {
    public convenience init(width: UInt32, height: UInt32, aspectRatio: Double, frameRate: Double, facingMode: String, resizeMode: String, sampleRate: UInt32, sampleSize: UInt32, echoCancellation: Bool, autoGainControl: Bool, noiseSuppression: Bool, latency: Double, channelCount: UInt32, deviceId: String, groupId: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.width] = _toJSValue(width)
        object[.height] = _toJSValue(height)
        object[.aspectRatio] = _toJSValue(aspectRatio)
        object[.frameRate] = _toJSValue(frameRate)
        object[.facingMode] = _toJSValue(facingMode)
        object[.resizeMode] = _toJSValue(resizeMode)
        object[.sampleRate] = _toJSValue(sampleRate)
        object[.sampleSize] = _toJSValue(sampleSize)
        object[.echoCancellation] = _toJSValue(echoCancellation)
        object[.autoGainControl] = _toJSValue(autoGainControl)
        object[.noiseSuppression] = _toJSValue(noiseSuppression)
        object[.latency] = _toJSValue(latency)
        object[.channelCount] = _toJSValue(channelCount)
        object[.deviceId] = _toJSValue(deviceId)
        object[.groupId] = _toJSValue(groupId)
        self.init(unsafelyWrapping: object)
    }
    
    public var width: UInt32 {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }
    
    public var height: UInt32 {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }
    
    public var aspectRatio: Double {
        get { jsObject[.aspectRatio].fromJSValue()!}
        set { jsObject[.aspectRatio] = newValue.jsValue }
    }
    
    public var frameRate: Double {
        get { jsObject[.frameRate].fromJSValue()!}
        set { jsObject[.frameRate] = newValue.jsValue }
    }
    
    public var facingMode: String {
        get { jsObject[.facingMode].fromJSValue()!}
        set { jsObject[.facingMode] = newValue.jsValue }
    }
    
    public var resizeMode: String {
        get { jsObject[.resizeMode].fromJSValue()!}
        set { jsObject[.resizeMode] = newValue.jsValue }
    }
    
    public var sampleRate: UInt32 {
        get { jsObject[.sampleRate].fromJSValue()!}
        set { jsObject[.sampleRate] = newValue.jsValue }
    }
    
    public var sampleSize: UInt32 {
        get { jsObject[.sampleSize].fromJSValue()!}
        set { jsObject[.sampleSize] = newValue.jsValue }
    }
    
    public var echoCancellation: Bool {
        get { jsObject[.echoCancellation].fromJSValue()!}
        set { jsObject[.echoCancellation] = newValue.jsValue }
    }
    
    public var autoGainControl: Bool {
        get { jsObject[.autoGainControl].fromJSValue()!}
        set { jsObject[.autoGainControl] = newValue.jsValue }
    }
    
    public var noiseSuppression: Bool {
        get { jsObject[.noiseSuppression].fromJSValue()!}
        set { jsObject[.noiseSuppression] = newValue.jsValue }
    }
    
    public var latency: Double {
        get { jsObject[.latency].fromJSValue()!}
        set { jsObject[.latency] = newValue.jsValue }
    }
    
    public var channelCount: UInt32 {
        get { jsObject[.channelCount].fromJSValue()!}
        set { jsObject[.channelCount] = newValue.jsValue }
    }
    
    public var deviceId: String {
        get { jsObject[.deviceId].fromJSValue()!}
        set { jsObject[.deviceId] = newValue.jsValue }
    }
    
    public var groupId: String {
        get { jsObject[.groupId].fromJSValue()!}
        set { jsObject[.groupId] = newValue.jsValue }
    }
}

public class MediaTrackSupportedConstraints: BridgedDictionary {
    public convenience init(width: Bool, height: Bool, aspectRatio: Bool, frameRate: Bool, facingMode: Bool, resizeMode: Bool, sampleRate: Bool, sampleSize: Bool, echoCancellation: Bool, autoGainControl: Bool, noiseSuppression: Bool, latency: Bool, channelCount: Bool, deviceId: Bool, groupId: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.width] = _toJSValue(width)
        object[.height] = _toJSValue(height)
        object[.aspectRatio] = _toJSValue(aspectRatio)
        object[.frameRate] = _toJSValue(frameRate)
        object[.facingMode] = _toJSValue(facingMode)
        object[.resizeMode] = _toJSValue(resizeMode)
        object[.sampleRate] = _toJSValue(sampleRate)
        object[.sampleSize] = _toJSValue(sampleSize)
        object[.echoCancellation] = _toJSValue(echoCancellation)
        object[.autoGainControl] = _toJSValue(autoGainControl)
        object[.noiseSuppression] = _toJSValue(noiseSuppression)
        object[.latency] = _toJSValue(latency)
        object[.channelCount] = _toJSValue(channelCount)
        object[.deviceId] = _toJSValue(deviceId)
        object[.groupId] = _toJSValue(groupId)
        self.init(unsafelyWrapping: object)
    }
    
    public var width: Bool {
        get { jsObject[.width].fromJSValue()!}
        set { jsObject[.width] = newValue.jsValue }
    }
    
    public var height: Bool {
        get { jsObject[.height].fromJSValue()!}
        set { jsObject[.height] = newValue.jsValue }
    }
    
    public var aspectRatio: Bool {
        get { jsObject[.aspectRatio].fromJSValue()!}
        set { jsObject[.aspectRatio] = newValue.jsValue }
    }
    
    public var frameRate: Bool {
        get { jsObject[.frameRate].fromJSValue()!}
        set { jsObject[.frameRate] = newValue.jsValue }
    }
    
    public var facingMode: Bool {
        get { jsObject[.facingMode].fromJSValue()!}
        set { jsObject[.facingMode] = newValue.jsValue }
    }
    
    public var resizeMode: Bool {
        get { jsObject[.resizeMode].fromJSValue()!}
        set { jsObject[.resizeMode] = newValue.jsValue }
    }
    
    public var sampleRate: Bool {
        get { jsObject[.sampleRate].fromJSValue()!}
        set { jsObject[.sampleRate] = newValue.jsValue }
    }
    
    public var sampleSize: Bool {
        get { jsObject[.sampleSize].fromJSValue()!}
        set { jsObject[.sampleSize] = newValue.jsValue }
    }
    
    public var echoCancellation: Bool {
        get { jsObject[.echoCancellation].fromJSValue()!}
        set { jsObject[.echoCancellation] = newValue.jsValue }
    }
    
    public var autoGainControl: Bool {
        get { jsObject[.autoGainControl].fromJSValue()!}
        set { jsObject[.autoGainControl] = newValue.jsValue }
    }
    
    public var noiseSuppression: Bool {
        get { jsObject[.noiseSuppression].fromJSValue()!}
        set { jsObject[.noiseSuppression] = newValue.jsValue }
    }
    
    public var latency: Bool {
        get { jsObject[.latency].fromJSValue()!}
        set { jsObject[.latency] = newValue.jsValue }
    }
    
    public var channelCount: Bool {
        get { jsObject[.channelCount].fromJSValue()!}
        set { jsObject[.channelCount] = newValue.jsValue }
    }
    
    public var deviceId: Bool {
        get { jsObject[.deviceId].fromJSValue()!}
        set { jsObject[.deviceId] = newValue.jsValue }
    }
    
    public var groupId: Bool {
        get { jsObject[.groupId].fromJSValue()!}
        set { jsObject[.groupId] = newValue.jsValue }
    }
}

public enum ConstrainBoolean: JSValueCompatible {
    case bool(Bool)
    case constrainBooleanParameters(ConstrainBooleanParameters)
    
    public static func construct(from value: JSValue) -> Self? {
        if let bool: Bool = value.fromJSValue() {
            return .bool(bool)
        }
        if let constrainBooleanParameters: ConstrainBooleanParameters = value.fromJSValue() {
            return .constrainBooleanParameters(constrainBooleanParameters)
        }
        return nil
    }
    
    public var jsValue: JSValue {
        switch self {
        case let .bool(bool):
            return bool.jsValue
        case let .constrainBooleanParameters(constrainBooleanParameters):
            return constrainBooleanParameters.jsValue
        }
    }
    
}

extension ConstrainBoolean {
    public class ConstrainBooleanParameters: BridgedDictionary {
        public convenience init(exact: Bool, ideal: Bool) {
            let object = JSObject.global[.Object].function!.new()
            object[.exact] = _toJSValue(exact)
            object[.ideal] = _toJSValue(ideal)
            self.init(unsafelyWrapping: object)
        }
        
        public var exact: Bool {
            get { jsObject[.exact].fromJSValue()!}
            set { jsObject[.exact] = newValue.jsValue }
        }
        
        public var ideal: Bool {
            get { jsObject[.ideal].fromJSValue()!}
            set { jsObject[.ideal] = newValue.jsValue }
        }
    }   
}
