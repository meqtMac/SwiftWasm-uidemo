//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/13.
//

import Foundation
import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

public class Document: Node, 
                        NonElementParentNode,
                       DocumentOrShadowRoot,
                       ParentNode,
                       XPathEvaluatorBase,
                       GlobalEventHandlers,
                       GeometryUtils {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.Document].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        _onreadystatechange = ClosureAttribute1Optional(jsObject: jsObject, name: .onreadystatechange)
        _onvisibilitychange = ClosureAttribute1Optional(jsObject: jsObject, name: .onvisibilitychange)
        super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }
    
    public var implementation: DOMImplementation {
        jsObject[.implementation].fromJSValue()!
    }
    
    public var URL: String {
        jsObject[.URL].fromJSValue()!
    }
    
    public var documentURI: String {
        jsObject[.documentURI].fromJSValue()!
    }
    
    public var compatMode: String {
        jsObject[.compatMode].fromJSValue()!
    }
    
    public var characterSet: String {
        jsObject[.characterSet].fromJSValue()!
    }
    
    public var charset: String {
        jsObject[.charset].fromJSValue()!
    }
    
    public var inputEncoding: String {
        jsObject[.inputEncoding].fromJSValue()!
    }
    
    public var contentType: String {
        jsObject[.contentType].fromJSValue()!
    }
    
    public var doctype: DocumentType? {
        jsObject[.doctype].fromJSValue()
    }
    
    public var documentElement: Element? {
        jsObject[.documentElement].fromJSValue()
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
    
    @inlinable public func createElement(localName: String, options: ElementCreationOptions_or_String? = nil) -> Element {
        let this = jsObject
        return this[.createElement].function!(this: this, arguments: [_toJSValue(localName), _toJSValue(options)]).fromJSValue()!
    }
    
    @inlinable public func createElementNS(namespace: String?, qualifiedName: String, options: ElementCreationOptions_or_String? = nil) -> Element {
        let this = jsObject
        return this[.createElementNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(qualifiedName), _toJSValue(options)]).fromJSValue()!
    }
    
    @inlinable public func createDocumentFragment() -> DocumentFragment {
        let this = jsObject
        return this[.createDocumentFragment].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func createTextNode(data: String) -> Text {
        let this = jsObject
        return this[.createTextNode].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()!
    }
    
    @inlinable public func createCDATASection(data: String) -> CDATASection {
        let this = jsObject
        return this[.createCDATASection].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()!
    }
    
    @inlinable public func createComment(data: String) -> Comment {
        let this = jsObject
        return this[.createComment].function!(this: this, arguments: [_toJSValue(data)]).fromJSValue()!
    }
    
    @inlinable public func createProcessingInstruction(target: String, data: String) -> ProcessingInstruction {
        let this = jsObject
        return this[.createProcessingInstruction].function!(this: this, arguments: [_toJSValue(target), _toJSValue(data)]).fromJSValue()!
    }
    
    @inlinable public func importNode(node: Node, deep: Bool? = nil) -> Node {
        let this = jsObject
        return this[.importNode].function!(this: this, arguments: [_toJSValue(node), _toJSValue(deep)]).fromJSValue()!
    }
    
    @inlinable public func adoptNode(node: Node) -> Node {
        let this = jsObject
        return this[.adoptNode].function!(this: this, arguments: [_toJSValue(node)]).fromJSValue()!
    }
    
    @inlinable public func createAttribute(localName: String) -> Attr {
        let this = jsObject
        return this[.createAttribute].function!(this: this, arguments: [_toJSValue(localName)]).fromJSValue()!
    }
    
    @inlinable public func createAttributeNS(namespace: String?, qualifiedName: String) -> Attr {
        let this = jsObject
        return this[.createAttributeNS].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(qualifiedName)]).fromJSValue()!
    }
    
    @inlinable public func createEvent(interface: String) -> Event {
        let this = jsObject
        return this[.createEvent].function!(this: this, arguments: [_toJSValue(interface)]).fromJSValue()!
    }
    
    @inlinable public func createRange() -> Range {
        let this = jsObject
        return this[.createRange].function!(this: this, arguments: []).fromJSValue()!
    }
    
    // XXX: member 'createNodeIterator' is ignored
    
    // XXX: member 'createTreeWalker' is ignored
    
    public var location: Location? {
        jsObject[.location].fromJSValue()
    }
    
    public var domain: String {
        get { jsObject[.domain].fromJSValue()!}
        set { jsObject[.domain] = newValue.jsValue }
    }
    
    public var referrer: String {
        jsObject[.referrer].fromJSValue()!
    }
    
    public var cookie: String {
        get { jsObject[.cookie].fromJSValue()!}
        set { jsObject[.cookie] = newValue.jsValue }
    }
    
    public var lastModified: String {
        jsObject[.lastModified].fromJSValue()!
    }
    
    public var readyState: DocumentReadyState {
        jsObject[.readyState].fromJSValue()!
    }
    
    @inlinable public subscript(key: String) -> JSObject {
        jsObject[key].fromJSValue()!
    }
    
    public var title: String {
        get { jsObject[.title].fromJSValue()!}
        set { jsObject[.title] = newValue.jsValue }
    }
    
    public var dir: String {
        get { jsObject[.dir].fromJSValue()!}
        set { jsObject[.dir] = newValue.jsValue }
    }
    
    public var body: HTMLElement? {
        get { jsObject[.body].fromJSValue()}
        set { jsObject[.body] = newValue.jsValue }
    }
    
    public var head: HTMLHeadElement? {
        jsObject[.head].fromJSValue()
    }
    
    public var images: HTMLCollection {
        jsObject[.images].fromJSValue()!
    }
    
    public var embeds: HTMLCollection {
        jsObject[.embeds].fromJSValue()!
    }
    
    public var plugins: HTMLCollection {
        jsObject[.plugins].fromJSValue()!
    }
    
    public var links: HTMLCollection {
        jsObject[.links].fromJSValue()!
    }
    
    public var forms: HTMLCollection {
        jsObject[.forms].fromJSValue()!
    }
    
    public var scripts: HTMLCollection {
        jsObject[.scripts].fromJSValue()!
    }
    
    @inlinable public func getElementsByName(elementName: String) -> NodeList {
        let this = jsObject
        return this[.getElementsByName].function!(this: this, arguments: [_toJSValue(elementName)]).fromJSValue()!
    }
    
    public var currentScript: HTMLOrSVGScriptElement? {
        jsObject[.currentScript].fromJSValue()
    }
    
    @inlinable public func open(unused1: String? = nil, unused2: String? = nil) -> Self {
        let this = jsObject
        return this[.open].function!(this: this, arguments: [_toJSValue(unused1), _toJSValue(unused2)]).fromJSValue()!
    }
    
    @inlinable public func open(url: String, name: String, features: String) -> WindowProxy? {
        let this = jsObject
        return this[.open].function!(this: this, arguments: [_toJSValue(url), _toJSValue(name), _toJSValue(features)]).fromJSValue()
    }
    
    @inlinable public func close() {
        let this = jsObject
        _ = this[.close].function!(this: this, arguments: [])
    }
    
    @inlinable public func write(text: String...) {
        let this = jsObject
        _ = this[.write].function!(this: this, arguments: text.map(_toJSValue))
    }
    
    @inlinable public func writeln(text: String...) {
        let this = jsObject
        _ = this[.writeln].function!(this: this, arguments: text.map(_toJSValue))
    }
    
    public var defaultView: WindowProxy? {
        jsObject[.defaultView].fromJSValue()
    }
    
    @inlinable public func hasFocus() -> Bool {
        let this = jsObject
        return this[.hasFocus].function!(this: this, arguments: []).fromJSValue()!
    }
    
    public var designMode: String {
        get { jsObject[.designMode].fromJSValue()!}
        set { jsObject[.designMode] = newValue.jsValue }
    }
    
    @inlinable public func execCommand(commandId: String, showUI: Bool? = nil, value: String? = nil) -> Bool {
        let this = jsObject
        return this[.execCommand].function!(this: this, arguments: [_toJSValue(commandId), _toJSValue(showUI), _toJSValue(value)]).fromJSValue()!
    }
    
    @inlinable public func queryCommandEnabled(commandId: String) -> Bool {
        let this = jsObject
        return this[.queryCommandEnabled].function!(this: this, arguments: [_toJSValue(commandId)]).fromJSValue()!
    }
    
    @inlinable public func queryCommandIndeterm(commandId: String) -> Bool {
        let this = jsObject
        return this[.queryCommandIndeterm].function!(this: this, arguments: [_toJSValue(commandId)]).fromJSValue()!
    }
    
    @inlinable public func queryCommandState(commandId: String) -> Bool {
        let this = jsObject
        return this[.queryCommandState].function!(this: this, arguments: [_toJSValue(commandId)]).fromJSValue()!
    }
    
    @inlinable public func queryCommandSupported(commandId: String) -> Bool {
        let this = jsObject
        return this[.queryCommandSupported].function!(this: this, arguments: [_toJSValue(commandId)]).fromJSValue()!
    }
    
    @inlinable public func queryCommandValue(commandId: String) -> String {
        let this = jsObject
        return this[.queryCommandValue].function!(this: this, arguments: [_toJSValue(commandId)]).fromJSValue()!
    }
    
    public var hidden: Bool {
        jsObject[.hidden].fromJSValue()!
    }
    
    public var visibilityState: DocumentVisibilityState {
        jsObject[.visibilityState].fromJSValue()!
    }
    
    @ClosureAttribute1Optional
    public var onreadystatechange: EventHandler
    
    @ClosureAttribute1Optional
    public var onvisibilitychange: EventHandler
    
    public var fgColor: String {
        get { jsObject[.fgColor].fromJSValue()!}
        set { jsObject[.fgColor] = newValue.jsValue }
    }
    
    public var linkColor: String {
        get { jsObject[.linkColor].fromJSValue()!}
        set { jsObject[.linkColor] = newValue.jsValue }
    }
    
    public var vlinkColor: String {
        get { jsObject[.vlinkColor].fromJSValue()!}
        set { jsObject[.vlinkColor] = newValue.jsValue }
    }
    
    public var alinkColor: String {
        get { jsObject[.alinkColor].fromJSValue()!}
        set { jsObject[.alinkColor] = newValue.jsValue }
    }
    
    public var bgColor: String {
        get { jsObject[.bgColor].fromJSValue()!}
        set { jsObject[.bgColor] = newValue.jsValue }
    }
    
    public var anchors: HTMLCollection {
        jsObject[.anchors].fromJSValue()!
    }
    
    public var applets: HTMLCollection {
        jsObject[.applets].fromJSValue()!
    }
    
    @inlinable public func clear() {
        let this = jsObject
        _ = this[.clear].function!(this: this, arguments: [])
    }
    
    @inlinable public func captureEvents() {
        let this = jsObject
        _ = this[.captureEvents].function!(this: this, arguments: [])
    }
    
    @inlinable public func releaseEvents() {
        let this = jsObject
        _ = this[.releaseEvents].function!(this: this, arguments: [])
    }
    
    public var all: HTMLAllCollection {
        jsObject[.all].fromJSValue()!
    }
    
    @inlinable public func elementFromPoint(x: Double, y: Double) -> Element? {
        let this = jsObject
        return this[.elementFromPoint].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)]).fromJSValue()
    }
    
    @inlinable public func elementsFromPoint(x: Double, y: Double) -> [Element] {
        let this = jsObject
        return this[.elementsFromPoint].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)]).fromJSValue()!
    }
    
    @inlinable public func caretPositionFromPoint(x: Double, y: Double) -> CaretPosition? {
        let this = jsObject
        return this[.caretPositionFromPoint].function!(this: this, arguments: [_toJSValue(x), _toJSValue(y)]).fromJSValue()
    }
    
    public var scrollingElement: Element? {
        jsObject[.scrollingElement].fromJSValue()
    }
}

