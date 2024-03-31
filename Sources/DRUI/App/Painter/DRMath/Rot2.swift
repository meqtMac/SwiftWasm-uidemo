//
//  Rot2.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

import Foundation

// {s, c} represents the rotation matrix:
//
// | c -s |
// | s  c |
//
// `vec2(c, s)` represents where the X axis will end up after rotation.

/// Represents a rotation in the 2D plane.
///
/// A rotation of 𝞃/4 = 90° rotates the X axis to the Y axis.
///
/// Normally a `Rot2` is normalized (unit-length).
/// If not, it will also scale vectors.
@frozen // Recommended for value types
public struct Rot2 {
    
    /// Sine of the rotation angle
    public let s: Float
    
    /// Cosine of the rotation angle
    public let c: Float
    
    public init(s: Float, c: Float) {
        self.s = s
        self.c = c
    }
    
}

// Default implementation for Rot2
public extension Rot2 {
    /// Identity rotation
    static let identity: Rot2 = Rot2(s: 0.0, c: 1.0)
    
    
    /// Angle is clockwise in radians.
    /// A 𝞃/4 = 90° rotation means rotating the X axis to the Y axis.
    @inlinable
    static func fromAngle(_ angle: Float32) -> Rot2 {
        Rot2(s: sin(angle), c: cos(angle))
    }
    
    @inlinable 
    func angle() -> Float32 {
        return atan2(s, c)
    }
    
    /// The factor by which vectors will be scaled.
    @inlinable 
    var length: Float32 {
        hypot(c, s)
    }
    
    @inlinable 
   func lengthSquared() -> Float32 {
        return c * c + s * s
    }
    
    @inlinable 
   func isFinite() -> Bool {
        return c.isFinite && s.isFinite
    }
    
    /// Inverse rotation
    @inlinable
    func inverse() -> Rot2 {
        return Rot2(s: -s/lengthSquared(), c: c/lengthSquared())
    }
    
    /// Normalized rotation (unit-length)
    @inlinable
    func normalized() -> Rot2 {
        let l = length
        let ret = Rot2(
            s: s / l,
            c: c / l
        )
        assert(ret.isFinite(), "Normalized rotation should be finite")
        return ret
    }
}

// Custom string representation for debugging
extension Rot2: CustomDebugStringConvertible {
    public var debugDescription: String {
        return String(format: "Rot2 {{ angle: %.1f°, length: %f }}", angle() * 180 / .pi, length)
    }
}

// Rot2 multiplication with another Rot2
public extension Rot2 {
    
    @inlinable
    static func * (lhs: Self, rhs: Self) -> Self {
        /*
         |lc -ls| * |rc -rs|
         |ls  lc|  |rs  rc|
         */
        return Self(
            s: lhs.s * rhs.c + lhs.c * rhs.s,
            c: lhs.c * rhs.c - lhs.s * rhs.s
        )
    }
    
    @inlinable
    static func  * (lhs: Self , rhs: Vec2) -> Vec2 {
        Vec2(
            x: lhs.c * rhs.x - lhs.s * rhs.y,
            y: lhs.s * rhs.x + lhs.c * rhs.y
        )
    }
    
    @inlinable
    static func  * (lhs: Self , rhs: Pos2) -> Pos2 {
        Pos2(
            x: lhs.c * rhs.x - lhs.s * rhs.y,
            y: lhs.s * rhs.x + lhs.c * rhs.y
        )
    }
 
}

//// Rot2 multiplication with Vec2 (rotates the vector)
//impl Mul for Rot2 {
//    typealias Output = Vec2
//    
//    @inlinable public func multiplied(by rhs: Vec2) -> Vec2 {
//        return Vec2(x: c * rhs.x - s * rhs.y, y: s * rhs.x + c * rhs.y)
//    }
//}

//// Scaling a Rot2 with a scalar
//impl Mul<Float> for Rot2 {
//    typealias Output = Rot2
//    
//    @inlinable public func multiplied(by rhs: Float) -> Rot2 {
//        return Rot2(c: c * rhs, s: s * rhs)
//    }
//}

//// Scaling a Rot2 with a scalar
//impl Mul for Float {
//    typealias Output = Rot2
//    
//    @inlinable public func multiplied(by rhs: Rot2) -> Rot2 {
//        return Rot2(c: self * rhs.c, s: self * rhs.s)
//    }
//}

//// Dividing a Rot2 with a scalar
//impl Div<Float> for Rot2 {
//    typealias Output = Rot2
//    
//    @
