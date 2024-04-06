//
//  EllipseShape.swift
//  
//
//  Created by 蒋艺 on 2024/4/5.
//

import DRMath
import DRColor

/// How to paint an ellipse.
public struct EllipseShape {
    public var center: Pos2

    /// Radius is the vector (a, b) where the width of the Ellipse is 2a and the height is 2b
    public var radius: Vec2
    public var fill: Color32
    public var stroke: Stroke
    
    @usableFromInline
    init(center: Pos2, radius: Vec2, fill: Color32, stroke: Stroke) {
        self.center = center
        self.radius = radius
        self.fill = fill
        self.stroke = stroke
    }
    
}

public extension EllipseShape {
    // filled
    
    // stroke
    
    // visual_bounding_rect
    @inlinable
    static func filled(center: Pos2, radius: Vec2, fill_color: Color32) -> Self {
       Self(center: center, radius: radius, fill: .transparent, stroke: .none)
    }

    @inlinable
    static func stroke(center: Pos2, radius: Vec2, stroke: Stroke) -> Self {
       Self(center: center, radius: radius, fill: .transparent, stroke: stroke)
    }

    /// The visual bounding rectangle (includes stroke width)
    func visual_bounding_rect() -> Rect {
        if self.fill == .transparent && self.stroke.is_empty() {
            return .nothing
        } else {
           return Rect(center: self.center, size: self.radius + Vec2(x: stroke.width, y: stroke.width))
        }
    }
    
}

