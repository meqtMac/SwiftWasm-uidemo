//
//  Canvas.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM
//import WebAPIBase

struct Canvas {
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
