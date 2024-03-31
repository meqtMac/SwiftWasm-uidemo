//
//  Rect.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

import Foundation

/// A rectangular region of space.
///
/// Usually a [`Rect`] has a positive (or zero) size,
/// and then [`Self::min`] `<=` [`Self::max`].
/// In these cases [`Self::min`] is the left-top corner
/// and [`Self::max`] is the right-bottom corner.
///
/// A rectangle is allowed to have a negative size, which happens when the order
/// of `min` and `max` are swapped. These are usually a sign of an error.
///
/// Normally the unit is points (logical pixels) in screen space coordinates.
///
/// `Rect` does NOT implement `Default`, because there is no obvious default value.
/// [`Rect::ZERO`] may seem reasonable, but when used as a bounding box, [`Rect::NOTHING`]
/// is a better default - so be explicit instead!
@frozen
public struct Rect {
    public var min: Pos2
    public var max: Pos2
    
    public init(min: Pos2, max: Pos2) {
        self.min = min
        self.max = max
    }
    
    public init(_ min: Pos2, _ max: Pos2) {
        self.min = min
        self.max = max
    }
}



public extension Rect {
    /// An infinite rectangle containing every point
    static let everything: Rect = Rect(min: .init(x: -.infinity, y: -.infinity),
                                       max: .init(x: .infinity, y: .infinity))
    
    /// The opposite of everything, containing no points
    static let nothing: Rect = Rect(min: .init(x: .infinity, y: .infinity),
                                    max: .init(x: -.infinity, y: -.infinity))
    
    /// A rectangle filled with NaN values
    static let nan: Rect = Rect(min: .init(x: .nan, y: .nan),
                                max: .init(x: .nan, y: .nan))
    
    /// A rectangle filled with zeroes
    static let zero: Rect = Rect(min: .zero, max: .zero)
    
    /// Creates a rectangle from the bottom-left and top-right corners
    static func fromMinMax(min: Vec2, max: Vec2) -> Rect {
        Rect(
            min: Pos2(x: min.x, y: min.y) ,
            max: Pos2(x: max.x, y: max.y))
    }
    
    //  /// Creates a rectangle from the bottom-left corner and size
    //  static func fromMinSize(min: Vec2, size: Vec2) -> Rect {
    //    Rect(min: min, max: min + size)
    //  }
    //
    //  /// Creates a rectangle from the center and size
    //  static func fromCenterSize(center: Vec2, size: Vec2) -> Rect {
    //    Rect(min: center - size * 0.5, max: center + size * 0.5)
    //  }
    //
    //  /// Creates a rectangle encompassing the provided x and y ranges
    //  static func fromXRangeYRange(_ xRange: ClosedRange<Float>, _ yRange: ClosedRange<Float>) -> Rect {
    //    Rect(min: Vec2(x: xRange.lowerBound, y: yRange.lowerBound),
    //         max: Vec2(x: xRange.upperBound, y: yRange.upperBound))
    //  }
    //
    //  /// The bounding rectangle of two points
    //  static func fromTwoPoints(_ a: Vec2, _ b: Vec2) -> Rect {
    //    Rect(min: Vec2(x: min(a.x, b.x), y: min(a.y, b.y)),
    //         max: Vec2(x: max(a.x, b.x), y: max(a.y, b.y)))
    //  }
    
    // ... other properties omitted for brevity ...
    
    /// The x-range of the rectangle
    var xRange: ClosedRange<Float> {
        min.x...max.x
    }
    
    /// The y-range of the rectangle, bottom to top
    var yRange: ClosedRange<Float> {
        min.y...max.y
    }
    
    /// True if the width or height is negative
    var isNegative: Bool {
        max.x < min.x || max.y < min.y
    }
    
    /// True if the width and height are positive
    var isPositive: Bool {
        min.x < max.x && min.y < max.y
    }
    
    // ... other properties omitted for brevity ...
    
    
    @inlinable
    mutating func extend(with p: Pos2) {
        let min = min.min(p)
        let max = max.max(p)
        self = Rect(min: min, max: max)
    }
    
    
}

public extension Rect {
    
    /// The smallest rectangle containing both `self` and `other`.
    @inlinable
    func union(_ other: Self) -> Self {
        Rect(min: min.min(other.min), max: max.max(other.max))
    }
    
    /// The area covered by both `self` and `other`.
    @inlinable
    func intersect(_ other: Self) -> Self {
        Rect(min: min.max(other.min), max: max.min(other.max))
    }
    
    /// The center point of the rectangle.
    @inlinable
    var center: Pos2 {
        Pos2((min.x + max.x) / 2  , (min.y + max.y) / 2)
    }
    
    
    /// The size of the rectangle (width and height).
    @inlinable
    var size: Vec2 {
        Vec2(x: max.x - min.x, y: max.y - min.y)
    }
    
    /// The width of the rectangle.
    @inlinable
    var width: Float32 {
        max.x - min.x
    }
    
    /// The height of the rectangle.
    @inlinable
    var height: Float32 {
        max.y - min.y
    }
    
    /// Aspect ratio (width divided by height).
    /// * `< 1`: Portrait/tall
    /// * `= 1`: Square
    /// * `> 1`: Landscape/wide
    @inlinable
    func aspectRatio() -> Float32 {
        return width / height
    }
    
