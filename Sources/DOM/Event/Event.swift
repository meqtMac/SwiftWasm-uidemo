//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/13.
//

import ECMAScript
import JavaScriptBigIntSupport
import JavaScriptEventLoop
import JavaScriptKit
import WebAPIBase

open class Event: JSBridgedClass {
    @inlinable open class var constructor: JSFunction? { JSObject.global[.Event].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public convenience init(type: String, eventInitDict: EventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public var type: String {
        jsObject[.type].fromJSValue()!
    }
    
    public var target: EventTarget? {
        jsObject[.target].fromJSValue()
    }
    
    public var srcElement: EventTarget? {
        jsObject[.srcElement].fromJSValue()
    }
    
    public var currentTarget: EventTarget? {
        jsObject[.currentTarget].fromJSValue()
    }
    
    @inlinable public func composedPath() -> [EventTarget] {
        let this = jsObject
        return this[.composedPath].function!(this: this, arguments: []).fromJSValue()!
    }
    
    public static let NONE: UInt16 = 0
    
    public static let CAPTURING_PHASE: UInt16 = 1
    
    public static let AT_TARGET: UInt16 = 2
    
    public static let BUBBLING_PHASE: UInt16 = 3
    
    public var eventPhase: UInt16 {
        jsObject[.eventPhase].fromJSValue()!
    }
    
    @inlinable public func stopPropagation() {
        let this = jsObject
        _ = this[.stopPropagation].function!(this: this, arguments: [])
    }
    
    public var cancelBubble: Bool {
        get { jsObject[.cancelBubble].fromJSValue()!}
        set { jsObject[.cancelBubble] = newValue.jsValue }
    }
    
    @inlinable public func stopImmediatePropagation() {
        let this = jsObject
        _ = this[.stopImmediatePropagation].function!(this: this, arguments: [])
    }
    
    public var bubbles: Bool {
        jsObject[.bubbles].fromJSValue()!
    }
    
    public var cancelable: Bool {
        jsObject[.cancelable].fromJSValue()!
    }
    
    public var returnValue: Bool {
        get { jsObject[.returnValue].fromJSValue()!}
        set { jsObject[.returnValue] = newValue.jsValue }
    }
    
    @inlinable public func preventDefault() {
        let this = jsObject
        _ = this[.preventDefault].function!(this: this, arguments: [])
    }
    
    public var defaultPrevented: Bool {
        jsObject[.defaultPrevented].fromJSValue()!
    }
    
    public var composed: Bool {
        jsObject[.composed].fromJSValue()!
    }
    
    public var isTrusted: Bool {
        jsObject[.isTrusted].fromJSValue()!
    }
    
    public var timeStamp: DOMHighResTimeStamp {
        jsObject[.timeStamp].fromJSValue()!
    }
    
    @inlinable public func initEvent(type: String, bubbles: Bool? = nil, cancelable: Bool? = nil) {
        let this = jsObject
        _ = this[.initEvent].function!(this: this, arguments: [_toJSValue(type), _toJSValue(bubbles), _toJSValue(cancelable)])
    }
}

public class EventInit: BridgedDictionary {
    public convenience init(bubbles: Bool, cancelable: Bool, composed: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.bubbles] = _toJSValue(bubbles)
        object[.cancelable] = _toJSValue(cancelable)
        object[.composed] = _toJSValue(composed)
        self.init(unsafelyWrapping: object)
    }
    
    public var bubbles: Bool {
        get { jsObject[.bubbles].fromJSValue()!}
        set { jsObject[.bubbles] = newValue.jsValue }
    }
    
    public var cancelable: Bool {
        get { jsObject[.cancelable].fromJSValue()!}
        set { jsObject[.cancelable] = newValue.jsValue }
    }
    
    public var composed: Bool {
        get { jsObject[.composed].fromJSValue()!}
        set { jsObject[.composed] = newValue.jsValue }
    }
}

public typealias EventListener = (Event) -> Void
public class EventListenerOptions: BridgedDictionary {
    public convenience init(capture: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.capture] = _toJSValue(capture)
        self.init(unsafelyWrapping: object)
    }
    
    public var capture: Bool {
        get { jsObject[.capture].fromJSValue()!}
        set { jsObject[.capture] = newValue.jsValue }
    }
}

