//
//  Stroke.swift
//
//
//  Created by 蒋艺 on 2024/4/3.
//

// MARK: - Checked

import DRMath
import DRColor


public struct Stroke: Hashable {
    public var width: Float32
    public var color: Color32
    init(width: Float32, color: Color32) {
        self.width = width
        self.color = color
    }
}

public extension Stroke {
    static let none = Stroke(width: 0, color: .transparent)
    
    /// True if width is zero or color is transparent
    func is_empty() -> Bool {
        width <= 0.0 || self.color == .transparent
    }
    
    
}
