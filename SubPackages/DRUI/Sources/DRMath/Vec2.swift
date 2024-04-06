//
//  Vec2.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

// MARK: Checked
// TODO: Testing

/// A vector has a direction and length.
/// A `Vec2` is often used to represent a size.
///
/// emath represents positions using `Pos2`.
///
/// Normally the units are points (logical pixels).
@frozen
public struct Vec2: Equatable, Hashable {
    /// Rightwards. Width.
    public var x: Float
    
    /// Downwards. Height.
    public var y: Float
    
    @inlinable
    public init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
    
    /// Set both `x` and `y` to the same value.
    init(splat: Float) {
        self.x = splat
        self.y = splat
    }
    
}

// ----------------------------------------------------------------------------
// Compatibility and convenience conversions to and from (Float, Float):

// No conversion needed for tuples

// ----------------------------------------------------------------------------
// Mint compatibility and convenience conversions

//#if canImport(CoreGraphics)
//import CoreGraphics
//
//extension Vec2 {
//    init(_ v: CGPoint) {
//        x = Float(v.x)
//        y = Float(v.y)
//    }
//
//    init(_ v: CGSize) {
//        x = Float(v.width)
//        y = Float(v.height)
//    }
//
//    var asCGPoint: CGPoint {
//        CGPoint(x: CGFloat(x), y: CGFloat(y))
//    }
//
//    var asCGSize: CGSize {
//        CGSize(width: CGFloat(x), height: CGFloat(y))
//    }
//}
//#endif

// ----------------------------------------------------------------------------

public extension Vec2 {
    
    static let x = Vec2(x: 1.0, y: 0.0)
    static let y = Vec2(x: 0.0, y: 1.0)
    
    static let righr = Vec2(x: 1.0, y: 0.0)
    static let left = Vec2(x: -1.0, y: 0.0)
    static let up = Vec2(x: 0.0, y: -1.0)
    static let down = Vec2(x: 0.0, y: 1.0)
    
    static let zero = Vec2(x: 0.0, y: 0.0)
    static let infinity = Vec2(splat: Float.infinity)
    
    
    /// Treat this vector as a position.
    /// `v.toPos2()` is equivalent to `Pos2.default + v`.
    @inline(__always)
    func toPos2() -> Pos2 {
        Pos2(x: x, y: y)
    }
    
    /// Safe normalize: returns zero if input is zero.
    @inline(__always)
    func normalized() -> Vec2 {
        let len = length()
        if len <= 0.0 {
            return self
        } else {
            return self / len
        }
    }
    
    /// Rotates the vector by 90°, i.e positive X to positive Y
    /// (clockwise in egui coordinates).
    @inline(__always)
    func rot90() -> Vec2 {
        Vec2(x: y, y: -x)
    }
    
    @inline(__always)
    func length() -> Float {
        x.hypot(y)
    }
    
    @inline(__always)
    func lengthSquared() -> Float {
        x * x + y * y
    }
    
    /// Measures the angle of the vector.
    @inline(__always)
    func angle() -> Float {
        x.atan2(y)
    }
    
    /// Create a unit vector with the given CW angle (in radians).
    /// * An angle of zero gives the unit X axis.
    /// * An angle of TAU/4 = 90° gives the unit Y axis.
    @inline(__always)
    static func angled(angle: Float) -> Vec2 {
        return Vec2(x: angle.cos(), y: angle.sin())
    }
    
    // FIXME: platform dependent impl
    @inline(__always)
    func floored() -> Vec2 {
        Vec2(x: x.floor(), y: y.floor())
    }
    
    @inline(__always)
    func rounded() -> Vec2 {
        Vec2(x: x.rounded(), y: y.rounded())
    }
    
    @inline(__always)
    func ceiled() -> Vec2 {
        Vec2(x: x.ceil(), y: y.ceil())
    }
    
    @inline(__always)
    func absoluted() -> Vec2 {
        Vec2(x: x.abs(), y: y.abs())
    }
    
    /// True if all members are also finite.
    @inline(__always)
    func isFinite() -> Bool {
        x.isFinite && y.isFinite
    }
    
    @inline(__always)
    func anyNan() -> Bool {
        x.isNaN && y.isNaN
    }
    
    
   @inline(__always)
    func min(_ other: Self) -> Self {
        Vec2(x: Swift.min(x, other.x), y: Swift.min(y, other.y))
    }
    
    @inline(__always)
    func max(_ other: Self) -> Self {
        Vec2(x: Swift.max(x, other.x), y: Swift.max(y, other.y))
    }
    
    
    /// The dot-product of two vectors.
    @inlinable
    func dot(_ other: Vec2) -> Float {
        x * other.x + y * other.y
    }
    
    @inline(__always)
    func minElem() -> Float {
        Swift.min(x, y)
    }
    
    @inline(__always)
    func maxElem() -> Float {
        Swift.max(x, y)
    }
    
    /// Swizzle the axes.
    @inlinable
    func yx() -> Vec2 {
        Vec2(x: y, y: x)
    }
    
    @inlinable
    func clamped(min: Vec2, max: Vec2) -> Vec2 {
        Vec2(x: x.clamped(min: min.x, max: max.x),
             y: y.clamped(min: min.y, max: max.y))
    }
}

public extension Vec2 {
    @inline(__always)
    static func += (lhs: inout Vec2, rhs: Vec2) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }
    
    @inline(__always)
    static func -= (lhs: inout Vec2, rhs: Vec2) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }
    
    @inline(__always)
    static func + (lhs: Vec2, rhs: Vec2) -> Vec2 {
        Vec2(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    @inline(__always)
    static func - (lhs: Vec2, rhs: Vec2) -> Vec2 {
        Vec2(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    @inline(__always)
    static prefix func -(operand: Vec2) -> Vec2 {
        Vec2(x: -operand.x, y: -operand.y)
    }

    @inline(__always)
    static func * (lhs: Vec2, rhs: Vec2) -> Vec2 {
        Vec2(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
    }
    
    @inline(__always)
    static func / (lhs: Vec2, rhs: Vec2) -> Vec2 {
        Vec2(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
    }
}

public extension Vec2 {
    @inline(__always)
    static func *= (lhs: inout Vec2, rhs: Float) {
        lhs.x *= rhs
        lhs.y *= rhs
    }
    
    @inline(__always)
    static func /= (lhs: inout Vec2, rhs: Float) {
        lhs.x /= rhs
        lhs.y /= rhs
    }
    
    @inline(__always)
    static func * (lhs: Vec2, rhs: Float) -> Vec2 {
        Vec2(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    @inline(__always)
    static func * (lhs: Float, rhs: Vec2) -> Vec2 {
        Vec2(x: lhs * rhs.x, y: lhs * rhs.y)
    }
    
    @inline(__always)
    static func / (lhs: Vec2, rhs: Float) -> Vec2 {
        Vec2(x: lhs.x / rhs, y: lhs.y / rhs)
    }
    
    
}