public class EventModifierInit: BridgedDictionary {
    public convenience init(ctrlKey: Bool, shiftKey: Bool, altKey: Bool, metaKey: Bool, modifierAltGraph: Bool, modifierCapsLock: Bool, modifierFn: Bool, modifierFnLock: Bool, modifierHyper: Bool, modifierNumLock: Bool, modifierScrollLock: Bool, modifierSuper: Bool, modifierSymbol: Bool, modifierSymbolLock: Bool) {
        let object = JSObject.global[.Object].function!.new()
        object[.ctrlKey] = _toJSValue(ctrlKey)
        object[.shiftKey] = _toJSValue(shiftKey)
        object[.altKey] = _toJSValue(altKey)
        object[.metaKey] = _toJSValue(metaKey)
        object[.modifierAltGraph] = _toJSValue(modifierAltGraph)
        object[.modifierCapsLock] = _toJSValue(modifierCapsLock)
        object[.modifierFn] = _toJSValue(modifierFn)
        object[.modifierFnLock] = _toJSValue(modifierFnLock)
        object[.modifierHyper] = _toJSValue(modifierHyper)
        object[.modifierNumLock] = _toJSValue(modifierNumLock)
        object[.modifierScrollLock] = _toJSValue(modifierScrollLock)
        object[.modifierSuper] = _toJSValue(modifierSuper)
        object[.modifierSymbol] = _toJSValue(modifierSymbol)
        object[.modifierSymbolLock] = _toJSValue(modifierSymbolLock)
        self.init(unsafelyWrapping: object)
    }
    
    public var ctrlKey: Bool {
        get { jsObject[.ctrlKey].fromJSValue()!}
        set { jsObject[.ctrlKey] = newValue.jsValue }
    }
    
    public var shiftKey: Bool {
        get { jsObject[.shiftKey].fromJSValue()!}
        set { jsObject[.shiftKey] = newValue.jsValue }
    }
    
    public var altKey: Bool {
        get { jsObject[.altKey].fromJSValue()!}
        set { jsObject[.altKey] = newValue.jsValue }
    }
    
    public var metaKey: Bool {
        get { jsObject[.metaKey].fromJSValue()!}
        set { jsObject[.metaKey] = newValue.jsValue }
    }
    
    public var modifierAltGraph: Bool {
        get { jsObject[.modifierAltGraph].fromJSValue()!}
        set { jsObject[.modifierAltGraph] = newValue.jsValue }
    }
    
    public var modifierCapsLock: Bool {
        get { jsObject[.modifierCapsLock].fromJSValue()!}
        set { jsObject[.modifierCapsLock] = newValue.jsValue }
    }
    
    public var modifierFn: Bool {
        get { jsObject[.modifierFn].fromJSValue()!}
        set { jsObject[.modifierFn] = newValue.jsValue }
    }
    
    public var modifierFnLock: Bool {
        get { jsObject[.modifierFnLock].fromJSValue()!}
        set { jsObject[.modifierFnLock] = newValue.jsValue }
    }
    
    public var modifierHyper: Bool {
        get { jsObject[.modifierHyper].fromJSValue()!}
        set { jsObject[.modifierHyper] = newValue.jsValue }
    }
    
    public var modifierNumLock: Bool {
        get { jsObject[.modifierNumLock].fromJSValue()!}
        set { jsObject[.modifierNumLock] = newValue.jsValue }
    }
    
    public var modifierScrollLock: Bool {
        get { jsObject[.modifierScrollLock].fromJSValue()!}
        set { jsObject[.modifierScrollLock] = newValue.jsValue }
    }
    
    public var modifierSuper: Bool {
        get { jsObject[.modifierSuper].fromJSValue()!}
        set { jsObject[.modifierSuper] = newValue.jsValue }
    }
    
    public var modifierSymbol: Bool {
        get { jsObject[.modifierSymbol].fromJSValue()!}
        set { jsObject[.modifierSymbol] = newValue.jsValue }
    }
    
