//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/3/15.
//

import Foundation
import DOM

public protocol CapsuleView: DRView {
    
}

public extension CapsuleView {
    func draw(on context: CanvasRenderingContext2D) {
        context.save()
        context.set(background: backgroundColor)
        let radius = min(frame.size.width, frame.size.height) / 2
        context.beginPath()
        context.moveTo(x: frame.origin.x + radius, y: frame.origin.y)
        context.lineTo(x: self.right - radius, y: top)
        context.arc(x: self.right - radius, y: self.top + radius, radius: radius, startAngle: 0, endAngle: 90)
        context.lineTo(x: self.right, y: self.bottom - radius)
        context.arc(x: self.right - radius, y: self.bottom - radius, radius: radius, startAngle: 90, endAngle: 180)
        context.lineTo(x: self.left + radius, y: self.bottom)
        context.arc(x: self.left + radius, y: self.bottom - radius, radius: radius, startAngle: 180, endAngle: 270)
        context.lineTo(x: self.left, y: self.top + radius)
        context.arc(x: self.left + radius, y: self.top + radius, radius: radius, startAngle: 270, endAngle: 360)
        context.closePath()
        context.fill()
        context.restore()
    }
    
}
