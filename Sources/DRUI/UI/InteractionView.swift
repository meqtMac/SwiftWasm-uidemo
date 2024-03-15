//
//  InteractiveView.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation

public protocol InteractiveView {
    var userInteractEnabled: Bool { get set }
    func touchBegin(with point: CGPoint)
    func touchMove(with point: CGPoint)
    func touchEnd(with point: CGPoint)
}

public typealias ViewWithOffset = (InteractiveView?, CGPoint)

public extension InteractiveView {
    func touchBegin(with point: CGPoint) {
        
    }
    
    func touchMove(with point: CGPoint) {
        
    }
    
    func touchEnd(with point: CGPoint) {
        
    }
}
