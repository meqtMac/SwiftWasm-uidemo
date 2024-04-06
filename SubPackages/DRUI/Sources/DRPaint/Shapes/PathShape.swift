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

    public init(
        points: [Pos2], 
        closed: Bool, 
        fill: Color32, 
        stroke: Stroke
    ) {
        self.points = points
        self.closed = closed
        self.fill = fill
        self.stroke = stroke
    }
}


public extension PathShape {
    /// A line through many points.
    ///
    /// Use [`Shape::line_segment`] instead if your line only connects two points.
    @inlinable
    static func line(points: [Pos2], stroke: Stroke) -> Self {
       return Self.init(points: points, closed: false, fill: .transparent, stroke: stroke)
    }

    // closed_line
    /// A line that closes back to the start point again.
    @inlinable
    static func closed_line(points: Array<Pos2>, stroke: Stroke) -> Self {
       return Self(points: points, closed: true, fill: .transparent, stroke: stroke)
    }


    /// A convex polygon with a fill and optional stroke.
    ///
    /// The most performant winding order is clockwise.
    @inlinable
    static func convex_polygon(
        points: Array<Pos2>,
        fill: Color32,
        stroke: Stroke
    ) -> Self {
        return Self(points: points, closed: true, fill: fill, stroke: stroke)
    }

    /// The visual bounding rectangle (includes stroke width)
    @inlinable
    func visual_bounding_rect() -> Rect {
       if self.fill == .transparent && self.stroke.isEmpty() {
            return .nothing
        } else {
            return Rect(points: self.points).expand(by: self.stroke.width / 2.0)
        }
    }

}