    public var modifierSymbolLock: Bool {
        get { jsObject[.modifierSymbolLock].fromJSValue()!}
        set { jsObject[.modifierSymbolLock] = newValue.jsValue }
    }
}
public class UIEvent: Event {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.UIEvent].function }
    
    @inlinable public convenience init(type: String, eventInitDict: UIEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public var view: Window? {
        jsObject[.view].fromJSValue()
    }
    
    public var detail: Int32 {
        jsObject[.detail].fromJSValue()!
    }
    
    @inlinable public func initUIEvent(typeArg: String, bubblesArg: Bool? = nil, cancelableArg: Bool? = nil, viewArg: Window? = nil, detailArg: Int32? = nil) {
        let this = jsObject
        _ = this[.initUIEvent].function!(this: this, arguments: [_toJSValue(typeArg), _toJSValue(bubblesArg), _toJSValue(cancelableArg), _toJSValue(viewArg), _toJSValue(detailArg)])
    }
    
    public var which: UInt32 {
        jsObject[.which].fromJSValue()!
    }
}

public class UIEventInit: BridgedDictionary {
    public convenience init(view: Window?, detail: Int32, which: UInt32) {
        let object = JSObject.global[.Object].function!.new()
        object[.view] = _toJSValue(view)
        object[.detail] = _toJSValue(detail)
        object[.which] = _toJSValue(which)
        self.init(unsafelyWrapping: object)
    }
    
    public var view: Window? {
        get { jsObject[.view].fromJSValue()}
        set { jsObject[.view] = newValue.jsValue }
    }
    
    public var detail: Int32 {
        get { jsObject[.detail].fromJSValue()!}
        set { jsObject[.detail] = newValue.jsValue }
    }
    
    public var which: UInt32 {
        get { jsObject[.which].fromJSValue()!}
        set { jsObject[.which] = newValue.jsValue }
    }
}
public class CompositionEvent: UIEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.CompositionEvent].function }
    
    @inlinable public convenience init(type: String, eventInitDict: CompositionEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public var data: String {
        jsObject[.data].fromJSValue()!
    }
    
    @inlinable public func initCompositionEvent(typeArg: String, bubblesArg: Bool? = nil, cancelableArg: Bool? = nil, viewArg: WindowProxy? = nil, dataArg: String? = nil) {
        let this = jsObject
        _ = this[.initCompositionEvent].function!(this: this, arguments: [_toJSValue(typeArg), _toJSValue(bubblesArg), _toJSValue(cancelableArg), _toJSValue(viewArg), _toJSValue(dataArg)])
    }
}

public class CompositionEventInit: BridgedDictionary {
    public convenience init(data: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.data] = _toJSValue(data)
        self.init(unsafelyWrapping: object)
    }
    
    public var data: String {
        get { jsObject[.data].fromJSValue()!}
        set { jsObject[.data] = newValue.jsValue }
    }
}
public class FocusEvent: UIEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.FocusEvent].function }
    
    @inlinable public convenience init(type: String, eventInitDict: FocusEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public var relatedTarget: EventTarget? {
        jsObject[.relatedTarget].fromJSValue()
    }
}

public class FocusEventInit: BridgedDictionary {
    public convenience init(relatedTarget: EventTarget?) {
        let object = JSObject.global[.Object].function!.new()
        object[.relatedTarget] = _toJSValue(relatedTarget)
        self.init(unsafelyWrapping: object)
    }
    public var relatedTarget: EventTarget? {
        get { jsObject[.relatedTarget].fromJSValue()}
        set { jsObject[.relatedTarget] = newValue.jsValue }
    }
}
public class InputEvent: UIEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.InputEvent].function }
    
    @inlinable public convenience init(type: String, eventInitDict: InputEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public var data: String? {
        jsObject[.data].fromJSValue()
    }
    
    public var isComposing: Bool {
        jsObject[.isComposing].fromJSValue()!
    }
    
    public var inputType: String {
        jsObject[.inputType].fromJSValue()!
    }
}

public class InputEventInit: BridgedDictionary {
    public convenience init(data: String?, isComposing: Bool, inputType: String) {
        let object = JSObject.global[.Object].function!.new()
        object[.data] = _toJSValue(data)
        object[.isComposing] = _toJSValue(isComposing)
        object[.inputType] = _toJSValue(inputType)
        self.init(unsafelyWrapping: object)
    }
    
    public var data: String? {
        get { jsObject[.data].fromJSValue()}
        set { jsObject[.data] = newValue.jsValue }
    }
    
