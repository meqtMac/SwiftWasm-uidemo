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

public class BeforeUnloadEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.BeforeUnloadEvent].function }
    
    @inlinable public var returnValueAsString: String {
        get { jsObject[.returnValue].fromJSValue()! }
        set { jsObject[.returnValue] = newValue.jsValue }
    }
}


public class BlobEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.BlobEvent].function }
    
    @inlinable public convenience init(type: String, eventInitDict: BlobEventInit) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public var data: Blob {
        jsObject[.data].fromJSValue()!
    }
    
    public var timecode: DOMHighResTimeStamp {
        jsObject[.timecode].fromJSValue()!
    }
}

public class BlobEventInit: BridgedDictionary {
    public convenience init(data: Blob, timecode: DOMHighResTimeStamp) {
        let object = JSObject.global[.Object].function!.new()
        object[.data] = _toJSValue(data)
        object[.timecode] = _toJSValue(timecode)
        self.init(unsafelyWrapping: object)
    }
    
    public var data: Blob {
        get { jsObject[.data].fromJSValue()!}
        set { jsObject[.data] = newValue.jsValue }
    }
    
    public var timecode: DOMHighResTimeStamp {
        get { jsObject[.timecode].fromJSValue()!}
        set { jsObject[.timecode] = newValue.jsValue }
    }
}

public class CustomEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.CustomEvent].function }
    
    @inlinable public convenience init(type: String, eventInitDict: CustomEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
public var detail: JSValue {
jsObject[.detail].fromJSValue()!
    }
    
    @inlinable public func initCustomEvent(type: String, bubbles: Bool? = nil, cancelable: Bool? = nil, detail: JSValue? = nil) {
        let this = jsObject
        _ = this[.initCustomEvent].function!(this: this, arguments: [_toJSValue(type), _toJSValue(bubbles), _toJSValue(cancelable), _toJSValue(detail)])
    }
}

public class CustomEventInit: BridgedDictionary {
    public convenience init(detail: JSValue) {
        let object = JSObject.global[.Object].function!.new()
        object[.detail] = _toJSValue(detail)
        self.init(unsafelyWrapping: object)
    }
    
    public var detail: JSValue {
        get { jsObject[.detail].fromJSValue()!}
        set { jsObject[.detail] = newValue.jsValue }
    }
}
public class ErrorEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.ErrorEvent].function }
    
    //    @inlinable public convenience init(type: String, eventInitDict: ErrorEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var message: String {
jsObject[.message].fromJSValue()!
    }
    
public var filename: String {
jsObject[.filename].fromJSValue()!
    }
    
public var lineno: UInt32 {
jsObject[.lineno].fromJSValue()!
    }
    
public var colno: UInt32 {
jsObject[.colno].fromJSValue()!
    }
    
public var error: JSValue {
jsObject[.error].fromJSValue()!
    }
}

//public class ErrorEventInit: BridgedDictionary {
//    public convenience init(message: String, filename: String, lineno: UInt32, colno: UInt32, error: JSValue) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.message] = _toJSValue(message)
//        object[.filename] = _toJSValue(filename)
//        object[.lineno] = _toJSValue(lineno)
//        object[.colno] = _toJSValue(colno)
//        object[.error] = _toJSValue(error)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _message = ReadWriteAttribute(jsObject: object, name: .message)
//        _filename = ReadWriteAttribute(jsObject: object, name: .filename)
//        _lineno = ReadWriteAttribute(jsObject: object, name: .lineno)
//        _colno = ReadWriteAttribute(jsObject: object, name: .colno)
//        _error = ReadWriteAttribute(jsObject: object, name: .error)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var message: String
//
//    @ReadWriteAttribute
//    public var filename: String
//
//    @ReadWriteAttribute
//    public var lineno: UInt32
//
//    @ReadWriteAttribute
//    public var colno: UInt32
//
//    @ReadWriteAttribute
//    public var error: JSValue
//}
//public class ExtendableEventInit: BridgedDictionary {
//    public convenience init() {
//        let object = JSObject.global[.Object].function!.new()
//
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        super.init(unsafelyWrapping: object)
//    }
//}



public class FormDataEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.FormDataEvent].function }
    
    //    @inlinable public convenience init(type: String, eventInitDict: FormDataEventInit) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var formData: FormData {
