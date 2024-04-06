//
//  CircleShape.swift
//
//
//  Created by 蒋艺 on 2024/4/5.
//

import DRColor
import DRMath

/// How to paint a circle.
public struct CircleShape {
    public var center: Pos2
    public var radius: Float32
    public var fill: Color32
    public var stroke: Stroke
    
    public init(center: Pos2, radius: Float32, fill: Color32, stroke: Stroke) {
        self.center = center
        self.radius = radius
        self.fill = fill
        self.stroke = stroke
    }
}

public extension CircleShape {
    @inlinable
    static func filled(center: Pos2, radius: Float32, fill_color: Color32) -> Self {
        Self (
            center:    center,
            radius: radius,
            fill: fill_color,
        stroke: .none
        )
    }

    @inlinable
    static func stroke(center: Pos2, radius: Float32, stroke: Stroke) -> Self {
        Self (
            center: center,
            radius: radius,
            fill: .transparent,
            stroke: stroke
        )
    }

    /// The visual bounding rectangle (includes stroke width)
    func visual_bounding_rect() -> Rect {
        if self.fill == Color32.transparent && self.stroke.is_empty() {
            return .nothing
        } else {
            let splat = self.radius * 2.0 + self.stroke.width
            return Rect(center: self.center, size: Vec2(x: splat, y: splat))
        }
    }
    
}


