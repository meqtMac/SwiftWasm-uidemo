//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/8/31.
//

import JavaScriptKit
import WebAPIBase

public protocol CanvasState {
    func save()
    func restore()
    func reset()
    func isContextLost() -> Bool
}

public extension CanvasState where Self: JSBridgedClass {
    @inlinable func save() {
        let this = jsObject
        _ = this[.save].function!(this: this, arguments: [])
    }

    @inlinable func restore() {
        let this = jsObject
        _ = this[.restore].function!(this: this, arguments: [])
    }

    @inlinable func reset() {
        let this = jsObject
        _ = this[.reset].function!(this: this, arguments: [])
    }

    @inlinable func isContextLost() -> Bool {
        let this = jsObject
        return this[.isContextLost].function!(this: this, arguments: []).fromJSValue()!
    }
}
