//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/4/6.
//

import DRMath
import DRColor

/// A value for all four sides of a rectangle,
/// often used to express padding or spacing.
///
/// Can be added and subtracted to/from [`Rect`]s.
public struct Margin {
    public var left: Float32
    public var right: Float32
    public var top: Float32
    public var bottom: Float32
    
    public init(left: Float32, right: Float32, top: Float32, bottom: Float32) {
        self.left = left
        self.right = right
        self.top = top
        self.bottom = bottom
    }
}

public extension Margin {
    
    static let ZERO: Self = Self (
        left: 0.0,
        right: 0.0,
        top: 0.0,
        bottom: 0.0
        )

    /// The same margin on every side.
    @inlinable
    func same(margin: Float32) -> Self {
        Self(
            left: margin,
            right: margin,
            top: margin,
            bottom: margin
            )
    }

    /// Margins with the same size on opposing sides
    @inlinable
    func symmetric(x: Float32, y: Float32) -> Self {
        Self(
            left: x,
            right: x,
            top: y,
            bottom: y
            )
    }

    /// Total margins on both sides
    @inlinable
    func sum() -> Vec2 {
        Vec2(x: self.left + self.right, y: self.top + self.bottom)
    }

    @inlinable
    func left_top() -> Vec2 {
        Vec2(x: self.left, y: self.top)
    }

    @inlinable
    func right_bottom() -> Vec2 {
        Vec2(x: self.right, y: self.bottom)
    }

    /// Are the margin on every side the same?
    @inlinable
    func is_same() -> Bool {
        self.left == self.right && self.left == self.top && self.left == self.bottom
    }

    @inlinable
    func expand_rect(rect: Rect) -> Rect {
//        Rect::from_min_max(rect.min - self.left_top(), rect.max + self.right_bottom())
        Rect(min: rect.min - self.left_top(), max: rect.max + self.right_bottom())
    }

    @inlinable
    func shrink_rect(rect: Rect) -> Rect {
//        Rect::from_min_max(rect.min + self.left_top(), rect.max - self.right_bottom())
        return Rect(min: rect.min + self.left_top(), max: rect.max - self.right_bottom())
    }
}
