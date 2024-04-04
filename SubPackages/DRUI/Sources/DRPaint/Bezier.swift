//
//  Bezier.swift
//
//
//  Created by 蒋艺 on 2024/4/3.
//

import DRMath
import DRColor

/// A cubic [Bézier Curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve).
///
/// See also [`QuadraticBezierShape`].
public struct CubicBezierShape {
    /// The first point is the starting point and the last one is the ending point of the curve.
    /// The middle points are the control points.
    public var points: (Pos2, Pos2, Pos2, Pos2)
    public var closed: Bool

    public var fill: Color32
    public var stroke: Stroke
}

/// A quadratic [Bézier Curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve).
///
/// See also [`CubicBezierShape`].
public struct QuadraticBezierShape {
    /// The first point is the starting point and the last one is the ending point of the curve.
    /// The middle point is the control points.
    public var points: (Pos2, Pos2, Pos2)
    public var closed: Bool

    public var fill: Color32
    public var stroke: Stroke
}

