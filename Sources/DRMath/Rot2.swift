//
//  Rot2.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//
// MARK: Checked

import Foundation

/// Represents a rotation in the 2D plane.
///
/// A rotation of π/4 = 90° rotates the X axis to the Y axis.
///
/// Normally a `Rot2` is normalized (unit-length).
/// If not, it will also scale vectors.
@frozen
public struct Rot2 {
    /// angle.sin()
    public let s: Float
    
    /// angle.cos()
    public let c: Float
    
    @inlinable
    public init(s: Float, c: Float) {
        self.s = s
        self.c = c
    }
    
    /// Angle is clockwise in radians.
    /// A 𝞃/4 = 90° rotation means rotating the X axis to the Y axis.
   @inlinable
    public init(angle: Float32) {
        self.s = sin(angle)
        self.c = cos(angle)
    }
    
    
}

public extension Rot2 {
    
    /// Identity rotation
    static let identity = Rot2(s: 0.0, c: 1.0)
    
    @inlinable
    func angle() -> Float {
        return atan2(self.s, self.c)
    }
    
    /// The factor by which vectors will be scaled.
    @inlinable
    func length() -> Float {
        return hypot(self.c, self.s)
    }
    
    func lengthSquared() -> Float {
        return c * c + s * s
    }
    
    @inlinable
    func isFinite() -> Bool {
        return c.isFinite && s.isFinite
    }
    
    @inlinable
    func inverse() -> Rot2 {
        let lengthSquared = lengthSquared()
        return Rot2(s: -s, c: c) / lengthSquared
    }
    
    @inlinable
    func normalized() -> Rot2 {
        let l = self.length()
        let ret = Rot2(s: self.s / l, c: self.c / l)
        assert(ret.isFinite())
        return ret
    }
}

public extension Rot2 {
    @inlinable
    static func * (lhs: Self, rhs: Self) -> Self {
        /*
         |lc -ls| * |rc -rs|
         |ls  lc|   |rs  rc|
         */
        Rot2(
            s: lhs.s * rhs.c + lhs.c * rhs.s,
            c: lhs.c * rhs.c - lhs.s * rhs.s
        )
    }
    
    @inlinable
    static func * (lhs: Self, rhs: Vec2) -> Vec2 {
        Vec2(
            x: lhs.c * rhs.x - lhs.s * rhs.y ,
            y: lhs.s * rhs.x + lhs.c * rhs.y
        )
    }
    
    @inlinable
    static func * (lhs: Self, rhs: Float32) -> Rot2 {
        Rot2(s: lhs.s * rhs, c: lhs.c * rhs)
    }
    
    @inlinable
    static func / (lhs: Self, rhs: Float32) -> Rot2 {
        Rot2(s: lhs.s / rhs, c: lhs.c / rhs)
    }
}