jsObject[.formData].fromJSValue()!
    }
}

//public class FormDataEventInit: BridgedDictionary {
//    public convenience init(formData: FormData) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.formData] = _toJSValue(formData)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _formData = ReadWriteAttribute(jsObject: object, name: .formData)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var formData: FormData
//}

//public class FetchEventInit: BridgedDictionary {
//    public convenience init(request: Request, preloadResponse: JSPromise, clientId: String, resultingClientId: String, replacesClientId: String, handled: JSPromise) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.request] = _toJSValue(request)
//        object[.preloadResponse] = _toJSValue(preloadResponse)
//        object[.clientId] = _toJSValue(clientId)
//        object[.resultingClientId] = _toJSValue(resultingClientId)
//        object[.replacesClientId] = _toJSValue(replacesClientId)
//        object[.handled] = _toJSValue(handled)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _request = ReadWriteAttribute(jsObject: object, name: .request)
//        _preloadResponse = ReadWriteAttribute(jsObject: object, name: .preloadResponse)
//        _clientId = ReadWriteAttribute(jsObject: object, name: .clientId)
//        _resultingClientId = ReadWriteAttribute(jsObject: object, name: .resultingClientId)
//        _replacesClientId = ReadWriteAttribute(jsObject: object, name: .replacesClientId)
//        _handled = ReadWriteAttribute(jsObject: object, name: .handled)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var request: Request
//
//    @ReadWriteAttribute
//    public var preloadResponse: JSPromise
//
//    @ReadWriteAttribute
//    public var clientId: String
//
//    @ReadWriteAttribute
//    public var resultingClientId: String
//
//    @ReadWriteAttribute
//    public var replacesClientId: String
//
//    @ReadWriteAttribute
//    public var handled: JSPromise
//}


public class HashChangeEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HashChangeEvent].function }
    
    //    @inlinable public convenience init(type: String, eventInitDict: HashChangeEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var oldURL: String {
jsObject[.oldURL].fromJSValue()!
    }
    
public var newURL: String {
jsObject[.newURL].fromJSValue()!
    }
}

//public class HashChangeEventInit: BridgedDictionary {
//    public convenience init(oldURL: String, newURL: String) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.oldURL] = _toJSValue(oldURL)
//        object[.newURL] = _toJSValue(newURL)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _oldURL = ReadWriteAttribute(jsObject: object, name: .oldURL)
//        _newURL = ReadWriteAttribute(jsObject: object, name: .newURL)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var oldURL: String
//
//    @ReadWriteAttribute
//    public var newURL: String
//}

public class MessageEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MessageEvent].function }
    
    //    @inlinable public convenience init(type: String, eventInitDict: MessageEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var data: JSValue {
jsObject[.data].fromJSValue()!
    }
    
public var origin: String {
jsObject[.origin].fromJSValue()!
    }
    
public var lastEventId: String {
jsObject[.lastEventId].fromJSValue()!
    }
    
public var source: MessageEventSource? {
jsObject[.source].fromJSValue()
    }
    
public var ports: [MessagePort] {
jsObject[.ports].fromJSValue()!
    }
    
    @inlinable public func initMessageEvent(type: String, bubbles: Bool? = nil, cancelable: Bool? = nil, data: JSValue? = nil, origin: String? = nil, lastEventId: String? = nil, source: MessageEventSource? = nil, ports: [MessagePort]? = nil) {
        let this = jsObject
        _ = this[.initMessageEvent].function!(this: this, arguments: [_toJSValue(type), _toJSValue(bubbles), _toJSValue(cancelable), _toJSValue(data), _toJSValue(origin), _toJSValue(lastEventId), _toJSValue(source), _toJSValue(ports)])
    }
    
    public enum MessageEventSource: JSValueCompatible {
        case messagePort(MessagePort)
        case serviceWorker(ServiceWorker)
        case windowProxy(WindowProxy)
        
        public static func construct(from value: JSValue) -> Self? {
            if let messagePort: MessagePort = value.fromJSValue() {
                return .messagePort(messagePort)
            }
            if let serviceWorker: ServiceWorker = value.fromJSValue() {
                return .serviceWorker(serviceWorker)
            }
            if let windowProxy: WindowProxy = value.fromJSValue() {
                return .windowProxy(windowProxy)
            }
            return nil
        }
        
        public var jsValue: JSValue {
            switch self {
            case let .messagePort(messagePort):
                return messagePort.jsValue
            case let .serviceWorker(serviceWorker):
                return serviceWorker.jsValue
            case let .windowProxy(windowProxy):
                return windowProxy.jsValue
            }
        }
    }
}

