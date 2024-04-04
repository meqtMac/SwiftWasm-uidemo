//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/4/4.
//

import DRMath

@usableFromInline
struct PathPoint {
    var pos: Pos2
    
    /// For filled paths the normal is used for anti-aliasing (both strokes and filled areas).
    ///
    /// For strokes the normal is also used for giving thickness to the path
    /// (i.e. in what direction to expand).
    ///
    /// The normal could be estimated by differences between successive points,
    /// but that would be less accurate (and in some cases slower).
    ///
    /// Normals are normally unit-length.
    var normal: Vec2
    
    init(pos: Pos2, normal: Vec2) {
        self.pos = pos
        self.normal = normal
    }
}

public enum PathType {
    case open
    case closed
}
