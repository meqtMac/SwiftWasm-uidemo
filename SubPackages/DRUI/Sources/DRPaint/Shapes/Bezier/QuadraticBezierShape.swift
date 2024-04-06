//
//  Bezier.swift
//
//
//  Created by 蒋艺 on 2024/4/3.
//

import DRMath
import DRColor
import Foundation






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
    
    /// Create a new quadratic Bézier shape based on the 3 points and stroke.
    ///
    /// The first point is the starting point and the last one is the ending point of the curve.
    /// The middle point is the control points.
    /// The points should be in the order [start, control, end]
    public init(
        points: (Pos2, Pos2, Pos2),
        closed: Bool,
        fill: Color32,
        stroke: Stroke) {
            self.points = points
            self.closed = closed
            self.fill = fill
            self.stroke = stroke
        }
}

public extension QuadraticBezierShape {
    
    /// Transform the curve with the given transform.
    func transform(_ rectTrans: RectTransform) -> Self {
        var points = (Pos2.zero, Pos2.zero, Pos2.zero)
        // for (i, origin_point) in self.points.enumrated()
        points.0 = rectTrans * self.points.0
        points.1 = rectTrans * self.points.1
        points.2 = rectTrans * self.points.2
        
        return Self(points: points, closed: self.closed, fill: self.fill, stroke: self.stroke)
    }
    
    /// Convert the quadratic Bézier curve to one [`PathShape`].
    /// The `tolerance` will be used to control the max distance between the curve and the base line.
    func to_path_shape(tolerance: Float32) -> PathShape {
        let points = self.flatten(tolerance: tolerance)
        return PathShape(
            points: points,
            closed: self.closed,
            fill: self.fill,
            stroke: self.stroke
        )
    }
    
    
    /// The visual bounding rectangle (includes stroke width)
    func visual_bounding_rect() -> Rect {
        if self.fill == .transparent && self.stroke.is_empty() {
            return .nothing
        } else {
            // self.logical_bounding_rect().expand(self.stroke.width / 2.0)
            return self.logical_bounding_rect()
                .expand(by: self.stroke.width / 2.0)
        }
    }
    
    
    
    /// Logical bounding rectangle (ignoring stroke width)
    func logical_bounding_rect() -> Rect {
        var (min_x, max_x): (Float32, Float32) = if self.points.0.x < self.points.2.x {
            (self.points.0.x, self.points.2.x)
        } else {
            (self.points.2.x, self.points.0.x)
        }
        
        var (min_y, max_y): (Float32, Float32) = if self.points.0.y < self.points.2.y {
            (self.points.0.y, self.points.2.y)
        } else {
            (self.points.2.y, self.points.0.y)
        }
        
        
        quadratic_for_each_local_extremum(
            p0: self.points.0.x,
            p1: self.points.1.x,
            p2: self.points.2.x
        ) { t in
            let x = self.sample(t).x
            if x < min_x {
                min_x = x
            }
            if x > max_x {
                max_x = x
            }
        }
        
        quadratic_for_each_local_extremum(
            p0: self.points.0.y,
            p1: self.points.1.y,
            p2: self.points.2.y
        ) { t in
            let y = self.sample(t).y
            min_y = min(min_y, y)
            max_y = max(max_y, y)
        }
        
        return Rect(
            min: Pos2(x: min_x, y: min_y),
            max: Pos2(x: max_x, y: max_y)
        )
    }
    
    
    /// Calculate the point (x,y) at t based on the quadratic Bézier curve equation.
    /// t is in [0.0,1.0]
    /// [Bézier Curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve#Quadratic_B.C3.A9zier_curves)
    ///
    func sample(_ t: Float32) -> Pos2 {
        assert(t >= 0.0 && t <= 1.0, "the sample value should be in [0.0,1.0]")
        let h = 1.0 - t
        let a = t * t
        let b = 2.0 * t * h
        let c = h * h
        let result = self.points.2.toVec2() * a + self.points.1.toVec2() * b + self.points.0.toVec2() * c
        return result.toPos2()
    }
    
    /// find a set of points that approximate the quadratic Bézier curve.
    /// the number of points is determined by the tolerance.
    /// the points may not be evenly distributed in the range [0.0,1.0] (t value)
    func flatten(tolerance: Float32?) -> [Pos2] {
        let tolerance = tolerance ?? abs(self.points.0.x - self.points.2.x) * 0.001
        var result = [self.points.0]
        self.for_each_flattened_with_t(tolerance: tolerance) { p, _ in
            result.append(p)
        }
        
        return result
    }
    
