//
//  Rect.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

// MARK: Checked

/// A rectangular region of space.
///
/// Usually a `Rect` has a positive (or zero) size,
/// and then `min <= max`.
/// In these cases `min` is the left-top corner
/// and `max` is the right-bottom corner.
///
/// A rectangle is allowed to have a negative size, which happens when the order
/// of `min` and `max` are swapped. These are usually a sign of an error.
///
/// Normally the unit is points (logical pixels) in screen space coordinates.
///
/// `Rect` does NOT implement `Default`, because there is no obvious default value.
/// `Rect.ZERO` may seem reasonable, but when used as a bounding box, `Rect.nothing`
/// is a better default - so be explicit instead!
public struct Rect {
    /// One of the corners of the rectangle, usually the left top one.
    @inline(__always)
    public var min: Pos2
    
    /// The other corner, opposing `min`. Usually the right bottom one.
    @inline(__always)
    public var max: Pos2
    
    @inline(__always)
    public init(min: Pos2, max: Pos2) {
        self.min = min
        self.max = max
    }
}

public extension Rect {
    /// Infinite rectangle that contains every point.
    static let everything = Rect(min: Pos2(x: -.infinity, y: -.infinity),
                                 max: Pos2(x: .infinity, y: .infinity))
    
    /// The inverse of `everything`: stretches from positive infinity to negative infinity.
    /// Contains no points.
    ///
    /// This is useful as the seed for bounding boxes.
    ///
    /// - Example:
    /// ```
    /// var rect = Rect.nothing
    /// assert(rect.size == Vec2(splat: -Float.infinity))
    /// assert(!rect.contains(Pos2(x: 0.0, y: 0.0)))
    /// rect.extend(with: Pos2(x: 2.0, y: 1.0))
    /// rect.extend(with: Pos2(x: 0.0, y: 3.0))
    /// assert(rect == Rect(min: Pos2(x: 0.0, y: 1.0), max: Pos2(x: 2.0, y: 3.0)))
    /// ```
    static let nothing: Rect = Rect(min: Pos2(x: .infinity, y: .infinity),
                                    max: Pos2(x: -.infinity, y: -.infinity))
    
    /// An invalid `Rect` filled with `Float.nan`.
    static let nan: Rect = Rect(min: Pos2(x: Float.nan, y: Float.nan),
                                max: Pos2(x: Float.nan, y: Float.nan))
    
    /// A `Rect` filled with zeroes.
    static let zero: Rect = Rect(min: .zero, max: .zero)
}

public extension Rect {
    
    /// left-top corner plus a size (stretching right-down).
    @inline(__always)
    init(min: Pos2, size: Vec2) {
        self.min = min
        self.max = min + size
    }
    
    @inline(__always)
    init(center: Pos2, size: Vec2) {
        self.min = center - size * 0.5
        self.max = center + size * 0.5
    }
    
    
    @inline(__always)
    init(xRange: ClosedRange<Float>, yRange: ClosedRange<Float>) {
        self.min = Pos2(x: xRange.lowerBound, y: yRange.lowerBound)
        self.max = Pos2(x: xRange.upperBound, y: yRange.upperBound)
    }
    
    /// Returns the bounding rectangle of the two points.
    @inlinable
    init(twoPos a: Pos2, b: Pos2) {
        self.min = Pos2(x: Swift.min(a.x, b.x), y: Swift.min(a.y, b.y))
        self.max = Pos2(x: Swift.max(a.x, b.x), y: Swift.max(a.y, b.y))
    }
    
    /// Bounding-box around the points.
    init(points: [Pos2]) {
        var rect = Rect.nothing
        for p in points {
            rect.extend(with: p)
        }
        self = rect
    }
    
    /// A `Rect` that contains every point to the right of the given X coordinate.
    @inlinable
    static func everythingRight(of leftX: Float) -> Rect {
        var rect = Rect.everything
        rect.left = leftX
        return rect
    }
    
    /// A `Rect` that contains every point to the left of the given X coordinate.
    @inlinable
    static func everythingLeft(of rightX: Float) -> Rect {
        var rect = Rect.everything
        rect.right = rightX
        return rect
    }
    
    /// A `Rect` that contains every point below a certain y coordinate.
    @inlinable
    static func everythingBelow(topY: Float) -> Rect {
        var rect = Rect.everything
        rect.top = topY
        return rect
    }
    
    /// A `Rect` that contains every point above a certain y coordinate.
    @inlinable
    static func everythingAbove(bottomY: Float) -> Rect {
        var rect = Rect.everything
        rect.bottom = bottomY
        return rect
    }
    
