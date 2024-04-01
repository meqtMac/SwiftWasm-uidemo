//
//  File.swift
//
//
//  Created by 蒋艺 on 2023/8/30.
//

//import Foundation
import JavaScriptKit
import WebAPIBase

public class CanvasRenderingContext2D: JSBridgedClass {
    @inlinable public class var constructor: JSFunction? { JSObject.global[.CanvasRenderingContext2D].function }
    
    public let jsObject: JSObject
    
    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
public var canvas: HTMLCanvasElement {
jsObject[.canvas].fromJSValue()!
    }
    
    @inlinable public func getContextAttributes() -> CanvasRenderingContext2DSettings {
        let this = jsObject
        return this[.getContextAttributes].function!(this: this, arguments: []).fromJSValue()!
    }
}


extension CanvasRenderingContext2D: CanvasFillStrokeStyles,
                                    CanvasPathDrawingStyles,
                                    CanvasState,
                                    CanvasTransform,
                                    CanvasCompositing,
                                    CanvasImageSmoothing,
                                    CanvasShadowStyles,
                                    CanvasFilters,
                                    CanvasRect,
                                    CanvasDrawPath,
                                    CanvasUserInterface,
                                    CanvasText,
                                    CanvasDrawImage,
                                    CanvasImageData,
                                    CanvasTextDrawingStyles,
                                    CanvasPath { }

public class OffscreenCanvasRenderingContext2D:  JSBridgedClass,
                                                 CanvasState,
                                                 CanvasTransform,
                                                 CanvasCompositing,
                                                 CanvasImageSmoothing,
                                                 CanvasFillStrokeStyles,
                                                 CanvasShadowStyles,
                                                 CanvasFilters,
                                                 CanvasRect,
                                                 CanvasDrawPath,
                                                 CanvasText,
                                                 CanvasDrawImage,
                                                 CanvasImageData,
                                                 CanvasPathDrawingStyles,
                                                 CanvasTextDrawingStyles,
                                                 CanvasPath {
    
    @inlinable public class var constructor: JSFunction? { JSObject.global[.OffscreenCanvasRenderingContext2D].function }
    
    public let jsObject: JSObject
    

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
    
    @inlinable public func commit() {
        let this = jsObject
        _ = this[.commit].function!(this: this, arguments: [])
    }
    
public var canvas: OffscreenCanvas {
jsObject[.canvas].fromJSValue()!
    }
}
