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

public class XMLDocument: Document {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.XMLDocument].function }
}

public class XMLHttpRequest: XMLHttpRequestEventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.XMLHttpRequest].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _onreadystatechange = ClosureAttribute1Optional(jsObject: jsObject, name: .onreadystatechange)
       super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }

    @ClosureAttribute1Optional
    public var onreadystatechange: EventHandler

    public static let UNSENT: UInt16 = 0

    public static let OPENED: UInt16 = 1

    public static let HEADERS_RECEIVED: UInt16 = 2

    public static let LOADING: UInt16 = 3

    public static let DONE: UInt16 = 4

public var readyState: UInt16 {
jsObject[.readyState].fromJSValue()!
    }

    @inlinable public func open(method: String, url: String) {
        let this = jsObject
        _ = this[.open].function!(this: this, arguments: [_toJSValue(method), _toJSValue(url)])
    }

    @inlinable public func open(method: String, url: String, async: Bool, username: String? = nil, password: String? = nil) {
        let this = jsObject
        _ = this[.open].function!(this: this, arguments: [_toJSValue(method), _toJSValue(url), _toJSValue(async), _toJSValue(username), _toJSValue(password)])
    }

    @inlinable public func setRequestHeader(name: String, value: String) {
        let this = jsObject
        _ = this[.setRequestHeader].function!(this: this, arguments: [_toJSValue(name), _toJSValue(value)])
    }

    public var timeout: UInt32 {
        get { jsObject[.timeout].fromJSValue()!}
        set { jsObject[.timeout] = newValue.jsValue }
    }

    public var withCredentials: Bool {
        get { jsObject[.withCredentials].fromJSValue()!}
        set { jsObject[.withCredentials] = newValue.jsValue }
    }

public var upload: XMLHttpRequestUpload {
jsObject[.upload].fromJSValue()!
    }

   @inlinable public func send(body: Document? = nil) {
        let this = jsObject
        _ = this[.send].function!(this: this, arguments: [_toJSValue(body)])
    }
    
    @inlinable public func send(body: Blob? = nil) {
        _ = jsObject[.send].function!(this: jsObject, arguments: [_toJSValue(body)])
    }
    @inlinable public func send(body: BufferSource? = nil) {
        _ = jsObject[.send].function!(this: jsObject, arguments: [_toJSValue(body)])
    }
    @inlinable public func send(body: FormData? = nil) {
        _ = jsObject[.send].function!(this: jsObject, arguments: [_toJSValue(body)])
    }
    @inlinable public func send(body: String? = nil) {
        _ = jsObject[.send].function!(this: jsObject, arguments: [_toJSValue(body)])
    }
    @inlinable public func send(body: URLSearchParams? = nil) {
        _ = jsObject[.send].function!(this: jsObject, arguments: [_toJSValue(body)])
    }






    @inlinable public func abort() {
        let this = jsObject
        _ = this[.abort].function!(this: this, arguments: [])
    }

public var responseURL: String {
jsObject[.responseURL].fromJSValue()!
    }

public var status: UInt16 {
jsObject[.status].fromJSValue()!
    }

public var statusText: String {
jsObject[.statusText].fromJSValue()!
    }

    @inlinable public func getResponseHeader(name: String) -> String? {
        let this = jsObject
        return this[.getResponseHeader].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()
    }

    @inlinable public func getAllResponseHeaders() -> String {
        let this = jsObject
        return this[.getAllResponseHeaders].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func overrideMimeType(mime: String) {
        let this = jsObject
        _ = this[.overrideMimeType].function!(this: this, arguments: [_toJSValue(mime)])
    }

    public var responseType: XMLHttpRequestResponseType {
        get { jsObject[.responseType].fromJSValue()!}
        set { jsObject[.responseType] = newValue.jsValue }
    }

public var response: JSValue {
jsObject[.response].fromJSValue()!
    }

public var responseText: String {
jsObject[.responseText].fromJSValue()!
    }

public var responseXML: Document? {
jsObject[.responseXML].fromJSValue()
    }
}

public class XMLHttpRequestEventTarget: EventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.XMLHttpRequestEventTarget].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        _onloadstart = ClosureAttribute1Optional(jsObject: jsObject, name: .onloadstart)
        _onprogress = ClosureAttribute1Optional(jsObject: jsObject, name: .onprogress)
        _onabort = ClosureAttribute1Optional(jsObject: jsObject, name: .onabort)
        _onerror = ClosureAttribute1Optional(jsObject: jsObject, name: .onerror)
        _onload = ClosureAttribute1Optional(jsObject: jsObject, name: .onload)
        _ontimeout = ClosureAttribute1Optional(jsObject: jsObject, name: .ontimeout)
        _onloadend = ClosureAttribute1Optional(jsObject: jsObject, name: .onloadend)
        super.init(unsafelyWrapping: jsObject)
    }

    @ClosureAttribute1Optional
    public var onloadstart: EventHandler

    @ClosureAttribute1Optional
    public var onprogress: EventHandler

    @ClosureAttribute1Optional
    public var onabort: EventHandler

    @ClosureAttribute1Optional
    public var onerror: EventHandler

    @ClosureAttribute1Optional
    public var onload: EventHandler

    @ClosureAttribute1Optional
    public var ontimeout: EventHandler

    @ClosureAttribute1Optional
    public var onloadend: EventHandler
}