    @inlinable
    func withMinX(_ minX: Float) -> Rect {
        var rect = self
        rect.min.x = minX
        return rect
    }
    
    @inlinable
    func withMinY(_ minY: Float) -> Rect {
        var rect = self
        rect.min.y = minY
        return rect
    }
    
    @inlinable
    func withMaxX(_ maxX: Float) -> Rect {
        var rect = self
        rect.max.x = maxX
        return rect
    }
    
    @inlinable
    func withMaxY(_ maxY: Float) -> Rect {
        var rect = self
        rect.max.y = maxY
        return rect
    }
    
    func expand(by amnt: Float) -> Rect {
        return expand2(by: Vec2(splat: amnt) )
    }
    
    func expand2(by amnt: Vec2) -> Rect {
        return Rect(min: min - amnt, max: max + amnt)
    }
    
    func shrink(by amnt: Float) -> Rect {
        return shrink2(by: Vec2(splat: (amnt)) )
    }
    
    func shrink2(by amnt: Vec2) -> Rect {
        return Rect(min: min + amnt, max: max - amnt)
    }
    
    @inlinable
    func translated(by amnt: Vec2) -> Rect {
        return Rect(min: min + amnt, max: max + amnt)
    }
    
    @inlinable
    func rotated(by rot: Rot2) -> Rect {
        let a = rot * leftTop().toVec2()
        let b = rot * rightTop().toVec2()
        let c = rot * leftBottom().toVec2()
        let d = rot * rightBottom().toVec2()
        
        return Rect(min: Pos2(x: Swift.min(a.x, b.x, c.x, d.x), y: Swift.min(a.y, b.y, c.y, d.y)),
                    max: Pos2(x: Swift.max(a.x, b.x, c.x, d.x), y: Swift.max(a.y, b.y, c.y, d.y)))
    }
    
    @inlinable
    func intersects(_ other: Self) -> Bool {
        min.x <= other.max.x
        && other.min.x <= max.x
        && min.y <= other.max.y
        && other.min.y <= max.y
    }
    
    
    /// Returns `true` if the point is contained in the `Rect`.
    @inline(__always)
    func contains(_ point: Pos2) -> Bool {
        point.x >= min.x
        && point.x <= max.x
        && point.y >= min.y
        && point.y <= max.y
    }
    
    /// Returns `true` if the point is contained in the `Rect`.
    func contains(rect other: Rect) -> Bool {
        contains(other.min)
        && contains(other.max)
    }
    
    /// Return the given points clamped to be inside the rectangle
    /// Panics if [`Self::is_negative`].
    func clamp(point: Pos2) -> Pos2 {
        point.clamped(to: min, max: max)
    }
    
    /// Moves the rectangle to make `point` its new `min`.
    @inline(__always)
    mutating func extend(with point: Pos2) {
        min = Pos2(x: Swift.min(min.x, point.x), y: Swift.min(min.y, point.y))
        max = Pos2(x: Swift.max(max.x, point.x), y: Swift.max(max.y, point.y))
    }
    
    /// Expand to include the given x coordinate
    @inline(__always)
    mutating func extend(x: Float32) {
        min.x = Swift.min(min.x, x)
        max.x = Swift.max(max.x, x)
    }
    
    /// Expand to include the given y coordinate
    @inline(__always)
    mutating func extend(y: Float32) {
        min.y = Swift.min(min.y, y)
        max.y = Swift.max(max.y, y)
    }
    
    /// The union of two bounding rectangle, i.e. the minimum [`Rect`] that contains both input rectangles.
    @inline(__always)
    func union(_ other: Rect) -> Rect {
        let uMin = Pos2(x: Swift.min(min.x, other.min.x), y: Swift.min(min.y, other.min.y))
        let uMax = Pos2(x: Swift.max(max.x, other.max.x), y: Swift.max(max.y, other.max.y))
        return Rect(min: uMin, max: uMax)
    }
    
    /// Returns the intersection of `self` and `other`.
    @inlinable
    func intersection(with other: Rect) -> Rect {
        Rect(min: min.max(other.min), max: max.min(other.max))
    }
    
    
    
    //        /// Constructs the smallest rectangle that contains the given rectangles.
    //    init(containing rects: [Rect]) {
    //        assert(!rects.isEmpty)
    //        var min = rects[0].min
    //        var max = rects[0].max
    //        for r in rects[1...] {
    //            min = min.min(r.min)
    //            max = max.max(r.max)
    //        }
    //        self.init(min: min, max: max)
    //    }
    
    
    
}

