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


open class Element: Node,
                        ParentNode,
                        NonDocumentTypeChildNode,
                        ChildNode,
                        Slottable,
                        ARIAMixin,
                        GeometryUtils {
    @inlinable override open class var constructor: JSFunction? { JSObject.global[.Element].function }

    public var namespaceURI: String? {
        jsObject[.namespaceURI].fromJSValue()
    }

    public var prefix: String? {
         jsObject[.prefix].fromJSValue()
    }

    public var localName: String {
        jsObject[.localName].fromJSValue()!
    }

    public var tagName: String {
        jsObject[.tagName].fromJSValue()!
    }

    public var id: String {
        get { jsObject[.id].fromJSValue()! }
        set { jsObject[.id] = newValue.jsValue }
    }

    public var className: String {
        get { jsObject[.className].fromJSValue()! }
        set { jsObject[.className] = newValue.jsValue }
    }

    public var classList: DOMTokenList {
        get { jsObject[.classList].fromJSValue()! }
        set { jsObject[.classList] = newValue.jsValue }
    }

    public var slot: String {
        get { jsObject[.slot].fromJSValue()!}
        set { jsObject[.slot] = newValue.jsValue }
    }

    @inlinable public func hasAttributes() -> Bool {
        let this = jsObject
        return this[.hasAttributes].function!(this: this, arguments: []).fromJSValue()!
    }

    public var attributes: NamedNodeMap {
        jsObject[.attributes].fromJSValue()!
    }

    @inlinable public func getAttributeNames() -> [String] {
        let this = jsObject
        return this[.getAttributeNames].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func getAttribute(qualifiedName: String) -> String? {
        let this = jsObject
        return this[.getAttribute].function!(this: this, arguments: [_toJSValue(qualifiedName)]).fromJSValue()
    }

    @inlinable public func getAttributeNS(namespace: String?, localName: String) -> String? {
        let this = jsObject
        return this[.getAttributeNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)]).fromJSValue()
    }

    @inlinable public func setAttribute(qualifiedName: String, value: String) {
        let this = jsObject
        _ = this[.setAttribute].function!(this: this, arguments: [_toJSValue(qualifiedName), _toJSValue(value)])
    }

    @inlinable public func setAttributeNS(namespace: String?, qualifiedName: String, value: String) {
        let this = jsObject
        _ = this[.setAttributeNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(qualifiedName), _toJSValue(value)])
    }

    @inlinable public func removeAttribute(qualifiedName: String) {
        let this = jsObject
        _ = this[.removeAttribute].function!(this: this, arguments: [_toJSValue(qualifiedName)])
    }

    @inlinable public func removeAttributeNS(namespace: String?, localName: String) {
        let this = jsObject
        _ = this[.removeAttributeNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)])
    }

    @inlinable public func toggleAttribute(qualifiedName: String, force: Bool? = nil) -> Bool {
        let this = jsObject
        return this[.toggleAttribute].function!(this: this, arguments: [_toJSValue(qualifiedName), _toJSValue(force)]).fromJSValue()!
    }

    @inlinable public func hasAttribute(qualifiedName: String) -> Bool {
        let this = jsObject
        return this[.hasAttribute].function!(this: this, arguments: [_toJSValue(qualifiedName)]).fromJSValue()!
    }

    @inlinable public func hasAttributeNS(namespace: String?, localName: String) -> Bool {
        let this = jsObject
        return this[.hasAttributeNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)]).fromJSValue()!
    }

    @inlinable public func getAttributeNode(qualifiedName: String) -> Attr? {
        let this = jsObject
        return this[.getAttributeNode].function!(this: this, arguments: [_toJSValue(qualifiedName)]).fromJSValue()
    }

    @inlinable public func getAttributeNodeNS(namespace: String?, localName: String) -> Attr? {
        let this = jsObject
        return this[.getAttributeNodeNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)]).fromJSValue()
    }

    @inlinable public func setAttributeNode(attr: Attr) -> Attr? {
        let this = jsObject
        return this[.setAttributeNode].function!(this: this, arguments: [_toJSValue(attr)]).fromJSValue()
    }

    @inlinable public func setAttributeNodeNS(attr: Attr) -> Attr? {
        let this = jsObject
        return this[.setAttributeNodeNS].function!(this: this, arguments: [_toJSValue(attr)]).fromJSValue()
    }

    @inlinable public func removeAttributeNode(attr: Attr) -> Attr {
        let this = jsObject
        return this[.removeAttributeNode].function!(this: this, arguments: [_toJSValue(attr)]).fromJSValue()!
    }

    @inlinable public func attachShadow(init: ShadowRootInit) -> ShadowRoot {
        let this = jsObject
        return this[.attachShadow].function!(this: this, arguments: [_toJSValue(`init`)]).fromJSValue()!
    }

    public var shadowRoot: ShadowRoot? {
        jsObject[.shadowRoot].fromJSValue()
    }

    @inlinable public func closest(selectors: String) -> Element? {
        let this = jsObject
        return this[.closest].function!(this: this, arguments: [_toJSValue(selectors)]).fromJSValue()
    }

    @inlinable public func matches(selectors: String) -> Bool {
        let this = jsObject
        return this[.matches].function!(this: this, arguments: [_toJSValue(selectors)]).fromJSValue()!
    }

    @inlinable public func webkitMatchesSelector(selectors: String) -> Bool {
        let this = jsObject
        return this[.webkitMatchesSelector].function!(this: this, arguments: [_toJSValue(selectors)]).fromJSValue()!
    }

    @inlinable public func getElementsByTagName(qualifiedName: String) -> HTMLCollection {
        let this = jsObject
        return this[.getElementsByTagName].function!(this: this, arguments: [_toJSValue(qualifiedName)]).fromJSValue()!
    }

    @inlinable public func getElementsByTagNameNS(namespace: String?, localName: String) -> HTMLCollection {
        let this = jsObject
        return this[.getElementsByTagNameNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)]).fromJSValue()!
    }

    @inlinable public func getElementsByClassName(classNames: String) -> HTMLCollection {
        let this = jsObject
        return this[.getElementsByClassName].function!(this: this, arguments: [_toJSValue(classNames)]).fromJSValue()!
    }

    @inlinable public func insertAdjacentElement(where: String, element: Element) -> Element? {
        let this = jsObject
        return this[.insertAdjacentElement].function!(this: this, arguments: [_toJSValue(`where`), _toJSValue(element)]).fromJSValue()
    }

    @inlinable public func insertAdjacentText(where: String, data: String) {
        let this = jsObject
        _ = this[.insertAdjacentText].function!(this: this, arguments: [_toJSValue(`where`), _toJSValue(data)])
    }

    @inlinable public func pseudo(type: String) -> CSSPseudoElement? {
        let this = jsObject
        return this[.pseudo].function!(this: this, arguments: [_toJSValue(type)]).fromJSValue()
    }

    @inlinable public func getClientRects() -> DOMRectList {
        let this = jsObject
        return this[.getClientRects].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func getBoundingClientRect() -> DOMRect {
        let this = jsObject
        return this[.getBoundingClientRect].function!(this: this, arguments: []).fromJSValue()!
    }

    @inlinable public func checkVisibility(options: CheckVisibilityOptions? = nil) -> Bool {
        let this = jsObject
        return this[.checkVisibility].function!(this: this, arguments: [_toJSValue(options)]).fromJSValue()!
    }

    @inlinable public func scrollIntoView(arg: Bool) {
        let this = jsObject
        _ = this[.scrollIntoView].function!(this: this, arguments: [_toJSValue(arg)])
    }
    
        @inlinable public func scrollIntoView(arg: ScrollIntoViewOptions? = nil) {
        let this = jsObject
        _ = this[.scrollIntoView].function!(this: this, arguments: [_toJSValue(arg)])
    }



    @inlinable public func scroll(options: ScrollToOptions? = nil) {
        let this = jsObject
        _ = this[.scroll].function!(this: this, arguments: [_toJSValue(options)])
    }

    @inlinable public func scroll(x: Double, y: Double) {
        let this = jsObject
        _ = this[.scroll].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable public func scrollTo(options: ScrollToOptions? = nil) {
        let this = jsObject
        _ = this[.scrollTo].function!(this: this, arguments: [_toJSValue(options)])
    }

    @inlinable public func scrollTo(x: Double, y: Double) {
        let this = jsObject
        _ = this[.scrollTo].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    @inlinable public func scrollBy(options: ScrollToOptions? = nil) {
        let this = jsObject
        _ = this[.scrollBy].function!(this: this, arguments: [_toJSValue(options)])
    }

    @inlinable public func scrollBy(x: Double, y: Double) {
        let this = jsObject
        _ = this[.scrollBy].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)])
    }

    public var scrollTop: Double {
        get { jsObject[.scrollTop].fromJSValue()!}
        set { jsObject[.scrollTop] = newValue.jsValue }
    }

    public var scrollLeft: Double {
        get { jsObject[.scrollLeft].fromJSValue()!}
        set { jsObject[.scrollLeft] = newValue.jsValue }
 
    }

    public var scrollWidth: Int32 {
        jsObject[.scrollWidth].fromJSValue()!
 
    }

    public var scrollHeight: Int32 {
        jsObject[.scrollHeight].fromJSValue()!
 
    }

    public var clientTop: Int32 {
        jsObject[.clientTop].fromJSValue()!
    }

    public var clientLeft: Int32 {
        jsObject[.clientLeft].fromJSValue()!
    }

    public var clientWidth: Int32 {
        jsObject[.clientWidth].fromJSValue()!
    }

    public var clientHeight: Int32 {
        jsObject[.clientHeight].fromJSValue()!
    }
}

