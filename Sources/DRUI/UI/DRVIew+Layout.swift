//
//  DRView+Layout.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation

public extension DRView {
    mutating func draw(on context: Context2D) {
        // Default do nothing
    }
    
    mutating func layoutSubviews() {
        // Default do nothing
    }
    
    mutating func drawSubviews(on context: Context2D) {
        layoutSubviews()
        context.save()
        context.translate(x: frame.origin.x, y: frame.origin.y)
        for ref in self.subviews {
            var mutref = ref
            if mutref.value.hidden {
                continue
            }
            mutref.value.draw(on: context)
            mutref.value.drawSubviews(on: context)
        }
        context.restore()
    }
    
    mutating func addSubview(_ view: consuming some DRView) {
//        @Rc var view: DRView = view
        subviews.append(Rc(wrappedValue: view))
    }
    
}