public enum XMLHttpRequestResponseType: JSString, JSValueCompatible {
    case _empty = ""
    case arraybuffer = "arraybuffer"
    case blob = "blob"
    case document = "document"
    case json = "json"
    case text = "text"

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

public class XMLHttpRequestUpload: XMLHttpRequestEventTarget {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.XMLHttpRequestUpload].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
}

public class XPathEvaluator: JSBridgedClass, XPathEvaluatorBase {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.XPathEvaluator].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }
}

public protocol XPathEvaluatorBase: JSBridgedClass {}
public extension XPathEvaluatorBase {
    // XXX: method 'createExpression' is ignored

    // XXX: method 'createNSResolver' is ignored

    // XXX: method 'evaluate' is ignored
}

public class XPathExpression: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.XPathExpression].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public func evaluate(contextNode: Node, type: UInt16? = nil, result: XPathResult? = nil) -> XPathResult {
        let this = jsObject
        return this[.evaluate].function!(this: this, arguments: [_toJSValue(contextNode), _toJSValue(type), _toJSValue(result)]).fromJSValue()!
    }
}

public class XPathResult: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.XPathResult].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
       self.jsObject = jsObject
    }

    public static let ANY_TYPE: UInt16 = 0

    public static let NUMBER_TYPE: UInt16 = 1

    public static let STRING_TYPE: UInt16 = 2

    public static let BOOLEAN_TYPE: UInt16 = 3

    public static let UNORDERED_NODE_ITERATOR_TYPE: UInt16 = 4

    public static let ORDERED_NODE_ITERATOR_TYPE: UInt16 = 5

    public static let UNORDERED_NODE_SNAPSHOT_TYPE: UInt16 = 6

    public static let ORDERED_NODE_SNAPSHOT_TYPE: UInt16 = 7

    public static let ANY_UNORDERED_NODE_TYPE: UInt16 = 8

    public static let FIRST_ORDERED_NODE_TYPE: UInt16 = 9

public var resultType: UInt16 {
jsObject[.resultType].fromJSValue()!
    }

public var numberValue: Double {
jsObject[.numberValue].fromJSValue()!
    }

public var stringValue: String {
jsObject[.stringValue].fromJSValue()!
    }

public var booleanValue: Bool {
jsObject[.booleanValue].fromJSValue()!
    }

public var singleNodeValue: Node? {
jsObject[.singleNodeValue].fromJSValue()
    }

public var invalidIteratorState: Bool {
jsObject[.invalidIteratorState].fromJSValue()!
    }

public var snapshotLength: UInt32 {
jsObject[.snapshotLength].fromJSValue()!
    }

    @inlinable public func iterateNext() -> Node? {
        let this = jsObject
        return this[.iterateNext].function!(this: this, arguments: []).fromJSValue()
    }

    @inlinable public func snapshotItem(index: UInt32) -> Node? {
        let this = jsObject
        return this[.snapshotItem].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }
}


public enum XMLHttpRequestBodyInit: JSValueCompatible {
    case blob(Blob)
    case bufferSource(BufferSource)
    case formData(FormData)
    case string(String)
    case urlSearchParams(URLSearchParams)
    public static func construct(from value: JSValue) -> Self? {
        if let blob: Blob = value.fromJSValue() {
            return .blob(blob)
        }
        if let bufferSource: BufferSource = value.fromJSValue() {
            return .bufferSource(bufferSource)
        }
        if let formData: FormData = value.fromJSValue() {
            return .formData(formData)
        }
       if let string: String = value.fromJSValue() {
            return .string(string)
        }
        if let urlSearchParams: URLSearchParams = value.fromJSValue() {
            return .urlSearchParams(urlSearchParams)
        }
        return nil
    }

    public var jsValue: JSValue {
        switch self {
        case let .blob(blob):
            return blob.jsValue
        case let .bufferSource(bufferSource):
            return bufferSource.jsValue
        case let .formData(formData):
            return formData.jsValue
        case let .string(string):
            return string.jsValue
        case let .urlSearchParams(urlSearchParams):
            return urlSearchParams.jsValue
        }
    }


}