    // copied from https://docs.rs/lyon_geom/latest/lyon_geom/
    /// Compute a flattened approximation of the curve, invoking a callback at
    /// each step.
    ///
    /// The callback takes the point and corresponding curve parameter at each step.
    ///
    /// This implements the algorithm described by Raph Levien at
    /// <https://raphlinus.github.io/graphics/curves/2019/12/23/flatten-quadbez.html>
    func for_each_flattened_with_t(tolerance: Float32, callback: (Pos2, Float32) -> Void) {
        let params = FlatteningParameters.from_curve(curve: self, tolerance: tolerance)
        if params.is_point {
            return
        }
        
        let count = UInt32(params.count)
        for index in 1..<count {
            let t = params.t_at_iteration(iteration: Float32(index))
            callback(self.sample( t), t)
        }
        
        callback(self.sample(1.0), 1.0)
    }
    
}


// from lyon_geom::quadratic_bezier.rs
// copied from https://docs.rs/lyon_geom/latest/lyon_geom/
fileprivate struct FlatteningParameters {
    var count: Float32
    var integral_from: Float32
    var integral_step: Float32
    var inv_integral_from: Float32
    var div_inv_integral_diff: Float32
    var is_point: Bool
}

extension FlatteningParameters {
    // https://raphlinus.github.io/graphics/curves/2019/12/23/flatten-quadbez.html
    internal static func from_curve(curve: QuadraticBezierShape, tolerance: Float32) -> Self {
        // Map the quadratic bézier segment to y = x^2 parabola.
        let from = curve.points.0
        let ctrl = curve.points.1
        let to = curve.points.2
        
        let ddx = 2.0 * ctrl.x - from.x - to.x
        let ddy = 2.0 * ctrl.y - from.y - to.y
        let cross = (to.x - from.x) * ddy + (ctrl.y - from.y) * ddy
        let inv_cross = 1.0 / cross;
        let parabola_from = ((ctrl.x - from.x) * ddx + (ctrl.y - from.y) * ddy) * inv_cross;
        let parabola_to = ((to.x - ctrl.x) * ddx + (to.y - ctrl.y) * ddy) * inv_cross;
        // Note, scale can be NaN, for example with straight lines. When it happens the NaN will
        // propagate to other parameters. We catch it all by setting the iteration count to zero
        // and leave the rest as garbage.
        let scale = abs(cross) / hypot(ddx, ddy) * abs(parabola_to - parabola_from)
        
        let integral_from = approx_parabola_integral(x: parabola_from)
        let integral_to = approx_parabola_integral(x: parabola_to)
        let integral_diff = integral_to - integral_from
        
        let inv_integral_from = approx_parabola_inv_integral(x: integral_from)
        let inv_integral_to = approx_parabola_inv_integral(x: integral_to)
        let div_inv_integral_diff = 1.0 / (inv_integral_to - inv_integral_from)
        
        // the original author thinks it can be stored as integer if it's not generic.
        // but if so, we have to handle the edge case of the integral being infinite.
        var count = (0.5 * abs(integral_diff)) * (scale / tolerance).squareRoot().rounded(.up)
        var is_point = false
        // If count is NaN the curve can be approximated by a single straight line or a point.
        if !count.isFinite {
            count = 0.0
            is_point = hypot(to.x - from.x, to.y - from.y) < tolerance * tolerance
        }
        
        let integral_step = integral_diff / count
        return FlatteningParameters(
            count: count,
            integral_from:
                integral_from,
            integral_step: integral_step,
            inv_integral_from: inv_integral_from,
            div_inv_integral_diff: div_inv_integral_diff,
            is_point: is_point
        )
    }
    
    
    internal func t_at_iteration(iteration: Float32) -> Float32 {
        let u = approx_parabola_inv_integral(x: self.integral_from + self.integral_step * iteration)
        return (u - self.inv_integral_from) * self.div_inv_integral_diff
    }
}


/// Compute an approximation to integral (1 + 4x^2) ^ -0.25 dx used in the flattening code.
fileprivate func approx_parabola_integral(x: Float32) -> Float32 {
    let d: Float32 = 0.67;
    let quarter: Float32 = 0.25;
    return x / (1.0 - d + (pow(d, 4) + quarter * x * x).squareRoot().squareRoot())
}

/// Approximate the inverse of the function above.
fileprivate func approx_parabola_inv_integral(x: Float32) -> Float32 {
    let b: Float32 = 0.39;
    let quarter: Float32 = 0.25;
    // return x * (1.0 - b + (b * b + quarter * x * x).s
    return x * (Float32(1.0) - b + ( b * b + quarter * x * x ).squareRoot() )
}



fileprivate func quadratic_for_each_local_extremum(p0: Float32, p1: Float32, p2: Float32, cb: (Float32) -> Void) {
    // A quadratic Bézier curve can be derived by a linear function:
    // p(t) = p0 + t(p1 - p0) + t^2(p2 - 2p1 + p0)
    // The derivative is:
    // p'(t) = (p1 - p0) + 2(p2 - 2p1 + p0)t or:
    // f(x) = a* x + b
    let a = p2 - 2.0 * p1 + p0;
    // let b = p1 - p0;
    // no need to check for zero, since we're only interested in local extrema
    if a == 0.0 {
        return;
    }
    
    let t = (p0 - p1) / a;
    if t > 0.0 && t < 1.0 {
        cb(t);
    }
}

