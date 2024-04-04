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

public class HTMLFormControlsCollection: HTMLCollection {
    @inlinable override public class var constructor: JSFunction? { JSObject.global[.HTMLFormControlsCollection].function }

    public required init(unsafelyWrapping jsObject: JSObject) {
        super.init(unsafelyWrapping: jsObject)
    }

    @inlinable public subscript(key: String) -> Element_or_RadioNodeList? {
        jsObject[key].fromJSValue()
    }

    // `override` removed since the superclass returns a more constrained type `Element`
    @inlinable func namedItem(name: String) -> Element_or_RadioNodeList? {
        let this = jsObject
        return this[.namedItem].function!(this: this, arguments: [_toJSValue(name)]).fromJSValue()
    }
}