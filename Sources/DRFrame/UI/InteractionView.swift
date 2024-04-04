//
//  InteractiveView.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import RefCount

public protocol InteractiveView {
    var userInteractEnabled: Bool { get set }
    mutating func touchBegin(with point: CGPoint)
    mutating func touchMove(with point: CGPoint)
    mutating func touchEnd(with point: CGPoint)
}

public typealias WeakViewWithOffset = (WeakDRViewRef?, CGPoint)

public extension InteractiveView {
    func touchBegin(with point: CGPoint) {
        
    }
    
    func touchMove(with point: CGPoint) {
        
    }
    
    func touchEnd(with point: CGPoint) {
        
    }
}