    /// Proportions to letterbox a square view area within the rectangle.
    /// * Returns `[w / h, 1.0]` for wide screen, `[1.0, h / w]` for portrait.
    /// * At least one dimension is 1, the other is >= 1.
    func squareProportions() -> Vec2 {
        let w = width
        let h = height
        return w > h ? Vec2(w / h, 1.0) : Vec2(1.0, h / w)
    }
    
    /// Area of the rectangle.
    @inlinable
    func area() -> Float32 {
        return width * height
    }
    
    /// Distance from the rectangle to a position.
    /// * Distance is zero if the position is inside the rectangle.
    @inlinable
    func distanceToPos(_ pos: Pos2) -> Float32 {
        return distanceSqToPos(pos).squareRoot()
    }
    
    /// Distance from the rectangle to a position, squared.
    /// * Distance is zero if the position is inside the rectangle.
    @inlinable
    func distanceSqToPos(_ pos: Pos2) -> Float32 {
        let dx: Float32 = if min.x > pos.x {
            min.x - pos.x
        } else if pos.x > max.x {
            pos.x - max.x
        } else {
            0.0
        }
        let dy: Float32 = if min.y > pos.y {
            min.y - pos.y
        } else if pos.y > max.y {
            pos.y - max.y
        } else {
            0.0
        }
        return dx * dx + dy * dy
    }
    
    /// Signed distance to the edge of the rectangle.
    /// * Negative values indicate inside the rectangle.
    func signedDistanceToPos(_ pos: Pos2) -> Float32 {
        let diffx = abs(pos.x - center.x)
        let diffy = abs(pos.y - center.y)
        let edgeDistances = Pos2(diffx, diffy) - Pos2(size.x / 2, size.y / 2)
        let insideDist = Swift.min(0, Swift.max(edgeDistances.x, edgeDistances.y))
        
        let outsideX = Swift.max(0, edgeDistances.x)
        let outsideY = Swift.max(0, edgeDistances.y)
        
        let outsideDist = Vec2(outsideX, outsideY).length()
        
        return insideDist + outsideDist
    }
}


public extension Rect {
    /// The x-coordinate of the top-left corner (minimum x-value).
    @inlinable
    var left: Float32 {
        get {
            min.x
        }
        mutating set {
            min.x = newValue
        }
    }
    
    /// The x-coordinate of the bottom-right corner (maximum x-value).
    @inlinable
    var right: Float32 {
        get {
            max.x
        }
        mutating set {
            max.x = newValue
        }
    }
    /// The y-coordinate of the top-left corner (minimum y-value).
    @inlinable
    var top: Float32 {
        //        return min.y
        get {
            min.y
        }
        mutating set  {
            min.y = newValue
        }
    }
    
    /// The y-coordinate of the bottom-right corner (maximum y-value).
    @inlinable
    var bottom: Float32 {
        get {
            max.y
        }
        mutating set {
            max.y = newValue
        }
        
    }
    
    /// Returns the position of the top-left corner of the rectangle.
    @inlinable
    var leftTop: Pos2 {
        Pos2(x: left, y: top)
    }
    
    /// Returns the position of the center-top of the rectangle.
    @inlinable
    var centerTop: Pos2 {
        Pos2(x: center.x, y: top)
    }
    
    /// Returns the position of the top-right corner of the rectangle.
    @inlinable
    var rightTop: Pos2 {
        Pos2(x: right, y: top)
    }
    
    /// Returns the position of the center-left of the rectangle.
    @inlinable
    var leftCenter: Pos2 {
        Pos2(x: left, y: center.y)
    }
    
    /// Returns the position of the center-right of the rectangle.
    @inlinable
    var rightCenter: Pos2 {
        Pos2(x: right, y: center.y)
    }
    
    /// Returns the position of the bottom-left corner of the rectangle.
    @inlinable
    var leftBottom: Pos2 {
        Pos2(x: left, y: bottom)
    }
    
    /// Returns the position of the center-bottom of the rectangle.
    @inlinable
    var centerBottom: Pos2 {
        Pos2(x: center.x, y: bottom)
    }
    
    /// Returns the position of the bottom-right corner of the rectangle.
    @inlinable
    var rightBottom: Pos2 {
        Pos2(x: right, y: bottom)
    }
}

public extension Rect {
    
    /// Does this Rect intersect the given ray (where `d` is normalized)?
    func intersectsRay(o: Pos2, d: Vec2) -> Bool {
        var tMin: Float32 = .infinity
        var tMax: Float32 = .infinity
        
        if d.x != 0.0 {
            let tx1 = (min.x - o.x) / d.x
            let tx2 = (max.x - o.x) / d.x
            tMin = Swift.max(tMin, Swift.min(tx1, tx2))
            tMax = Swift.min(tMax, Swift.max(tx1, tx2))
        }
        
        if d.y != 0.0 {
            let ty1 = (min.y - o.y) / d.y
            let ty2 = (max.y - o.y) / d.y
            tMin = Swift.max(tMin, Swift.min(ty1, ty2))
            tMax = Swift.min(tMax, Swift.max(ty1, ty2))
        }
        
        return tMin <= tMax
    }
}