public extension Rect {
    
    /// Width / height
    ///
    /// * `aspect_ratio < 1`: portrait / high
    /// * `aspect_ratio = 1`: square
    /// * `aspect_ratio > 1`: landscape / wide
    func aspectRatio() -> Float32 {
        width / height
    }
    
    /// `[2, 1]` for wide screen, and `[1, 2]` for portrait, etc.
    /// At least one dimension = 1, the other >= 1
    /// Returns the proportions required to letter-box a square view area.
    func squareProportions() -> Vec2 {
        let w = width;
        let h = height;
        if w > h {
            return Vec2(x: w / h, y: 1.0)
        } else {
            return Vec2(x: 1.0, y: h / 2)
        }
    }
    
    func area() -> Float32 {
        width * height
    }
    
    /// The distance from the rect to the position.
    ///
    /// The distance is zero when the position is in the interior of the rectangle.
    @inlinable
    func distance(to point: Pos2) -> Float32 {
        distanceSquare(to: point).squareRoot()
    }
    
    /// The distance from the rect to the position, squared.
    ///
    /// The distance is zero when the position is in the interior of the rectangle.
    @inlinable
    func distanceSquare(to point: Pos2) -> Float32 {
        let dx: Float32 = if min.x > point.x {
            min.x - point.x
        } else if point.x > max.x {
            point.x - max.x
        } else {
            0
        }
        
        let dy: Float32 = if min.y > point.y {
            min.y - point.y
        } else if point.y > max.y {
            point.y - max.y
        } else {
            0.0
        }
        
        return dx * dx + dy * dy
    }
    
    /// Signed distance to the edge of the box.
    ///
    /// Negative inside the box.
    ///
    /// ```rust
    /// let rect = Rect::from_min_max(pos2(0.0, 0.0), pos2(1.0, 1.0));
    /// assert_eq!(rect.signed_distance_to_pos(pos2(0.50, 0.50)), -0.50);
    /// assert_eq!(rect.signed_distance_to_pos(pos2(0.75, 0.50)), -0.25);
    /// assert_eq!(rect.signed_distance_to_pos(pos2(1.50, 0.50)), 0.50);
    /// ```
    func signedDistance(to point: Pos2) -> Float32 {
        let edgeDistances = (point - center).absoluted() - size() * 0.5
        let insideDistance = Swift.min(edgeDistances.maxElem(), 0)
        let outsideDistance = edgeDistances.max(.zero).length()
        return insideDistance + outsideDistance
    }
    
    /// Linearly interpolate so that `[0, 0]` is [`Self::min`] and
    /// `[1, 1]` is [`Self::max`].
    @inlinable
    func lerpInside(t: Vec2) -> Pos2 {
        Pos2(
            x: lerp(min.x...max.x, t.x),
            y: lerp(min.y...max.y, t.y)
        )
    }
    
    /// Linearly self towards other rect.
    @inlinable
    func lerpTowards(other: Self, t: Float32) -> Self {
        Rect (
            min: min.interpolated(to: other.min, t: t),
            max: max.interpolated(to: other.max, t: t)
        )
    }
    
    /// Returns the `x` extent.
    @inline(__always)
    func xRange() -> ClosedRange<Float> {
        min.x...max.x
    }
    
    /// Returns the `y` extent.
    @inline(__always)
    func yRange() -> ClosedRange<Float> {
        min.y...max.y
    }
    
    @inline(__always)
    func bottomUpRange() -> ClosedRange<Float> {
        max.y...min.y
    }
    
    /// `width < 0 || height < 0`
    @inline(__always)
    func isNegative() -> Bool {
        max.x < min.x || max.y < min.y
    }
    
    /// `width > 0 && height > 0`
    @inline(__always)
    func isPositive() -> Bool {
        min.x < max.x && min.y < max.y
    }
    
    /// True if all members are also finite.
    @inline(__always)
    func isFinite() -> Bool {
        min.isFinite() && max.isFinite()
    }
    
    /// True if any member is NaN.
    @inline(__always)
    func anyNaN() -> Bool {
        min.anyNaN() || max.anyNaN()
    }
}

// MARK: Convenience functions (assume origin is towards left top)
public extension Rect {
    /// keep min
    var width: Float32 {
        @inline(__always)
        get {
            max.x - min.x
        }
        mutating set {
            max.x = min.x + newValue
        }
    }
    
    /// keep min
    var height: Float32 {
        @inline(__always)
        get {
            max.y - min.y
        }
        mutating set {
            max.y = min.y + newValue
        }
    }
    
