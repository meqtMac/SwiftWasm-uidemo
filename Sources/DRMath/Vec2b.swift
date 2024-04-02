//
//  Vec2b.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//
// MARK: Checked
import RustHelper

/// Two bools, one for each axis (X and Y).
@frozen
public struct Vec2b: Equatable, Hashable {
    public var x: Bool
    public var y: Bool
    
    public init(x: Bool, y: Bool) {
        self.x = x
        self.y = y
    }
    
}

public extension Vec2b {
    static let `false` = Vec2b(x: false, y: false)
    static let `true` = Vec2b(x: true, y: true)
    
    @inlinable
    func any() -> Bool {
        x || y
    }
    
    /// Are both `x` and `y` true?
    @inlinable
    func all() -> Bool {
        x && y
    }
    
    @inlinable
    func and(_ other: some Into<Self>)  -> Vec2b {
        let other = other.into()
        return Vec2b(x: x && other.x, y: y && other.y)
    }
    
    @inlinable
    func or(_ other: some Into<Self>) -> Vec2b {
        let other = other.into()
        return Vec2b(x: x || other.x, y: y || other.y)
    }
   
}

public extension Vec2b {
    
    @inlinable
    static prefix func ! (operand: Vec2b) -> Vec2b {
        Vec2b(x: !operand.x, y: !operand.y)
    }
}
