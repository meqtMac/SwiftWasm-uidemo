//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM

public protocol DRView: InteractiveView {
    var frame: CGRect { get set }
    var backgroundColor: JSColor { get set }
    func draw(on context: CanvasRenderingContext2D)
    func layoutSubviews()
    var subviews: [DRView] { get set }
    var hidden: Bool { get set }
}