    public var isComposing: Bool {
        get { jsObject[.isComposing].fromJSValue()!}
        set { jsObject[.isComposing] = newValue.jsValue }
    }
    
    public var inputType: String {
        get { jsObject[.inputType].fromJSValue()!}
        set { jsObject[.inputType] = newValue.jsValue }
    }
}

public class KeyboardEvent: UIEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.KeyboardEvent].function }
    
    @inlinable public convenience init(type: String, eventInitDict: KeyboardEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public static let DOM_KEY_LOCATION_STANDARD: UInt32 = 0x00
    
    public static let DOM_KEY_LOCATION_LEFT: UInt32 = 0x01
    
    public static let DOM_KEY_LOCATION_RIGHT: UInt32 = 0x02
    
    public static let DOM_KEY_LOCATION_NUMPAD: UInt32 = 0x03
    
    public var key: String {
        jsObject[.key].fromJSValue()!
    }
    
    public var code: String {
        jsObject[.code].fromJSValue()!
    }
    
    public var location: UInt32 {
        jsObject[.location].fromJSValue()!
    }
    
    public var ctrlKey: Bool {
        jsObject[.ctrlKey].fromJSValue()!
    }
    
    public var shiftKey: Bool {
        jsObject[.shiftKey].fromJSValue()!
    }
    
    public var altKey: Bool {
        jsObject[.altKey].fromJSValue()!
    }
    
    public var metaKey: Bool {
        jsObject[.metaKey].fromJSValue()!
    }
    
    public var `repeat`: Bool {
        jsObject[.`repeat`].fromJSValue()!
    }
    
    public var isComposing: Bool {
        jsObject[.isComposing].fromJSValue()!
    }
    
    @inlinable public func getModifierState(keyArg: String) -> Bool {
        let this = jsObject
        return this[.getModifierState].function!(this: this, arguments: [_toJSValue(keyArg)]).fromJSValue()!
    }
    
    @inlinable public func initKeyboardEvent(typeArg: String, bubblesArg: Bool? = nil, cancelableArg: Bool? = nil, viewArg: Window? = nil, keyArg: String? = nil, locationArg: UInt32? = nil, ctrlKey: Bool? = nil, altKey: Bool? = nil, shiftKey: Bool? = nil, metaKey: Bool? = nil) {
        let this = jsObject
        _ = this[.initKeyboardEvent].function!(this: this, arguments: [_toJSValue(typeArg), _toJSValue(bubblesArg), _toJSValue(cancelableArg), _toJSValue(viewArg), _toJSValue(keyArg), _toJSValue(locationArg), _toJSValue(ctrlKey), _toJSValue(altKey), _toJSValue(shiftKey), _toJSValue(metaKey)])
    }
    
    public var charCode: UInt32 {
        jsObject[.charCode].fromJSValue()!
    }
    
    public var keyCode: UInt32 {
        jsObject[.keyCode].fromJSValue()!
    }
}

public class KeyboardEventInit: BridgedDictionary {
    public convenience init(key: String, code: String, location: UInt32, repeat: Bool, isComposing: Bool, charCode: UInt32, keyCode: UInt32) {
        let object = JSObject.global[.Object].function!.new()
        object[.key] = _toJSValue(key)
        object[.code] = _toJSValue(code)
        object[.location] = _toJSValue(location)
        object[.repeat] = _toJSValue(`repeat`)
        object[.isComposing] = _toJSValue(isComposing)
        object[.charCode] = _toJSValue(charCode)
        object[.keyCode] = _toJSValue(keyCode)
        self.init(unsafelyWrapping: object)
    }
    
    public var key: String {
        get { jsObject[.key].fromJSValue()!}
        set { jsObject[.key] = newValue.jsValue }
    }
    
    public var code: String {
        get { jsObject[.code].fromJSValue()!}
        set { jsObject[.code] = newValue.jsValue }
    }
    
    public var location: UInt32 {
        get { jsObject[.location].fromJSValue()!}
        set { jsObject[.location] = newValue.jsValue }
    }
    
    public var `repeat`: Bool {
        get { jsObject[.`repeat`].fromJSValue()!}
        set { jsObject[.`repeat`] = newValue.jsValue }
    }
    