    /// keep size: Pos2
    var center: Pos2 {
        @inline(__always)
        get {
            Pos2(x: (min.x + max.x) / 2, y: (min.y + max.y) / 2 )
        }
        mutating set {
            self = translated(by: newValue - center)
        }
    }
    
    /// `rect.size() == Vec2 { x: rect.width(), y: rect.height() }`
    @inline(__always)
    func size() -> Vec2 {
        max - min
    }
    
    /// `min.x`
    var left: Float32 {
        @inline(__always)
        get {
            min.x
        }
        @inline(__always)
        mutating set {
            min.x = newValue
        }
    }
    
    /// `max.s`
    @inline(__always)
    var right: Float32 {
        get {
            max.x
        }
        mutating set {
            max.x = newValue
        }
        
    }
    
    /// `min.y`
    @inline(__always)
    var top: Float32 {
        get {
            min.y
        }
        mutating set {
            min.y = newValue
        }
    }
    
    /// `max.y`
    @inline(__always)
    var bottom: Float32 {
        get {
            max.y
        }
        mutating set {
            max.y = newValue
        }
    }
    
    
    @inline(__always)
    func leftTop() -> Pos2 {
        min
    }
    
    @inline(__always)
    func centerTop() -> Pos2 {
        Pos2(x: center.x, y: top)
    }
    
    @inline(__always)
    func rightTop() -> Pos2 {
        Pos2(x: right, y: top)
    }
    
    @inline(__always)
    func leftCenter() -> Pos2 {
        Pos2(x: left, y: center.y)
    }
    
    @inline(__always)
    func rightCenter() -> Pos2 {
        Pos2(x: right, y: center.y)
    }
    
    @inline(__always)
    func leftBottom() -> Pos2 {
        Pos2(x: left, y: bottom)
    }
    
    @inline(__always)
    func centerBottom() -> Pos2 {
        Pos2(x: center.x, y: bottom)
    }
    
    @inline(__always)
    func rightBottom() -> Pos2 {
        Pos2(x: right, y: bottom)
    }
    
    /// Split rectangle in left and right halves. `fraction` is expected to be in the (0,1) range.
    func splitx(fraction: Float32) -> (Self, Self) {
        split(x: lerp(min.x...max.x, fraction))
    }
    
    /// Split rectangle in left and right halves at the given `x` coordinate.
    func split(x: Float32) -> (Self, Self) {
        let left = Rect(min: min, max: Pos2(x: x, y: max.y))
        let right = Rect(min: Pos2(x: x, y: min.y), max: max)
        return (left, right)
    }
    
    /// Split rectangle in top and bottom halves. `fraction` is expected to be in the (0,1) range.
    func splity(fraction: Float32) -> (Self, Self) {
        split(y: lerp(min.y...max.y, fraction))
    }
    
    /// Split rectangle in top and bottom halves at the given `y` coordinate.
    func split(y: Float32) -> (Self, Self) {
        let top = Rect(min: min, max: Pos2(x: max.x, y: y))
        let bottom = Rect(min: Pos2(x: min.x, y: y), max: max)
        return (top, bottom)
    }
}

public extension Rect {
    /// Does this Rect intersect the given ray (where `d` is normalized)?
    func intesectsRay(o: Pos2, d: Vec2) -> Bool {
        var tmin: Float32 = -.infinity
        var tmax: Float32 = .infinity
        
        if d.x != 0.0 {
            let tx1 = (min.x - o.x) / d.x;
            let tx2 = (max.x - o.x) / d.x;
            
            tmin = tmin.max(tx1.min(tx2));
            tmax = tmax.min(tx1.max(tx2));
        }
        
        if d.y != 0.0 {
            let ty1 = (self.min.y - o.y) / d.y;
            let ty2 = (self.max.y - o.y) / d.y;
            
            tmin = tmin.max(ty1.min(ty2));
            tmax = tmax.min(ty1.max(ty2));
        }
        
        return tmin <= tmax
    }
}



public extension Rect {
    @inlinable
    static func * (lhs: Self, rhs: Float) -> Self {
        Self(min: lhs.min * rhs, max: lhs.max * rhs)
    }
    
    
    @inlinable
    static func * (lhs: Float32, rhs: Self) -> Self {
        Self(min: lhs * rhs.min, max: lhs * rhs.max)
    }
    
    
    @inlinable
    static func / (lhs: Self, rhs: Float32) -> Self {
        Self(min: lhs.min / rhs, max: lhs.max / rhs)
    }
}