public class NavigateEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.NavigateEvent].function }
    
    //    @inlinable public convenience init(type: String, eventInitDict: NavigateEventInit) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var navigationType: NavigationType {
jsObject[.navigationType].fromJSValue()!
    }
    
public var destination: NavigationDestination {
jsObject[.destination].fromJSValue()!
    }
    
public var canIntercept: Bool {
jsObject[.canIntercept].fromJSValue()!
    }
    
public var userInitiated: Bool {
jsObject[.userInitiated].fromJSValue()!
    }
    
public var hashChange: Bool {
jsObject[.hashChange].fromJSValue()!
    }
    
public var signal: AbortSignal {
jsObject[.signal].fromJSValue()!
    }
    
public var formData: FormData? {
jsObject[.formData].fromJSValue()
    }
    
public var downloadRequest: String? {
jsObject[.downloadRequest].fromJSValue()
    }
    
public var info: JSValue {
jsObject[.info].fromJSValue()!
    }
    
    @inlinable public func intercept(options: NavigationInterceptOptions? = nil) {
        let this = jsObject
        _ = this[.intercept].function!(this: this, arguments: [_toJSValue(options)])
    }
    
    @inlinable public func scroll() {
        let this = jsObject
        _ = this[.scroll].function!(this: this, arguments: [])
    }
}

//public class NavigateEventInit: BridgedDictionary {
//    public convenience init(navigationType: NavigationType, destination: NavigationDestination, canIntercept: Bool, userInitiated: Bool, hashChange: Bool, signal: AbortSignal, formData: FormData?, downloadRequest: String?, info: JSValue) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.navigationType] = _toJSValue(navigationType)
//        object[.destination] = _toJSValue(destination)
//        object[.canIntercept] = _toJSValue(canIntercept)
//        object[.userInitiated] = _toJSValue(userInitiated)
//        object[.hashChange] = _toJSValue(hashChange)
//        object[.signal] = _toJSValue(signal)
//        object[.formData] = _toJSValue(formData)
//        object[.downloadRequest] = _toJSValue(downloadRequest)
//        object[.info] = _toJSValue(info)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _navigationType = ReadWriteAttribute(jsObject: object, name: .navigationType)
//        _destination = ReadWriteAttribute(jsObject: object, name: .destination)
//        _canIntercept = ReadWriteAttribute(jsObject: object, name: .canIntercept)
//        _userInitiated = ReadWriteAttribute(jsObject: object, name: .userInitiated)
//        _hashChange = ReadWriteAttribute(jsObject: object, name: .hashChange)
//        _signal = ReadWriteAttribute(jsObject: object, name: .signal)
//        _formData = ReadWriteAttribute(jsObject: object, name: .formData)
//        _downloadRequest = ReadWriteAttribute(jsObject: object, name: .downloadRequest)
//        _info = ReadWriteAttribute(jsObject: object, name: .info)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var navigationType: NavigationType
//
//    @ReadWriteAttribute
//    public var destination: NavigationDestination
//
//    @ReadWriteAttribute
//    public var canIntercept: Bool
//
//    @ReadWriteAttribute
//    public var userInitiated: Bool
//
//    @ReadWriteAttribute
//    public var hashChange: Bool
//
//    @ReadWriteAttribute
//    public var signal: AbortSignal
//
//    @ReadWriteAttribute
//    public var formData: FormData?
//
//    @ReadWriteAttribute
//    public var downloadRequest: String?
//
//    @ReadWriteAttribute
//    public var info: JSValue
//}

public class NavigationCurrentEntryChangeEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.NavigationCurrentEntryChangeEvent].function }
    
   //
    //    @inlinable public convenience init(type: String, eventInitDict: NavigationCurrentEntryChangeEventInit) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var navigationType: NavigationType? {
