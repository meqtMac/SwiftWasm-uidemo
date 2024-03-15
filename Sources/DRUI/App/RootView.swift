//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM

internal class RootView: DRView {
    var userInteractEnabled: Bool = false
    var hidden: Bool = false
    var frame: CGRect
    var backgroundColor: DOM.JSColor
    var subviews: [DRView]
    
    private init(frame: CGRect, subviews: [DRView]) {
        self.frame = frame
        self.backgroundColor = .rgba(0, 0, 0, 0)
        self.subviews = subviews
    }
    
    static func rootView(on canvas: Canvas, view: DRView) -> RootView {
        let rootView = RootView(frame: CGRect(origin: .init(x: 0, y: 0), size: CGSize(width: CGFloat(canvas.element.width), height: CGFloat(canvas.element.height))), subviews: [view])
        return rootView
    }
    
   
    func draw(on context: CanvasRenderingContext2D) {
        context.imageSmoothingEnabled = false
        self.frame = CGRect(origin: .zero, size: CGSize(width: CGFloat(context.canvas.width), height: CGFloat(context.canvas.height)))
        
        context.clear(rect: frame)
        context.save()
        context.setFillStyle(backgroundColor)
        context.fill(rect: frame)
        context.restore()
        
        drawSubviews(on: context)
    }
}