    public var isComposing: Bool {
        get { jsObject[.isComposing].fromJSValue()!}
        set { jsObject[.isComposing] = newValue.jsValue }
    }
    
    public var charCode: UInt32 {
        get { jsObject[.charCode].fromJSValue()!}
        set { jsObject[.charCode] = newValue.jsValue }
    }
    
    public var keyCode: UInt32 {
        get { jsObject[.keyCode].fromJSValue()!}
        set { jsObject[.keyCode] = newValue.jsValue }
    }
}
public class MouseEvent: UIEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.MouseEvent].function }
    
    @inlinable public convenience init(type: String, eventInitDict: MouseEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public var screenX: Int32 {
        jsObject[.screenX].fromJSValue()!
    }
    
    public var screenY: Int32 {
        jsObject[.screenY].fromJSValue()!
    }
    
    public var clientX: Int32 {
        jsObject[.clientX].fromJSValue()!
    }
    
    public var clientY: Int32 {
        jsObject[.clientY].fromJSValue()!
    }
    
    public var ctrlKey: Bool {
        jsObject[.ctrlKey].fromJSValue()!
    }
    
    public var shiftKey: Bool {
        jsObject[.shiftKey].fromJSValue()!
    }
    
    public var altKey: Bool {
        jsObject[.altKey].fromJSValue()!
    }
    
    public var metaKey: Bool {
        jsObject[.metaKey].fromJSValue()!
    }
    
    public var button: Int16 {
        jsObject[.button].fromJSValue()!
    }
    
    public var buttons: UInt16 {
        jsObject[.buttons].fromJSValue()!
    }
    
    public var relatedTarget: EventTarget? {
        jsObject[.relatedTarget].fromJSValue()
    }
    
    @inlinable public func getModifierState(keyArg: String) -> Bool {
        let this = jsObject
        return this[.getModifierState].function!(this: this, arguments: [_toJSValue(keyArg)]).fromJSValue()!
    }
    
    @inlinable public func initMouseEvent(typeArg: String, bubblesArg: Bool? = nil, cancelableArg: Bool? = nil, viewArg: Window? = nil, detailArg: Int32? = nil, screenXArg: Int32? = nil, screenYArg: Int32? = nil, clientXArg: Int32? = nil, clientYArg: Int32? = nil, ctrlKeyArg: Bool? = nil, altKeyArg: Bool? = nil, shiftKeyArg: Bool? = nil, metaKeyArg: Bool? = nil, buttonArg: Int16? = nil, relatedTargetArg: EventTarget? = nil) {
        let this = jsObject
        _ = this[.initMouseEvent].function!(this: this, arguments: [_toJSValue(typeArg), _toJSValue(bubblesArg), _toJSValue(cancelableArg), _toJSValue(viewArg), _toJSValue(detailArg), _toJSValue(screenXArg), _toJSValue(screenYArg), _toJSValue(clientXArg), _toJSValue(clientYArg), _toJSValue(ctrlKeyArg), _toJSValue(altKeyArg), _toJSValue(shiftKeyArg), _toJSValue(metaKeyArg), _toJSValue(buttonArg), _toJSValue(relatedTargetArg)])
    }
    
    public var pageX: Double {
        jsObject[.pageX].fromJSValue()!
    }
    
    public var pageY: Double {
        jsObject[.pageY].fromJSValue()!
    }
    
    public var x: Double {
        jsObject[.x].fromJSValue()!
    }
    
    public var y: Double {
        jsObject[.y].fromJSValue()!
    }
    
    public var offsetX: Double {
        jsObject[.offsetX].fromJSValue()!
    }
    
    public var offsetY: Double {
        jsObject[.offsetY].fromJSValue()!
    }
}

public class MouseEventInit: BridgedDictionary {
    public convenience init(screenX: Int32, screenY: Int32, clientX: Int32, clientY: Int32, button: Int16, buttons: UInt16, relatedTarget: EventTarget?) {
        let object = JSObject.global[.Object].function!.new()
        object[.screenX] = _toJSValue(screenX)
        object[.screenY] = _toJSValue(screenY)
        object[.clientX] = _toJSValue(clientX)
        object[.clientY] = _toJSValue(clientY)
        object[.button] = _toJSValue(button)
        object[.buttons] = _toJSValue(buttons)
        object[.relatedTarget] = _toJSValue(relatedTarget)
        self.init(unsafelyWrapping: object)
    }
    
