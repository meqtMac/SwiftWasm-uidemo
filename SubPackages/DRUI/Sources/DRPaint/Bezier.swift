//
//  Bezier.swift
//
//
//  Created by 蒋艺 on 2024/4/3.
//

import DRMath
import DRColor
import Foundation

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

    public init(
        points: (Pos2, Pos2, Pos2, Pos2),
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

public extension CubicBezierShape {

    /// Transform the curve with the given transform.
    func transform(_ rectTransform: RectTransform) -> Self {
       var points = (Pos2.zero, Pos2.zero, Pos2.zero, Pos2.zero)
        points.0 = rectTransform * self.points.0
        points.1 = rectTransform * self.points.1
        points.2 = rectTransform * self.points.2
        points.3 = rectTransform * self.points.3

        return Self(
            points: points, 
            closed: self.closed, 
            fill: self.fill, 
            stroke: self.stroke)
    }

    /// Convert the cubic Bézier curve to one or two [`PathShape`]'s.
    /// When the curve is closed and it has to intersect with the base line, it will be converted into two shapes.
    /// Otherwise, it will be converted into one shape.
    /// The `tolerance` will be used to control the max distance between the curve and the base line.
    /// The `epsilon` is used when comparing two floats.
    func to_path_shapes(tolerance: Float32?, epsilon: Float32) -> Array<PathShape> {
        var pathshapes: [PathShape] = []
        // var points_vec = self.flatten_closed
        // let mut pathshapes = Vec::new();
        // let mut points_vec = self.flatten_closed(tolerance, epsilon);
        // for points in points_vec.drain(..) {
        //     let pathshape = PathShape {
        //         points,
        //         closed: self.closed,
        //         fill: self.fill,
        //         stroke: self.stroke,
        //     };
        //     pathshapes.push(pathshape);
        // }
        // pathshapes
    }

        /// Find out the t value for the point where the curve is intersected with the base line.
    /// The base line is the line from P0 to P3.
    /// If the curve only has two intersection points with the base line, they should be 0.0 and 1.0.
    /// In this case, the "fill" will be simple since the curve is a convex line.
    /// If the curve has more than two intersection points with the base line, the "fill" will be a problem.
    /// We need to find out where is the 3rd t value (0<t<1)
    /// And the original cubic curve will be split into two curves (0.0..t and t..1.0).
    /// B(t) = (1-t)^3*P0 + 3*t*(1-t)^2*P1 + 3*t^2*(1-t)*P2 + t^3*P3
    /// or B(t) = (P3 - 3*P2 + 3*P1 - P0)*t^3 + (3*P2 - 6*P1 + 3*P0)*t^2 + (3*P1 - 3*P0)*t + P0
    /// this B(t) should be on the line between P0 and P3. Therefore:
    /// (B.x - P0.x)/(P3.x - P0.x) = (B.y - P0.y)/(P3.y - P0.y), or:
    /// B.x * (P3.y - P0.y) - B.y * (P3.x - P0.x) + P0.x * (P0.y - P3.y) + P0.y * (P3.x - P0.x) = 0
    /// B.x = (P3.x - 3 * P2.x + 3 * P1.x - P0.x) * t^3 + (3 * P2.x - 6 * P1.x + 3 * P0.x) * t^2 + (3 * P1.x - 3 * P0.x) * t + P0.x
    /// B.y = (P3.y - 3 * P2.y + 3 * P1.y - P0.y) * t^3 + (3 * P2.y - 6 * P1.y + 3 * P0.y) * t^2 + (3 * P1.y - 3 * P0.y) * t + P0.y
    /// Combine the above three equations and iliminate B.x and B.y, we get:
    /// t^3 * ( (P3.x - 3*P2.x + 3*P1.x - P0.x) * (P3.y - P0.y) - (P3.y - 3*P2.y + 3*P1.y - P0.y) * (P3.x - P0.x))
    /// + t^2 * ( (3 * P2.x - 6 * P1.x + 3 * P0.x) * (P3.y - P0.y) - (3 * P2.y - 6 * P1.y + 3 * P0.y) * (P3.x - P0.x))
    /// + t^1 * ( (3 * P1.x - 3 * P0.x) * (P3.y - P0.y) - (3 * P1.y - 3 * P0.y) * (P3.x - P0.x))
    /// + (P0.x * (P3.y - P0.y) - P0.y * (P3.x - P0.x)) + P0.x * (P0.y - P3.y) + P0.y * (P3.x - P0.x)
    /// = 0
    /// or a * t^3 + b * t^2 + c * t + d = 0
    ///
    /// let x = t - b / (3 * a), then we have:
    /// x^3 + p * x + q = 0, where:
    /// p = (3.0 * a * c - b^2) / (3.0 * a^2)
    /// q = (2.0 * b^3 - 9.0 * a * b * c + 27.0 * a^2 * d) / (27.0 * a^3)
    ///
    /// when p > 0, there will be one real root, two complex roots
    /// when p = 0, there will be two real roots, when p=q=0, there will be three real roots but all 0.
    /// when p < 0, there will be three unique real roots. this is what we need. (x1, x2, x3)
    ///  t = x + b / (3 * a), then we have: t1, t2, t3.
    /// the one between 0.0 and 1.0 is what we need.
    /// <`https://baike.baidu.com/item/%E4%B8%80%E5%85%83%E4%B8%89%E6%AC%A1%E6%96%B9%E7%A8%8B/8388473 /`>
    ///
    func find_cross_t( epsilon: Float32) -> Float32? {
        let p0 = self.points.0;
        let p1 = self.points.1;
        let p2 = self.points.2;
        let p3 = self.points.3;

        let a = (p3.x - 3.0 * p2.x + 3.0 * p1.x - p0.x) * (p3.y - p0.y)
            - (p3.y - 3.0 * p2.y + 3.0 * p1.y - p0.y) * (p3.x - p0.x);
        let b = (3.0 * p2.x - 6.0 * p1.x + 3.0 * p0.x) * (p3.y - p0.y)
            - (3.0 * p2.y - 6.0 * p1.y + 3.0 * p0.y) * (p3.x - p0.x);
        let c =
            (3.0 * p1.x - 3.0 * p0.x) * (p3.y - p0.y) - (3.0 * p1.y - 3.0 * p0.y) * (p3.x - p0.x);
        let d = p0.x * (p3.y - p0.y) - p0.y * (p3.x - p0.x)
            + p0.x * (p0.y - p3.y)
            + p0.y * (p3.x - p0.x);

        let h = -b / (3.0 * a);
        let p = (3.0 * a * c - b * b) / (3.0 * a * a);
        let q = (2.0 * b * b * b - 9.0 * a * b * c + 27.0 * a * a * d) / (27.0 * a * a * a);

        if p > 0.0 {
            return nil
        }
        let r = (-1.0 * (p / 3.0).powi(3)).sqrt();
        let theta = (-1.0 * q / (2.0 * r)).acos() / 3.0;

        let t1 = 2.0 * r.cbrt() * theta.cos() + h;
        let t2 = 2.0 * r.cbrt() * (theta + 120.0 * .pi / 180.0).cos() + h;
        let t3 = 2.0 * r.cbrt() * (theta + 240.0 * .pi / 180.0).cos() + h;

        if t1 > epsilon && t1 < 1.0 - epsilon {
            return t1;
        }
        if t2 > epsilon && t2 < 1.0 - epsilon {
            return t2;
        }
        if t3 > epsilon && t3 < 1.0 - epsilon {
            return t3;
        }
        return nil
    }



    /// find a set of points that approximate the cubic Bézier curve.
    /// the number of points is determined by the tolerance.
    /// the points may not be evenly distributed in the range [0.0,1.0] (t value)
    /// this api will check whether the curve will cross the base line or not when closed = true.
    /// The result will be a vec of vec of Pos2. it will store two closed aren in different vec.
    /// The epsilon is used to compare a float value.
    func flatten_closed(tolerance: Float32?, epsilon: Float32?) -> Array<Array<Pos2>> { 
        let tolerance = tolerance ?? abs(self.points.0.x - self.points.3.x) * 0.001
        let epsilon = epsilon ?? 1.0e-5
        var result: [[Pos2]] = []
        var first_hald: [Pos2] = []
        var second_half: [Pos2] = []
        var flipped = false

        first_hald.append(self.points.0)


    // }


    // from lyon_geom::cubic_bezier.rs
    /// Iterates through the curve invoking a callback at each point.
    func for_each_flattened_with_t(tolerance: Float32, callback: (Pos2, Float32) -> Void) {
        flatten_cubic_bezier_with_t(curve: self, tolerance: tolerance, callback: callback)
    }
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
        if self.fill == .transparent && self.stroke.isEmpty() {
            return .nothing
        } else {
            // self.logical_bounding_rect().expand(self.stroke.width / 2.0)
            return self.logical_bounding_rect()
                .expand(by: self.stroke.width / 2.0)
        }
    }



    /// Convert the quadratic Bézier curve to one [`PathShape`].
    /// The `tolerance` will be used to control the max distance between the curve and the base line.
    // func to_path_shape(tolerance: Float32?) -> PathShape {
    //     // let points = self.fl
    // }

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
            let x = self.sample(t: t).x
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
            let y = self.sample(t: t).y
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
    func sample(t: Float32) -> Pos2 {
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
            callback(self.sample(t: t), t)
        }

        callback(self.sample(t: 1.0), 1.0)
    }

}

