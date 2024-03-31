//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/26.
//

/// A position on screen.
///
/// Normally given in points (logical pixels).
///
/// Mathematically this is known as a "point", but the term position was chosen so not to
/// conflict with the unit (one point = X physical pixels).
@frozen // Recommended for small structs with fixed size
public struct Pos2: Equatable, Hashable {
    /// How far to the right.
    public var x: Float32
    
    /// How far down.
    public var y: Float32
    
    // implicit w = 1
    public init(_ x: Float32, _ y: Float32) {
        self.x = x
        self.y = y
    }
    
    public init(x: Float32, y: Float32) {
        self.x = x
        self.y = y
    }
}

public extension Pos2 {
    static let zero = Pos2(x: 0, y: 0)
    
    @inlinable
    func min(_ other: Self) -> Self {
        Pos2(x: Swift.min(x, other.x), y: Swift.min(y, other.y))
    }
    
    @inlinable
    func max(_ other: Self) -> Self {
        Pos2(x: Swift.max(x, other.x), y: Swift.max(y, other.y))
    }
    
}

extension Pos2: AdditiveArithmetic {
    public static func - (lhs: Self, rhs: Self) -> Self {
        Pos2(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public static func + (lhs: Self, rhs: Self) -> Self {
        Pos2(lhs.x + rhs.x, lhs.y + rhs.y)
    }
}


public extension Pos2 {
    @inlinable
    static func / (lhs: Pos2, rhs: Float32) -> Pos2 {
        Pos2(lhs.x / rhs, lhs.y / rhs)
    }
    
    @inlinable
    static func * (lhs: Pos2, rhs: Float32) -> Pos2 {
        Pos2(lhs.x * rhs, lhs.y * rhs)
    }
    
    /// Element-wise division
    @inlinable
    static func / (lhs: Pos2, rhs: Pos2) -> Pos2 {
        Pos2(lhs.x / rhs.x, lhs.y / rhs.y)
    }
    
    /// Element-wise multiplication
    @inlinable
    static func * (lhs: Pos2, rhs: Pos2) -> Pos2 {
        Pos2(lhs.x * rhs.x, lhs.y * rhs.y)
    }
    
    @inlinable
    static func /= (lhs: inout Pos2, rhs: Float32) {
        lhs = Pos2(lhs.x / rhs, lhs.y / rhs)
    }
    
    @inlinable
    static func *= (lhs: inout Pos2, rhs: Float32) {
        lhs = Pos2(lhs.x * rhs, lhs.y * rhs)
    }
    
    /// Element-wise division
    @inlinable
    static func /= (lhs: inout Pos2, rhs: Pos2) {
        lhs = Pos2(lhs.x / rhs.x, lhs.y / rhs.y)
    }
    
    /// Element-wise multiplication
    @inlinable
    static func *= (lhs: inout Pos2, rhs: Pos2) {
        lhs = Pos2(lhs.x * rhs.x, lhs.y * rhs.y)
    }
}