    public var screenX: Int32 {
        get { jsObject[.screenX].fromJSValue()!}
        set { jsObject[.screenX] = newValue.jsValue }
    }
    
    public var screenY: Int32 {
        get { jsObject[.screenY].fromJSValue()!}
        set { jsObject[.screenY] = newValue.jsValue }
    }
    
    public var clientX: Int32 {
        get { jsObject[.clientX].fromJSValue()!}
        set { jsObject[.clientX] = newValue.jsValue }
    }
    
    public var clientY: Int32 {
        get { jsObject[.clientY].fromJSValue()!}
        set { jsObject[.clientY] = newValue.jsValue }
    }
    
    public var button: Int16 {
        get { jsObject[.button].fromJSValue()!}
        set { jsObject[.button] = newValue.jsValue }
    }
    
    public var buttons: UInt16 {
        get { jsObject[.buttons].fromJSValue()!}
        set { jsObject[.buttons] = newValue.jsValue }
    }
    
    public var relatedTarget: EventTarget? {
        get { jsObject[.relatedTarget].fromJSValue()}
        set { jsObject[.relatedTarget] = newValue.jsValue }
    }
}

public class DragEvent: MouseEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.DragEvent].function }
    
    @inlinable public convenience init(type: String, eventInitDict: DragEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public var dataTransfer: DataTransfer? {
        jsObject[.dataTransfer].fromJSValue()
    }
}

public class DragEventInit: BridgedDictionary {
    public convenience init(dataTransfer: DataTransfer?) {
        let object = JSObject.global[.Object].function!.new()
        object[.dataTransfer] = _toJSValue(dataTransfer)
        self.init(unsafelyWrapping: object)
    }
    
    public var dataTransfer: DataTransfer? {
        get { jsObject[.dataTransfer].fromJSValue()}
        set { jsObject[.dataTransfer] = newValue.jsValue }
    }
}
public class WheelEvent: MouseEvent {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.WheelEvent].function }
    
    @inlinable public convenience init(type: String, eventInitDict: WheelEventInit? = nil) {
        self.init(unsafelyWrapping: Self.constructor!.new(arguments: [_toJSValue(type), _toJSValue(eventInitDict)]))
    }
    
    public static let DOM_DELTA_PIXEL: UInt32 = 0x00
    
    public static let DOM_DELTA_LINE: UInt32 = 0x01
    
    public static let DOM_DELTA_PAGE: UInt32 = 0x02
    
    public var deltaX: Double {
        jsObject[.deltaX].fromJSValue()!
    }
    
    public var deltaY: Double {
        jsObject[.deltaY].fromJSValue()!
    }
    
    public var deltaZ: Double {
        jsObject[.deltaZ].fromJSValue()!
    }
    
    public var deltaMode: UInt32 {
        jsObject[.deltaMode].fromJSValue()!
    }
}

public class WheelEventInit: BridgedDictionary {
    public convenience init(deltaX: Double, deltaY: Double, deltaZ: Double, deltaMode: UInt32) {
        let object = JSObject.global[.Object].function!.new()
        object[.deltaX] = _toJSValue(deltaX)
        object[.deltaY] = _toJSValue(deltaY)
        object[.deltaZ] = _toJSValue(deltaZ)
        object[.deltaMode] = _toJSValue(deltaMode)
        self.init(unsafelyWrapping: object)
    }
    
    public var deltaX: Double {
        get { jsObject[.deltaX].fromJSValue()!}
        set { jsObject[.deltaX] = newValue.jsValue }
    }
    
    public var deltaY: Double {
        get { jsObject[.deltaY].fromJSValue()!}
        set { jsObject[.deltaY] = newValue.jsValue }
    }
    
    public var deltaZ: Double {
        get { jsObject[.deltaZ].fromJSValue()!}
        set { jsObject[.deltaZ] = newValue.jsValue }
    }
    
    public var deltaMode: UInt32 {
        get { jsObject[.deltaMode].fromJSValue()!}
        set { jsObject[.deltaMode] = newValue.jsValue }
    }
}
