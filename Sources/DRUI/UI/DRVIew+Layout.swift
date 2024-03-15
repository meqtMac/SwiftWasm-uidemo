//
//  DRView+Layout.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM

public extension DRView {
    func draw(on context: CanvasRenderingContext2D) {
        // Default do nothing
    }
    
    func layoutSubviews() {
        // Default do nothing
    }
    
    func drawSubviews(on context: CanvasRenderingContext2D) {
        layoutSubviews()
        context.save()
        context.translate(x: frame.origin.x, y: frame.origin.y)
        for subview in self.subviews {
            if subview.hidden {
                continue
            }
            subview.draw(on: context)
            subview.drawSubviews(on: context)
        }
        context.restore()
    }
    
    mutating func addSubview(_ view: some DRView) {
        subviews.append(view)
    }
    
}
