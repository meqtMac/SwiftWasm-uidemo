//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM
import WebAPIBase

public protocol RectView: DRView {
    
}

public extension RectView {
    func draw(on context: CanvasRenderingContext2D) {
        context.save()
//        context.setFillStyle(backgroundColor)
        context.set(background: backgroundColor)
        context.fill(rect: self.frame)
        context.restore()
    }
}

