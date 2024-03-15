//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation

// TODO: Fix access control
//public
extension DRView {
    func responderSubView(for point: CGPoint) -> ViewWithOffset {
        for view in subviews.reversed() {
            if !view.hidden {
                let (subView, offset) = view.responderSubView(for: CGPoint(x: point.x - view.left, y: point.y - view.top))
                if let subView {
                    return (subView, CGPoint(x: offset.x + view.left, y: offset.y + view.top) )
                }
            }
            
            if !view.hidden && view.userInteractEnabled && view.isPointInView(point: point) {
                return (view, .zero)
            }
            
        }
        return (nil, .zero)
    }
    
    @usableFromInline
    func isPointInView(point: CGPoint) -> Bool {
        return frame.left <= point.x && frame.right >= point.x && frame.top <= point.y && frame.bottom >= point.y
    }
}

