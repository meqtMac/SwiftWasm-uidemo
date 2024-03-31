//
//  Vec2.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

import Foundation

/// A vector has a direction and length.
/// A [`Vec2`] is often used to represent a size.
///
/// emath represents positions using [`crate::Pos2`].
///
/// Normally the units are points (logical pixels).
@frozen
public struct Vec2: Equatable, Hashable {
    public var x: Float32
    public var y: Float32
    
    public init(x: Float32, y: Float32) {
        self.x = x
        self.y = y
    }
    
    public init(_ x: Float32, _ y: Float32) {
        self.x = x
        self.y = y
    }
    
}

public extension Vec2 {
    static let zero = Vec2(0, 0)
    static let infinity = Self.splat(.infinity)
    static let x = Vec2(1, 0)
    static let y = Vec2(0, 1)
    static let right = Vec2(1, 0)
    static let left = Vec2(-1, 0)
    static let up = Vec2(0, -1)
    static let down = Vec2(0, 1)
    
    
    @inlinable
    static func splat(_ v: Float32) -> Self {
        Vec2(v, v)
    }
    
    @inlinable
    var pos2: Pos2 {
        Pos2(x, y)
    }
    
    // Safe normalize: returns zero if input is zero.
    @inlinable
    func normalized() -> Self {
        let len = self.length()
        return len > 0.0 ? Vec2(x/len, y/len) : .zero  // Use Vec2.zero instead of self
    }
    
    // Rotates the vector by 90°, i.e positive X to positive Y
    // (clockwise in egui coordinates).
    @inlinable
    func rot90ed() -> Self {
        Vec2(x: y, y: -x)
    }
    
    @inlinable
    func length() -> Float32 {
        hypotf(x, y)
    }
    
    @inlinable
    func lengthSq() -> Float32 {
        x * x + y * y
    }
    
    @inlinable func angle() -> Float32{
            return atan2(y, x)
        }

    @inlinable static func angled(angle: Float) -> Self {
        return Self(x: sin(angle), y: cos(angle))
    }
    
//    @inlinable func floor() -> Self {
//        return Self(x: Swift.floor(x), y: Swift.floor(y))
//    }
//    
//    @inlinable func round() -> Self {
//        return Self(x: Swift.round(x), y: Swift.round(y))
//    }
//    
//    @inlinable func ceil() -> Self {
//        return Self(x: Swift.ceil(x), y: Swift.ceil(y))
//    }
    
    @inlinable func abs() -> Self {
        return Self(x: Swift.abs(x), y: Swift.abs(y))
    }
    
    @inlinable var isFinite: Bool {
        return x.isFinite && y.isFinite
    }
    
    @inlinable var isNaN: Bool {
        return x.isNaN || y.isNaN
    }
    
    @inlinable func min(other: Self) -> Self {
        return Self(x: Swift.min(x, other.x), y: Swift.min(y, other.y))
    }
    
    @inlinable func max(other: Self) -> Self {
        return Self(x: Swift.max(x, other.x), y: Swift.max(y, other.y))
    }
    
    @inlinable func dot(other: Self) -> Float32{
        return x * other.x + y * other.y
    }
    
    @inlinable var minElem: Float32{
        return Swift.min(x, y)
    }
    
    @inlinable var maxElem: Float32{
        return Swift.max(x, y)
    }
    
    @inlinable func yx() -> Self {
        return Self(x: y, y: x)
    }
    
//    @inlinable func clamp(min: Self, max: Self) -> Self {
//        return Self(x: x.clamp(min.x, max.x), y: y.clamp(min.y, max.y))
//    }
}

extension Vec2: AdditiveArithmetic {
    public static func - (lhs: Vec2, rhs: Vec2) -> Vec2 {
        Vec2(lhs.x - rhs.x, lhs.y - lhs.y)
    }
    
    public static func + (lhs: Vec2, rhs: Vec2) -> Vec2 {
        Vec2(lhs.x + rhs.x, lhs.y + lhs.y)
    }
}

public extension Vec2 {
    @inlinable
    static func / (lhs: Vec2, rhs: Float32) -> Vec2 {
        Vec2(lhs.x / rhs, lhs.y / rhs)
    }
    
    @inlinable
    static func * (lhs: Vec2, rhs: Float32) -> Vec2 {
        Vec2(lhs.x * rhs, lhs.y * rhs)
    }
    
    /// Element-wise division
    @inlinable
    static func / (lhs: Vec2, rhs: Vec2) -> Vec2 {
        Vec2(lhs.x / rhs.x, lhs.y / rhs.y)
    }
    
    /// Element-wise multiplication
    @inlinable
    static func * (lhs: Vec2, rhs: Vec2) -> Vec2 {
        Vec2(lhs.x * rhs.x, lhs.y * rhs.y)
    }
    
    @inlinable
    static func /= (lhs: inout Vec2, rhs: Float32) {
        lhs = Vec2(lhs.x / rhs, lhs.y / rhs)
    }
    
    @inlinable
    static func *= (lhs: inout Vec2, rhs: Float32) {
        lhs = Vec2(lhs.x * rhs, lhs.y * rhs)
    }
    
    /// Element-wise division
    @inlinable
    static func /= (lhs: inout Vec2, rhs: Vec2) {
        lhs = Vec2(lhs.x / rhs.x, lhs.y / rhs.y)
    }
    
    /// Element-wise multiplication
    @inlinable
    static func *= (lhs: inout Vec2, rhs: Vec2) {
        lhs = Vec2(lhs.x * rhs.x, lhs.y * rhs.y)
    }
    
}