jsObject[.navigationType].fromJSValue()
    }
    
public var from: NavigationHistoryEntry {
jsObject[.from].fromJSValue()!
    }
}

//public class NavigationCurrentEntryChangeEventInit: BridgedDictionary {
//    public convenience init(navigationType: NavigationType?, from: NavigationHistoryEntry) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.navigationType] = _toJSValue(navigationType)
//        object[.from] = _toJSValue(from)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _navigationType = ReadWriteAttribute(jsObject: object, name: .navigationType)
//        _from = ReadWriteAttribute(jsObject: object, name: .from)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var navigationType: NavigationType?
//
//    @ReadWriteAttribute
//    public var from: NavigationHistoryEntry
//}
public class PageTransitionEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.PageTransitionEvent].function }
    
    //    @inlinable public convenience init(type: String, eventInitDict: PageTransitionEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var persisted: Bool {
jsObject[.persisted].fromJSValue()!
    }
}

//public class PageTransitionEventInit: BridgedDictionary {
//    public convenience init(persisted: Bool) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.persisted] = _toJSValue(persisted)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _persisted = ReadWriteAttribute(jsObject: object, name: .persisted)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var persisted: Bool
//}

public class PopStateEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.PopStateEvent].function }
    
    //    @inlinable public convenience init(type: String, eventInitDict: PopStateEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var state: JSValue {
jsObject[.state].fromJSValue()!
    }
}

//public class PopStateEventInit: BridgedDictionary {
//    public convenience init(state: JSValue) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.state] = _toJSValue(state)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _state = ReadWriteAttribute(jsObject: object, name: .state)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var state: JSValue
//}

public class ProgressEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.ProgressEvent].function }
    
    //    @inlinable public convenience init(type: String, eventInitDict: ProgressEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var lengthComputable: Bool {
jsObject[.lengthComputable].fromJSValue()!
    }
    
public var loaded: UInt64 {
jsObject[.loaded].fromJSValue()!
    }
    
public var total: UInt64 {
jsObject[.total].fromJSValue()!
    }
}

//public class ProgressEventInit: BridgedDictionary {
//    public convenience init(lengthComputable: Bool, loaded: UInt64, total: UInt64) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.lengthComputable] = _toJSValue(lengthComputable)
//        object[.loaded] = _toJSValue(loaded)
//        object[.total] = _toJSValue(total)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _lengthComputable = ReadWriteAttribute(jsObject: object, name: .lengthComputable)
//        _loaded = ReadWriteAttribute(jsObject: object, name: .loaded)
//        _total = ReadWriteAttribute(jsObject: object, name: .total)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var lengthComputable: Bool
//
//    @ReadWriteAttribute
//    public var loaded: UInt64
//
//    @ReadWriteAttribute
//    public var total: UInt64
//}

public class PromiseRejectionEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.PromiseRejectionEvent].function }
    
    //    @inlinable public convenience init(type: String, eventInitDict: PromiseRejectionEventInit) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var promise: JSPromise {
jsObject[.promise].fromJSValue()!
    }
    
public var reason: JSValue {
jsObject[.reason].fromJSValue()!
    }
}

//public class PromiseRejectionEventInit: BridgedDictionary {
//    public convenience init(promise: JSPromise, reason: JSValue) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.promise] = _toJSValue(promise)
//        object[.reason] = _toJSValue(reason)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _promise = ReadWriteAttribute(jsObject: object, name: .promise)
//        _reason = ReadWriteAttribute(jsObject: object, name: .reason)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var promise: JSPromise
//
//    @ReadWriteAttribute
//    public var reason: JSValue
//}

public class StorageEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.StorageEvent].function }
   
    //    @inlinable public convenience init(type: String, eventInitDict: StorageEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var key: String? {
jsObject[.key].fromJSValue()
    }
    
public var oldValue: String? {
jsObject[.oldValue].fromJSValue()
    }
    
public var newValue: String? {
jsObject[.newValue].fromJSValue()
    }
    
public var url: String {
jsObject[.url].fromJSValue()!
    }
    
