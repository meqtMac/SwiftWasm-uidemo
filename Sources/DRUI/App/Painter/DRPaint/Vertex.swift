//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/26.
//

import Foundation

/// The 2D vertex type.
///
/// Should be friendly to send to GPU as is.
@frozen
public struct Vertex {
    /// Logical pixel coordinates (points).
    /// (0,0) is the top left corner of the screen.
    public var pos: Pos2
    
    /// Normalized texture coordinates.
    /// (0, 0) is the top left corner of the texture.
    /// (1, 1) is the bottom right corner of the texture.
    public var uv: Pos2
    
    /// sRGBA with premultiplied alpha
    public var color: Color32
    
    public init(pos: Pos2, uv: Pos2, color: Color32) {
        self.pos = pos
        self.uv = uv
        self.color = color
    }
}


