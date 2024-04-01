//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM
//import RefCount

internal struct RootView: DRView {
    var userInteractEnabled: Bool = false
    var hidden: Bool = false
    var frame: CGRect
    var backgroundColor: Color32
    var subviews: [DRViewRef]
    
    private init(frame: CGRect, subview: consuming some DRView) {
        self.frame = frame
        self.backgroundColor =  .transparent
       
//        @Rc
//        var rc: DRView = subview
        
        subviews = [Rc(wrappedValue: subview)]
    }
    
    static func rootView(on canvas: Canvas, view: DRView) -> RootView {
        let rootView = RootView(frame: CGRect(origin: .init(x: 0, y: 0), size: CGSize(width: CGFloat(canvas.element.width), height: CGFloat(canvas.element.height))), subview: view)
        return rootView
    }
    
   
    mutating func draw(on context: Context2D) {
        context.imageSmoothingEnabled = false
        self.frame = CGRect(origin: .zero, size: CGSize(width: CGFloat(context.canvas.width), height: CGFloat(context.canvas.height)))
        
        context.clear(rect: frame)
        context.save()
        context.set(background: backgroundColor)
        context.fill(rect: frame)
        context.restore()
        
        drawSubviews(on: context)
    }
}
