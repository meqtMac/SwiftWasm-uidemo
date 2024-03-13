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

public class MutationEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MutationEvent].function }

    public static let MODIFICATION: UInt16 = 1

    public static let ADDITION: UInt16 = 2

    public static let REMOVAL: UInt16 = 3

public var relatedNode: Node? {
jsObject[.relatedNode].fromJSValue()
    }

public var prevValue: String {
jsObject[.prevValue].fromJSValue()!
    }

public var newValue: String {
jsObject[.newValue].fromJSValue()!
    }

public var attrName: String {
jsObject[.attrName].fromJSValue()!
    }

public var attrChange: UInt16 {
jsObject[.attrChange].fromJSValue()!
    }

    @inlinable public func initMutationEvent(typeArg: String, bubblesArg: Bool? = nil, cancelableArg: Bool? = nil, relatedNodeArg: Node? = nil, prevValueArg: String? = nil, newValueArg: String? = nil, attrNameArg: String? = nil, attrChangeArg: UInt16? = nil) {
        let this = jsObject
        _ = this[.initMutationEvent].function!(this: this, arguments: [_toJSValue(typeArg), _toJSValue(bubblesArg), _toJSValue(cancelableArg), _toJSValue(relatedNodeArg), _toJSValue(prevValueArg), _toJSValue(newValueArg), _toJSValue(attrNameArg), _toJSValue(attrChangeArg)])
    }
}

public class MutationObserver: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.MutationObserver].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

    @inlinable public convenience init(callback: @escaping MutationCallback) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(callback)]))
    }

    @inlinable public func observe(target: Node, options: MutationObserverInit? = nil) {
        let this = jsObject
        _ = this[.observe].function!(this: this, arguments: [_toJSValue(target), _toJSValue(options)])
    }

    @inlinable public func disconnect() {
        let this = jsObject
        _ = this[.disconnect].function!(this: this, arguments: [])
    }

    @inlinable public func takeRecords() -> [MutationRecord] {
        let this = jsObject
        return this[.takeRecords].function!(this: this, arguments: []).fromJSValue()!
    }
}

public class MutationObserverInit: BridgedDictionary {
    public convenience init(childList: Bool, attributes: Bool, characterData: Bool, subtree: Bool, attributeOldValue: Bool, characterDataOldValue: Bool, attributeFilter: [String]) {
        let object = JSObject.global[.Object].function!.new()
        object[.childList] = _toJSValue(childList)
        object[.attributes] = _toJSValue(attributes)
        object[.characterData] = _toJSValue(characterData)
        object[.subtree] = _toJSValue(subtree)
        object[.attributeOldValue] = _toJSValue(attributeOldValue)
        object[.characterDataOldValue] = _toJSValue(characterDataOldValue)
        object[.attributeFilter] = _toJSValue(attributeFilter)
        self.init(unsafelyWrapping: object)
    }

    public var childList: Bool {
        get { jsObject[.childList].fromJSValue()!}
        set { jsObject[.childList] = newValue.jsValue }
    }

    public var attributes: Bool {
        get { jsObject[.attributes].fromJSValue()!}
        set { jsObject[.attributes] = newValue.jsValue }
    }

    public var characterData: Bool {
        get { jsObject[.characterData].fromJSValue()!}
        set { jsObject[.characterData] = newValue.jsValue }
    }

    public var subtree: Bool {
        get { jsObject[.subtree].fromJSValue()!}
        set { jsObject[.subtree] = newValue.jsValue }
    }

    public var attributeOldValue: Bool {
        get { jsObject[.attributeOldValue].fromJSValue()!}
        set { jsObject[.attributeOldValue] = newValue.jsValue }
    }

    public var characterDataOldValue: Bool {
        get { jsObject[.characterDataOldValue].fromJSValue()!}
        set { jsObject[.characterDataOldValue] = newValue.jsValue }
    }

    public var attributeFilter: [String] {
        get { jsObject[.attributeFilter].fromJSValue()!}
        set { jsObject[.attributeFilter] = newValue.jsValue }
    }
}

public class MutationRecord: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.MutationRecord].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
       self.jsObject = jsObject
    }

public var type: String {
jsObject[.type].fromJSValue()!
    }

public var target: Node {
jsObject[.target].fromJSValue()!
    }

public var addedNodes: NodeList {
jsObject[.addedNodes].fromJSValue()!
    }

public var removedNodes: NodeList {
jsObject[.removedNodes].fromJSValue()!
    }

public var previousSibling: Node? {
jsObject[.previousSibling].fromJSValue()
    }

public var nextSibling: Node? {
jsObject[.nextSibling].fromJSValue()
    }

public var attributeName: String? {
jsObject[.attributeName].fromJSValue()
    }

public var attributeNamespace: String? {
jsObject[.attributeNamespace].fromJSValue()
    }

public var oldValue: String? {
jsObject[.oldValue].fromJSValue()
    }
}