public var storageArea: Storage? {
jsObject[.storageArea].fromJSValue()
    }
    
    @inlinable public func initStorageEvent(type: String, 
                                            bubbles: Bool? = nil,
                                            cancelable: Bool? = nil,
                                            key: String? = nil,
                                            oldValue: String? = nil,
                                            newValue: String? = nil,
                                            url: String? = nil,
                                            storageArea: Storage? = nil) {
        let this = jsObject
        _ = this[.initStorageEvent].function!(this: this, arguments: [_toJSValue(type), _toJSValue(bubbles), _toJSValue(cancelable), _toJSValue(key), _toJSValue(oldValue), _toJSValue(newValue), _toJSValue(url), _toJSValue(storageArea)])
    }
}

//public class StorageEventInit: BridgedDictionary {
//    public convenience init(key: String?, oldValue: String?, newValue: String?, url: String, storageArea: Storage?) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.key] = _toJSValue(key)
//        object[.oldValue] = _toJSValue(oldValue)
//        object[.newValue] = _toJSValue(newValue)
//        object[.url] = _toJSValue(url)
//        object[.storageArea] = _toJSValue(storageArea)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _key = ReadWriteAttribute(jsObject: object, name: .key)
//        _oldValue = ReadWriteAttribute(jsObject: object, name: .oldValue)
//        _newValue = ReadWriteAttribute(jsObject: object, name: .newValue)
//        _url = ReadWriteAttribute(jsObject: object, name: .url)
//        _storageArea = ReadWriteAttribute(jsObject: object, name: .storageArea)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var key: String?
//
//    @ReadWriteAttribute
//    public var oldValue: String?
//
//    @ReadWriteAttribute
//    public var newValue: String?
//
//    @ReadWriteAttribute
//    public var url: String
//
//    @ReadWriteAttribute
//    public var storageArea: Storage?
//}

public class SubmitEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.SubmitEvent].function }
    
   //    @inlinable public convenience init(type: String, eventInitDict: SubmitEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var submitter: HTMLElement? {
jsObject[.submitter].fromJSValue()
    }
}

//public class SubmitEventInit: BridgedDictionary {
//    public convenience init(submitter: HTMLElement?) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.submitter] = _toJSValue(submitter)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _submitter = ReadWriteAttribute(jsObject: object, name: .submitter)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var submitter: HTMLElement?
//}
public class ToggleEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.ToggleEvent].function }
    
    //    @inlinable public convenience init(type: String, eventInitDict: ToggleEventInit? = nil) {
    //        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    //    }
    
public var oldState: String {
jsObject[.oldState].fromJSValue()!
    }
    
public var newState: String {
jsObject[.newState].fromJSValue()!
    }
}

//public class ToggleEventInit: BridgedDictionary {
//    public convenience init(oldState: String, newState: String) {
//        let object = JSObject.global[.Object].function!.new()
//        object[.oldState] = _toJSValue(oldState)
//        object[.newState] = _toJSValue(newState)
//        self.init(unsafelyWrapping: object)
//    }
//
//    public required init(unsafelyWrapping object: JSObject) {
//        _oldState = ReadWriteAttribute(jsObject: object, name: .oldState)
//        _newState = ReadWriteAttribute(jsObject: object, name: .newState)
//        super.init(unsafelyWrapping: object)
//    }
//
//    @ReadWriteAttribute
//    public var oldState: String
//
//    @ReadWriteAttribute
//    public var newState: String
//}



public class TrackEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.TrackEvent].function }
    
public var track: AudioTrack_or_TextTrack_or_VideoTrack? {
jsObject[.track].fromJSValue()
    }
}

public enum AudioTrack_or_TextTrack_or_VideoTrack: JSValueCompatible  {
    case audioTrack(AudioTrack)
    case textTrack(TextTrack)
    case videoTrack(VideoTrack)

    public static func construct(from value: JSValue) -> Self? {
        if let audioTrack: AudioTrack = value.fromJSValue() {
            return .audioTrack(audioTrack)
        }
        if let textTrack: TextTrack = value.fromJSValue() {
            return .textTrack(textTrack)
        }
        if let videoTrack: VideoTrack = value.fromJSValue() {
            return .videoTrack(videoTrack)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .audioTrack(audioTrack):
            return audioTrack.jsValue
        case let .textTrack(textTrack):
            return textTrack.jsValue
        case let .videoTrack(videoTrack):
            return videoTrack.jsValue
        }
    }
}
