//
//  Button.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM
import DRUI
import JavaScriptKit
import RefCount

struct Button: RectView {
    var frame: CGRect
    var backgroundColor: Color32
    var subviews: [DRViewRef] = []
    var hidden: Bool = false
    var userInteractEnabled: Bool = true
    
    private let onClick: () -> Void
    
    init(color: Color32, onClick: @escaping () -> Void) {
        self.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
        self.backgroundColor = color
        self.onClick = onClick
    }
    
    private var isTouching: Bool = false
    
    mutating func touchBegin(with point: CGPoint) {
        isTouching = true
    }
    
    mutating func touchEnd(with point: CGPoint) {
        if isTouching {
            onClick()
        }
        isTouching = false
    }
}
