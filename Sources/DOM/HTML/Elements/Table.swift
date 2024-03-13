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

public class HTMLTableCaptionElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTableCaptionElement].function }

//    @available(*, deprecated, message: "use css instead")
//    public var align: String {
//        get { jsObject[.align].fromJSValue()! }
//        set { jsObject[.align] = newValue.jsValue }
//    }
}

public class HTMLTableCellElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTableCellElement].function }

    public var colSpan: UInt32 {
        get { jsObject[.colSpan].fromJSValue()!}
        set { jsObject[.colSpan] = newValue.jsValue }
    }

    public var rowSpan: UInt32 {
        get { jsObject[.rowSpan].fromJSValue()!}
        set { jsObject[.rowSpan] = newValue.jsValue }
    }

    public var headers: String {
        get { jsObject[.headers].fromJSValue()!}
        set { jsObject[.headers] = newValue.jsValue }
    }

//    public var cellIndex: Int32 {
//        jsObject[.cellIndex].fromJSValue()!
// 
//    }

    public var scope: String {
        get { jsObject[.scope].fromJSValue()!}
        set { jsObject[.scope] = newValue.jsValue }
    }

//    public var abbr: String {
//        get { jsObject[.abbr].fromJSValue()!}
//        set { jsObject[.abbr] = newValue.jsValue }
// 
//    }

//    public var align: String {
//        get { jsObject[.align].fromJSValue()!}
//        set { jsObject[.align] = newValue.jsValue }
//    }
//
//    public var axis: String {
//        get { jsObject[.axis].fromJSValue()!}
//        set { jsObject[.axis] = newValue.jsValue }
//    }

//    public var height: String {
//        get { jsObject[.height].fromJSValue()!}
//        set { jsObject[.height] = newValue.jsValue }
//    }
//
//    public var width: String {
//        get { jsObject[.width].fromJSValue()!}
//        set { jsObject[.width] = newValue.jsValue }
//    }

//    public var ch: String {
//        get { jsObject[.ch].fromJSValue()!}
//        set { jsObject[.ch] = newValue.jsValue }
//    }

//    public var chOff: String {
//        get { jsObject[.chOff].fromJSValue()!}
//        set { jsObject[.chOff] = newValue.jsValue }
//    }

//    public var noWrap: Bool {
//        get { jsObject[.noWrap].fromJSValue()!}
//        set { jsObject[.noWrap] = newValue.jsValue }
//    }
//
//    public var vAlign: String {
//        get { jsObject[.vAlign].fromJSValue()!}
//        set { jsObject[.vAlign] = newValue.jsValue }
//    }

//    public var bgColor: String {
//        get { jsObject[.bgColor].fromJSValue()!}
//        set { jsObject[.bgColor] = newValue.jsValue }
//    }
}

public class HTMLTableColElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTableColElement].function }

    public var span: UInt32 {
        get { jsObject[.span].fromJSValue()!}
        set { jsObject[.span] = newValue.jsValue }
    }

//    public var align: String {
//        get { jsObject[.align].fromJSValue()!}
//        set { jsObject[.align] = newValue.jsValue }
//    }
//
//    public var ch: String {
//        get { jsObject[.ch].fromJSValue()!}
//        set { jsObject[.ch] = newValue.jsValue }
//    }
//
//    public var chOff: String {
//        get { jsObject[.chOff].fromJSValue()!}
//        set { jsObject[.chOff] = newValue.jsValue }
//    }
//
//    public var vAlign: String {
//        get { jsObject[.vAlign].fromJSValue()!}
//        set { jsObject[.vAlign] = newValue.jsValue }
//    }
//
//    public var width: String {
//        get { jsObject[.width].fromJSValue()!}
//        set { jsObject[.width] = newValue.jsValue }
//    }
}

