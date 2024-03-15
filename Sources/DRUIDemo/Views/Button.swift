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

class Button: RectView {
    var frame: CGRect
    var backgroundColor: JSColor
    var subviews: [DRUI.DRView] = []
    var hidden: Bool = false
    var userInteractEnabled: Bool = true
    
    private let onClick: () -> Void
    
    init(color: JSColor, onClick: @escaping () -> Void) {
        self.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
        self.backgroundColor = color
        self.onClick = onClick
    }
    
    private var isTouching: Bool = false
    
    func touchBegin(with point: CGPoint) {
        isTouching = true
    }
    
    func touchEnd(with point: CGPoint) {
        if isTouching {
            onClick()
        }
        isTouching = false
    }
}
