//
//  Canvas.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM
import WebAPIBase

public struct Canvas {
    internal let element: HTMLCanvasElement
    var context: CanvasRenderingContext2D {
        element.getContext(CanvasRenderingContext2D.self)!
    }
    
    init(width: UInt32, height: UInt32) {
        element = HTMLCanvasElement(from: globalThis.document.createElement(localName: "canvas"))!
        element.width = width
        element.height = height
    }
}

public typealias Context2D = DOM.CanvasRenderingContext2D

public extension Context2D {
    func set(background color: Color32) {
        let jsColor = JSColor.rgba(color.r, color.g, color.b, Double(color.a) / 255.0)
        setFillStyle(jsColor)
    }
}