open class DocumentFragment: Node, NonElementParentNode, ParentNode {
    @inlinable override open class var constructor: JSFunction? { JSObject.global[.DocumentFragment].function }
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }
    
    @inlinable public convenience init() {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: []))
    }
}

public protocol DocumentOrShadowRoot: JSBridgedClass {}
public extension DocumentOrShadowRoot {
    @inlinable var activeElement: Element? { jsObject[.activeElement].fromJSValue() }
}

public enum DocumentReadyState: JSString, JSValueCompatible {
    case loading = "loading"
    case interactive = "interactive"
    case complete = "complete"
    
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

public class DocumentType: Node, ChildNode {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.DocumentType].function }
    
    public var name: String {
        jsObject[.name].fromJSValue()!
    }
    
    public var publicId: String {
        jsObject[.publicId].fromJSValue()!
    }
    
    public var systemId: String {
        jsObject[.systemId].fromJSValue()!
    }
}

public enum DocumentVisibilityState: JSString, JSValueCompatible {
    case visible = "visible"
    case hidden = "hidden"
    
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

public class DOMImplementation: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.DOMImplementation].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public func createDocumentType(qualifiedName: String, publicId: String, systemId: String) -> DocumentType {
        let this = jsObject
        return this[.createDocumentType].function!(this: this, arguments: [_toJSValue(qualifiedName), _toJSValue(publicId), _toJSValue(systemId)]).fromJSValue()!
    }
    
    @inlinable public func createDocument(namespace: String?, qualifiedName: String, doctype: DocumentType? = nil) -> XMLDocument {
        let this = jsObject
        return this[.createDocument].function!(this: this, arguments: [_toJSValue(namespace), _toJSValue(qualifiedName), _toJSValue(doctype)]).fromJSValue()!
    }
    
    @inlinable public func createHTMLDocument(title: String? = nil) -> Document {
        let this = jsObject
        return this[.createHTMLDocument].function!(this: this, arguments: [_toJSValue(title)]).fromJSValue()!
    }
    
    @inlinable public func hasFeature() -> Bool {
        let this = jsObject
        return this[.hasFeature].function!(this: this, arguments: []).fromJSValue()!
    }
}

extension Document {
    public enum ElementCreationOptions_or_String: JSValueCompatible {
        public class ElementCreationOptions: BridgedDictionary {
            public convenience init(is: String) {
                let object = JSObject.global[.Object].function!.new()
                object[.is] = _toJSValue(`is`)
                self.init(unsafelyWrapping: object)
            }
            
           public var `is`: String {
                get { jsObject[.is].fromJSValue()! }
                set { jsObject[.is] = newValue.jsValue }
            }
        }
        case elementCreationOptions(ElementCreationOptions)
        case string(String)
        
        public static func construct(from value: JSValue) -> Self? {
            if let elementCreationOptions: ElementCreationOptions = value.fromJSValue() {
                return .elementCreationOptions(elementCreationOptions)
            }
            if let string: String = value.fromJSValue() {
                return .string(string)
            }
            return nil
        }
        
        public var jsValue: JSValue {
            switch self {
            case let .elementCreationOptions(elementCreationOptions):
                return elementCreationOptions.jsValue
            case let .string(string):
                return string.jsValue
            }
        }
    }
}
