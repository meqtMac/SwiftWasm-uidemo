//
//  Vec2b.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

import Foundation


/// Two bools, one for each axis (X and Y).
@frozen
public struct Vec2b {
    public let x: Bool
    public let y: Bool
    
    public init(x: Bool, y: Bool) {
        self.x = x
        self.y = y
    }
    
    public init(_ x: Bool, _ y: Bool) {
        self.x = x
        self.y = y
    }
 
}
