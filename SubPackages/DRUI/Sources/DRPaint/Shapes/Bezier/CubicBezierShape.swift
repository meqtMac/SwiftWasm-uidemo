//
//  CubicBezierShape.swift
//
//
//  Created by 蒋艺 on 2024/4/6.
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
    func to_path_shapes(_ tolerance: Float32?, _ epsilon: Float32) -> Array<PathShape> {
        var pathshapes: [PathShape] = []
        let points_vec =
        self.flatten_closed(tolerance, epsilon);
        
        for points in points_vec {
            let pathshape = PathShape(
                points: points,
                closed: self.closed,
                fill: self.fill,
                stroke: self.stroke
            )
            pathshapes.append(pathshape)
        }
        return pathshapes
    }
    
    /// The visual bounding rectangle (includes stroke width)
    func visual_bounding_rect() -> Rect {
        if self.fill == .transparent && self.stroke.is_empty() {
            return .nothing
        } else {
            return self.logical_bounding_rect().expand(by: self.stroke.width / 2.0)
        }
    }
    
    /// Logical bounding rectangle (ignoring stroke width)
    func logical_bounding_rect() -> Rect {
        //temporary solution
        var (min_x, max_x) = if self.points.0.x < self.points.3.x {
            (self.points.0.x, self.points.3.x)
        } else {
            (self.points.3.x, self.points.0.x)
        };
        var (min_y, max_y) = if self.points.0.y < self.points.3.y {
            (self.points.0.y, self.points.3.y)
        } else {
            (self.points.3.y, self.points.0.y)
        };
        
        // find the inflection points and get the x value
        cubic_for_each_local_extremum(
            p0: self.points.0.x,
            p1: self.points.1.x,
            p2: self.points.2.x,
            p3: self.points.3.x)
        { t in
            let x = self.sample(t).x;
            if x < min_x {
                min_x = x;
            }
            if x > max_x {
                max_x = x;
            }
        }
        
        // find the inflection points and get the y value
        cubic_for_each_local_extremum(
            p0: self.points.0.y,
            p1: self.points.1.y,
            p2: self.points.2.y,
            p3: self.points.3.y) {t in
                let y = self.sample(t).y;
                if y < min_y {
                    min_y = y;
                }
                if y > max_y {
                    max_y = y;
                }
            }
        
        return Rect (
            min: Pos2 ( x: min_x, y: min_y ),
            max: Pos2 ( x: max_x, y: max_y )
        )
    }
    
    /// split the original cubic curve into a new one within a range.
    func split_range(_ t_range: Range<Float32>) -> Self {
        assert(
            t_range.lowerBound >= 0.0 && t_range.upperBound <= 1.0 && t_range.lowerBound <= t_range.upperBound,
            "range should be in [0.0,1.0]"
        );
        
        let from = self.sample(t_range.lowerBound);
        let to = self.sample(t_range.upperBound);
        
        let d_from = self.points.1 - self.points.0.toVec2();
        let d_ctrl = self.points.2 - self.points.1.toVec2();
        let d_to = self.points.3 - self.points.2.toVec2();
        let q = QuadraticBezierShape (
            points: (d_from, d_ctrl, d_to),
            closed: self.closed,
            fill: self.fill,
            stroke: self.stroke
        )
        let delta_t = t_range.lowerBound - t_range.upperBound;
        let q_start = q.sample(t_range.lowerBound);
        let q_end = q.sample(t_range.upperBound);
        let ctrl1 = from + q_start.toVec2() * delta_t;
        let ctrl2 = to - q_end.toVec2() * delta_t;
        
        return Self (
            points: (from, ctrl1, ctrl2, to),
            closed: self.closed,
            fill: self.fill,
            stroke: self.stroke
        )
    }
    
    // copied from lyon::geom::flattern_cubic.rs
    // Computes the number of quadratic bézier segments to approximate a cubic one.
    // Derived by Raph Levien from section 10.6 of Sedeberg's CAGD notes
    // https://scholarsarchive.byu.edu/cgi/viewcontent.cgi?article=1000&context=facpub#section.10.6
    // and the error metric from the caffein owl blog post http://caffeineowl.com/graphics/2d/vectorial/cubic2quad01.html
    func num_quadratics(_ tolerance: Float32) -> UInt32 {
        assert(tolerance > 0.0, "the tolerance should be positive");
        
        let x =
        self.points.0.x - 3.0 * self.points.1.x + 3.0 * self.points.2.x - self.points.3.x;
        let y =
        self.points.0.y - 3.0 * self.points.1.y + 3.0 * self.points.2.y - self.points.3.y;
        let err = x * x + y * y;
        
        let res =  (err / (432.0 * tolerance * tolerance))
            .pow(1.0 / 6.0)
            .ceil()
            .max(1.0)
        return UInt32(res)
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
    func find_cross_t(_ epsilon: Float32) -> Float32? {
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
        let r = (-1.0 * (p / 3.0).pow(3)).sqrt();
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
    
    /// Calculate the point (x,y) at t based on the cubic Bézier curve equation.
    /// t is in [0.0,1.0]
    /// [Bézier Curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve#Cubic_B.C3.A9zier_curves)
    ///
    func sample(_ t: Float32) -> Pos2 {
        assert(t >= 0.0 && t <= 1.0, "the sample value should be in [0.0,1.0]")
        let h = 1.0 - t;
        let a = t * t * t;
        let b = 3.0 * t * t * h;
        let c = 3.0 * t * h * h;
        let d = h * h * h;
        let result = self.points.3.toVec2() * a
        + self.points.2.toVec2() * b
        + self.points.1.toVec2() * c
        + self.points.0.toVec2() * d;
        return result.toPos2()
    }
    
    /// find a set of points that approximate the cubic Bézier curve.
    /// the number of points is determined by the tolerance.
    /// the points may not be evenly distributed in the range [0.0,1.0] (t value)
    func flatten(_ tolerance: Float32?) -> Array<Pos2> {
        let tolerance = tolerance ?? (self.points.0.x - self.points.3.x).abs() * 0.001
        var result = [self.points.0];
        self.for_each_flattened_with_t(tolerance) { p, _t in
            result.append(p);
        }
        return result
    }
    
    
    
    
    
    /// find a set of points that approximate the cubic Bézier curve.
    /// the number of points is determined by the tolerance.
    /// the points may not be evenly distributed in the range [0.0,1.0] (t value)
    /// this api will check whether the curve will cross the base line or not when closed = true.
    /// The result will be a vec of vec of Pos2. it will store two closed aren in different vec.
    /// The epsilon is used to compare a float value.
    func flatten_closed(_ tolerance: Float32?, _ epsilon: Float32?) -> Array<Array<Pos2>> {
        let tolerance = tolerance ?? abs(self.points.0.x - self.points.3.x) * 0.001
        let epsilon = epsilon ?? 1.0e-5
        var result: [[Pos2]] = []
        var first_hald: [Pos2] = []
        var second_half: [Pos2] = []
        var flipped = false
        
        first_hald.append(self.points.0)
        
        let cross = self.find_cross_t(epsilon)
        
        if let cross {
            if self.closed {
                self.for_each_flattened_with_t( tolerance) { p, t in
                    if t < cross {
                        first_hald.append(p)
                    } else {
                        if !flipped {
                            // when just crossed the base line, flip the order of the points
                            // add the cross point to the first half as the last point
                            // and add the cross point to the second half as the first point
                            flipped = true
                            let cross_point = self.sample(cross)
                            first_hald.append(cross_point)
                            second_half.append(cross_point)
                        }
                    }
                }
            } else {
                self.for_each_flattened_with_t(tolerance) { p, _ in
                    first_hald.append(p)
                }
            }
        } else {
            self.for_each_flattened_with_t(tolerance) { p, _ in
                first_hald.append(p)
            }
        }
        
        
        result.append(first_hald)
        if !second_half.isEmpty {
            result.append( second_half)
        }
        return result
    }
    
    
    // from lyon_geom::cubic_bezier.rs
    /// Iterates through the curve invoking a callback at each point.
    func for_each_flattened_with_t(_ tolerance: Float32, _ callback: (Pos2, Float32) -> Void) {
        flatten_cubic_bezier_with_t(curve: self, tolerance: tolerance, callback: callback)
    }
}

// ----------------------------------------------------------------------------

// lyon_geom::flatten_cubic.rs
// copied from https://docs.rs/lyon_geom/latest/lyon_geom/
fileprivate func flatten_cubic_bezier_with_t(curve: CubicBezierShape, tolerance: Float32, callback: (Pos2, Float32) -> Void) {
    // debug_assert!(tolerance >= S::EPSILON * S::EPSILON);
    let quadratics_tolerance = tolerance * 0.2;
    let flattening_tolerance = tolerance * 0.8;
    
    let num_quadratics = curve.num_quadratics(quadratics_tolerance)
    let step = 1.0 / Float32(num_quadratics)
    let n = num_quadratics
    var t0: Float32 = 0.0
    for _ in 0..<(n-1) {
        let t1 = t0 + step
        
        let quadratic = single_curve_approximation(curve: curve.split_range(t0..<t1))
        quadratic.for_each_flattened_with_t(tolerance: flattening_tolerance) { point, t_sub in
            let t = t0 + step * t_sub
            callback(point, t)
        }
        
        t0 = t1
    }
    
    let quadratic = single_curve_approximation(curve: curve.split_range(t0..<1.0))
    quadratic.for_each_flattened_with_t(tolerance: flattening_tolerance) { point, t_sub in
        let t = t0 + step * t_sub
        callback(point, t)
    }
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


fileprivate func cubic_for_each_local_extremum(p0: Float32, p1: Float32, p2: Float32, p3: Float32, cb: (Float32) -> Void) {
    // See www.faculty.idc.ac.il/arik/quality/appendixa.html for an explanation
    // A cubic Bézier curve can be derivated by the following equation:
    // B'(t) = 3(1-t)^2(p1-p0) + 6(1-t)t(p2-p1) + 3t^2(p3-p2) or
    // f(x) = a * x² + b * x + c
    let a = 3.0 * (p3 + 3.0 * (p1 - p2) - p0);
    let b = 6.0 * (p2 - 2.0 * p1 + p0);
    let c = 3.0 * (p1 - p0);
    
    // let in_range = |t: Float32| t <= 1.0 && t >= 0.0;
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

