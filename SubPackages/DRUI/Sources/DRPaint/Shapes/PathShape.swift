//
//  PathShape.swift
//
//
//  Created by 蒋艺 on 2024/4/5.
//

import DRMath
import DRColor

/// A path which can be stroked and/or filled (if closed).
public struct PathShape {
    /// Filled paths should prefer clockwise order.
    public var points: [Pos2]

    /// If true, connect the first and last of the points together.
    /// This is required if `fill != TRANSPARENT`.
    public var closed: Bool

    /// Fill is only supported for convex polygons.
    public var fill: Color32

    /// Color and thickness of the line.
    public var stroke: Stroke
    // TODO(emilk): Add texture support either by supplying uv for each point,
    // or by some transform from points to uv (e.g. a callback or a linear transform matrix).
}


public extension PathShape {
   // line
    // closed_line
    // convex_polygon
    // visual_bounding_rect
}