public class NamedNodeMap: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.NamedNodeMap].function }

    public let jsObject: JSObject

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }

public var length: UInt32 {
jsObject[.length].fromJSValue()!
    }

    @inlinable public subscript(key: Int) -> Attr? {
        jsObject[key].fromJSValue()
    }

    @inlinable public func item(index: UInt32) -> Attr? {
        let this = jsObject
        return this[.item].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()
    }

    @inlinable public subscript(key: String) -> Attr? {
        jsObject[key].fromJSValue()
    }

    @inlinable public func getNamedItem(qualifiedName: String) -> Attr? {
        let this = jsObject
        return this[.getNamedItem].function!(this: this, arguments: [_toJSValue(qualifiedName)]).fromJSValue()
    }

    @inlinable public func getNamedItemNS(namespace: String?, localName: String) -> Attr? {
        let this = jsObject
        return this[.getNamedItemNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)]).fromJSValue()
    }

    @inlinable public func setNamedItem(attr: Attr) -> Attr? {
        let this = jsObject
        return this[.setNamedItem].function!(this: this, arguments: [_toJSValue(attr)]).fromJSValue()
    }

    @inlinable public func setNamedItemNS(attr: Attr) -> Attr? {
        let this = jsObject
        return this[.setNamedItemNS].function!(this: this, arguments: [_toJSValue(attr)]).fromJSValue()
    }

    @inlinable public func removeNamedItem(qualifiedName: String) -> Attr {
        let this = jsObject
        return this[.removeNamedItem].function!(this: this, arguments: [_toJSValue(qualifiedName)]).fromJSValue()!
    }

    @inlinable public func removeNamedItemNS(namespace: String?, localName: String) -> Attr {
        let this = jsObject
        return this[.removeNamedItemNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(localName)]).fromJSValue()!
    }
}