public class HTMLTableElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTableElement].function }
    
    public var caption: HTMLTableCaptionElement? {
        get { jsObject[.caption].fromJSValue() }
        set { jsObject[.caption] = newValue.jsValue }
    }
    
    @inlinable public func createCaption() -> HTMLTableCaptionElement {
        let this = jsObject
        return this[.createCaption].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func deleteCaption() {
        let this = jsObject
        _ = this[.deleteCaption].function!(this: this, arguments: [])
    }
    
    public var tHead: HTMLTableSectionElement? {
        get { jsObject[.tHead].fromJSValue()}
        set { jsObject[.tHead] = newValue.jsValue }
    }
    
    @inlinable public func createTHead() -> HTMLTableSectionElement {
        let this = jsObject
        return this[.createTHead].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func deleteTHead() {
        let this = jsObject
        _ = this[.deleteTHead].function!(this: this, arguments: [])
    }
    
    public var tFoot: HTMLTableSectionElement? {
        get { jsObject[.tFoot].fromJSValue()}
        set { jsObject[.tFoot] = newValue.jsValue }
    }
    
    @inlinable public func createTFoot() -> HTMLTableSectionElement {
        let this = jsObject
        return this[.createTFoot].function!(this: this, arguments: []).fromJSValue()!
    }
    
    @inlinable public func deleteTFoot() {
        let this = jsObject
        _ = this[.deleteTFoot].function!(this: this, arguments: [])
    }
    
    public var tBodies: HTMLCollection {
        jsObject[.tBodies].fromJSValue()!
    }
    
    @inlinable public func createTBody() -> HTMLTableSectionElement {
        let this = jsObject
        return this[.createTBody].function!(this: this, arguments: []).fromJSValue()!
    }
    
    public var rows: HTMLCollection {
        jsObject[.rows].fromJSValue()!
    }
    
    @inlinable public func insertRow(index: Int32? = nil) -> HTMLTableRowElement {
        let this = jsObject
        return this[.insertRow].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()!
    }
    
    @inlinable public func deleteRow(index: Int32) {
        let this = jsObject
        _ = this[.deleteRow].function!(this: this, arguments: [_toJSValue(index)])
    }
    
//    public var align: String {
//        get { jsObject[.align].fromJSValue()!}
//        set { jsObject[.align] = newValue.jsValue }
//    }
    
//    public var border: String {
//        get { jsObject[.border].fromJSValue()!}
//        set { jsObject[.border] = newValue.jsValue }
//    }
//    public var frame: String {
//        get { jsObject[.frame].fromJSValue()!}
//        set { jsObject[.frame] = newValue.jsValue }
//    }
//    public var rules: String {
//        get { jsObject[.rules].fromJSValue()!}
//        set { jsObject[.rules] = newValue.jsValue }
//    }
    
//    public var summary: String {
//        get { jsObject[.summary].fromJSValue()!}
//        set { jsObject[.summary] = newValue.jsValue }
//    }
//    public var width: String {
//        get { jsObject[.width].fromJSValue()!}
//        set { jsObject[.width] = newValue.jsValue }
//    }
//    public var bgColor: String {
//        get { jsObject[.bgColor].fromJSValue()!}
//        set { jsObject[.bgColor] = newValue.jsValue }
//    }
//    public var cellPadding: String {
//        get { jsObject[.cellPadding].fromJSValue()!}
//        set { jsObject[.cellPadding] = newValue.jsValue }
//    }
//    public var cellSpacing: String {
//        get { jsObject[.cellSpacing].fromJSValue()!}
//        set { jsObject[.cellSpacing] = newValue.jsValue }
//    }
}


public class HTMLTableRowElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTableRowElement].function }

    public var rowIndex: Int32 {
        jsObject[.rowIndex].fromJSValue()!
    }

    public var sectionRowIndex: Int32 {
        jsObject[.sectionRowIndex].fromJSValue()!
    }
    
    public var cells: HTMLCollection {
        jsObject[.cells].fromJSValue()!
    }

    @inlinable public func insertCell(index: Int32? = nil) -> HTMLTableCellElement {
        let this = jsObject
        return this[.insertCell].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()!
    }

    @inlinable public func deleteCell(index: Int32) {
        let this = jsObject
        _ = this[.deleteCell].function!(this: this, arguments: [_toJSValue(index)])
    }

    public var align: String {
        get { jsObject[.align].fromJSValue()!}
        set { jsObject[.align] = newValue.jsValue }
    }

    public var ch: String {
        get { jsObject[.ch].fromJSValue()!}
        set { jsObject[.ch] = newValue.jsValue }
    }

    public var chOff: String {
        get { jsObject[.chOff].fromJSValue()!}
        set { jsObject[.chOff] = newValue.jsValue }
    }

    public var vAlign: String {
        get { jsObject[.vAlign].fromJSValue()!}
        set { jsObject[.vAlign] = newValue.jsValue }
    }

    public var bgColor: String {
        get { jsObject[.bgColor].fromJSValue()!}
        set { jsObject[.bgColor] = newValue.jsValue }
    }
}

public class HTMLTableSectionElement: HTMLElement {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLTableSectionElement].function }

//    public var rows: HTMLCollection {
//        jsObject[.rows].fromJSValue()!
//    }
//
//    @inlinable public func insertRow(index: Int32? = nil) -> HTMLTableRowElement {
//        let this = jsObject
//        return this[.insertRow].function!(this: this, arguments: [_toJSValue(index)]).fromJSValue()!
//    }
//
//    @inlinable public func deleteRow(index: Int32) {
//        let this = jsObject
//        _ = this[.deleteRow].function!(this: this, arguments: [_toJSValue(index)])
//    }
//
//    public var align: String {
//        get { jsObject[.align].fromJSValue()!}
//        set { jsObject[.align] = newValue.jsValue }
//    }
//
//    public var ch: String {
//        get { jsObject[.ch].fromJSValue()!}
//        set { jsObject[.ch] = newValue.jsValue }
//    }
//
//    public var chOff: String {
//        get { jsObject[.chOff].fromJSValue()!}
//        set { jsObject[.chOff] = newValue.jsValue }
//    }
//
//    public var vAlign: String {
//        get { jsObject[.vAlign].fromJSValue()!}
//        set { jsObject[.vAlign] = newValue.jsValue }
// 
//    }
}
