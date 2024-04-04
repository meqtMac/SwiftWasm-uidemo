//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

// MARK: Checked

/// A position on screen.
///
/// Normally given in points (logical pixels).
///
/// Mathematically this is known as a "point", but the term position was chosen so not to
/// conflict with the unit (one point = X physical pixels).
public struct Pos2: Equatable, Hashable {
    /// How far to the right.
    public var x: Float32
    
    /// How far down.
    public var y: Float32
    // implicit w = 1
    
    public init(x: Float32, y: Float32) {
        self.x = x
        self.y = y
    }
}

public extension Pos2 {
    /// The zero position, the origin.
    /// The top left corner in a GUI.
    /// Same as `Pos2(x: 0.0, y: 0.0)`.
    static let zero: Pos2 = Pos2(x: 0.0, y: 0.0)
    
    /// The vector from origin to this position.
    /// `p.toVec2()` is equivalent to `p - Pos2.zero`.
    @inline(__always)
    func toVec2() -> Vec2 {
        return Vec2(x: self.x, y: self.y)
    }
    
    @inlinable
    func distance(to other: Pos2) -> Float {
        return (self - other).length()
    }
    
    @inlinable
    func distanceSquared(to other: Pos2) -> Float {
        return (self - other).lengthSquared()
    }
    
    @inline(__always)
    func floor() -> Pos2 {
        return Pos2(x: x.rounded(.down), y: y.rounded(.down))
    }
    
    @inline(__always)
    func rounded() -> Pos2 {
        return Pos2(x: x.rounded(), y: y.rounded())
    }
    
    @inline(__always)
    func ceil() -> Pos2 {
        return Pos2(x: x.rounded(.up), y: y.rounded(.up))
    }
    
    /// True if all members are also finite.
    @inline(__always)
    func isFinite() -> Bool {
        return self.x.isFinite && self.y.isFinite
    }
    
    /// True if any member is NaN.
    @inline(__always)
    func anyNaN() -> Bool {
        return self.x.isNaN || self.y.isNaN
    }
    
    @inlinable
    func min(_ other: Self) -> Self {
        Pos2(x: Swift.min(x, other.x), y: Swift.min(y, other.y))
    }
    
    @inlinable
    func max(_ other: Self) -> Self {
        Pos2(x: Swift.max(x, other.x), y: Swift.max(y, other.y))
    }
    
    @inlinable
    func clamped(to min: Pos2, max: Pos2) -> Pos2 {
        Pos2(x: x.clamped(min: min.x, max: max.x), y: y.clamped(min: min.y, max: max.y))
    }
    
    /// Linearly interpolate towards another point, so that `0.0 => self, 1.0 => other`.
    func interpolated(to other: Pos2, t: Float32) -> Pos2 {
        Pos2(x: lerp(x...other.x, t), y: lerp(y...other.y, t))
        
    }
}

public extension Pos2 {
    @inline(__always)
    static func += (lhs: inout Pos2, rhs: Vec2) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }
    
    
    @inline(__always)
    static func += (lhs: inout Pos2, rhs: Pos2) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }
 
    
    @inline(__always)
    static func -= (lhs: inout Pos2, rhs: Vec2) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }
    
    @inline(__always)
    static func + (lhs: Pos2, rhs: Vec2) -> Pos2 {
        return Pos2(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    @inline(__always)
    static func - (lhs: Pos2, rhs: Pos2) -> Vec2 {
        return Vec2(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    @inline(__always)
    static func - (lhs: Pos2, rhs: Vec2) -> Pos2 {
        return Pos2(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    @inline(__always)
    static func * (lhs: Pos2, rhs: Float) -> Pos2 {
        return Pos2(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    @inline(__always)
    static func * (lhs: Float, rhs: Pos2) -> Pos2 {
        return Pos2(x: lhs * rhs.x, y: lhs * rhs.y)
    }
    
    @inline(__always)
    static func / (lhs: Pos2, rhs: Float) -> Pos2 {
        return Pos2(x: lhs.x / rhs, y: lhs.y / rhs)
    }
}
