//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
//import RefCount

// TODO: Fix access control
//public
extension DRView {
    func responderSubView(for point: CGPoint) -> WeakViewWithOffset {
        for ref in subviews.reversed() {
            if !ref.value.hidden {
                let response = ref.value.responderSubView(for: CGPoint(x: point.x - ref.value.left, y: point.y - ref.value.top))
               let responder = response.0
                if responder?.value != nil {
                    let offset = response.1
                    return (responder, CGPoint(x: offset.x + responder!.value!.left, y: offset.y + responder!.value!.top))
                }
            }
            
            if !ref.value.hidden && ref.value.userInteractEnabled && ref.value.isPointInView(point: point) {
                return (ref.weakRef, .zero)
            }
        }
        
        return (nil, .zero)
    }
    
    @usableFromInline
    func isPointInView(point: CGPoint) -> Bool {
        return frame.left <= point.x && frame.right >= point.x && frame.top <= point.y && frame.bottom >= point.y
    }
}