// ----------------------------------------------------------------------------

// lyon_geom::flatten_cubic.rs
// copied from https://docs.rs/lyon_geom/latest/lyon_geom/
fileprivate func flatten_cubic_bezier_with_t(curve: CubicBezierShape, tolerance: Float32, callback: (Pos2, Float32) -> Void) {
    // debug_assert!(tolerance >= S::EPSILON * S::EPSILON);
    let quadratics_tolerance = tolerance * 0.2;
    let flattening_tolerance = tolerance * 0.8;
    // TODO: implementation

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

fileprivate func single_curve_approximation(curve: CubicBezierShape) -> QuadraticBezierShape {
    let c1_x = (curve.points.1.x * 3.0 - curve.points.0.x) * 0.5;
    let c1_y = (curve.points.1.y * 3.0 - curve.points.0.y) * 0.5;
    let c2_x = (curve.points.2.x * 3.0 - curve.points.3.x) * 0.5;
    let c2_y = (curve.points.2.y * 3.0 - curve.points.3.y) * 0.5;
    let c = Pos2 (
        x: (c1_x + c2_x) * 0.5,
        y: (c1_y + c2_y) * 0.5
    )

    return QuadraticBezierShape (
        points: (curve.points.0, c, curve.points.3),
        closed: curve.closed,
        fill: curve.fill,
        stroke: curve.stroke
    )
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

fileprivate func cubic_for_each_local_extremum(p0: Float32, p1: Float32, p2: Float32, p3: Float32, cb: (Float32) -> Void) {
    // See www.faculty.idc.ac.il/arik/quality/appendixa.html for an explanation
    // A cubic Bézier curve can be derivated by the following equation:
    // B'(t) = 3(1-t)^2(p1-p0) + 6(1-t)t(p2-p1) + 3t^2(p3-p2) or
    // f(x) = a * x² + b * x + c
    let a = 3.0 * (p3 + 3.0 * (p1 - p2) - p0);
    let b = 6.0 * (p2 - 2.0 * p1 + p0);
    let c = 3.0 * (p1 - p0);

    // let in_range = |t: f32| t <= 1.0 && t >= 0.0;
    func in_range(_ t: Float32) -> Bool {
        t <= 1.0 && t >= 0.0
    }

    // linear situation
    if a == 0.0 {
        if b != 0.0 {
            let t = -c / b;
            if in_range(t) {
                cb(t);
            }
        }
        return;
    }

    let discr = b * b - 4.0 * a * c;
    // no Real solution
    if discr < 0.0 {
        return;
    }

    // one Real solution
    if discr == 0.0 {
        let t = -b / (2.0 * a);
        if in_range(t) {
            cb(t);
        }
        return;
    }

    // two Real solutions
    let discr_sqrt =  discr.squareRoot();
    let t1 = (-b - discr_sqrt) / (2.0 * a);
    let t2 = (-b + discr_sqrt) / (2.0 * a);
    if in_range(t1) {
        cb(t1);
    }
    if in_range(t2) {
        cb(t2);
    }
}

