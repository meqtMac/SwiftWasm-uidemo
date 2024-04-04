//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

// MARK: - Checked

/// Linearly transforms positions via a translation, then a scaling.
///
/// `TSTransform` first scales points with the scaling origin at `0, 0`
/// (the top left corner), then translates them.
@frozen
public struct TSTransform: Equatable {
    /// Scaling applied first, scaled around (0, 0).
    public let scaling: Float32
    
    /// Translation amount, applied after scaling.
    public let translation: Vec2
    
    /// Creates a new translation that first scales points around
    /// `(0, 0)`, then translates them.
    @inlinable
    public init(scaling: Float32, translation: Vec2) {
        self.scaling = scaling
        self.translation = translation
    }
}

public extension TSTransform {
    static let identity = Self(scaling: 1.0, translation: .zero)
    /// Inverts the transform.
    ///
    /// ```swift
    /// let p1 = Pos2(x: 2.0, y: 3.0)
    /// let p2 = Pos2(x: 12.0, y: 5.0)
    /// let ts = TSTransform(translation: Vec2(x: 2.0, y: 3.0), scaling: 2.0)
    /// let inv = ts.inverse()
    /// assertEqual(inv.mulPos(p1), Pos2(x: 0.0, y: 0.0))
    /// assertEqual(inv.mulPos(p2), Pos2(x: 5.0, y: 1.0))
    ///
    /// assertEqual(ts.inverse().inverse(), ts)
    /// ```
    @inlinable
    func inverse() -> TSTransform {
        return TSTransform(
            scaling: 1.0 / scaling,
            translation: -translation / scaling
        )
    }
    
    /// Transforms the given coordinate.
    ///
    /// ```swift
    /// let p1 = Pos2(x: 0.0, y: 0.0)
    /// let p2 = Pos2(x: 5.0, y: 1.0)
    /// let ts = TSTransform(translation: Vec2(x: 2.0, y: 3.0), scaling: 2.0)
    /// assertEqual(ts.mulPos(p1), Pos2(x: 2.0, y: 3.0))
    /// assertEqual(ts.mulPos(p2), Pos2(x: 12.0, y: 5.0))
    /// ```
    @inlinable
    static func * (lhs: Self, rhs: Pos2) -> Pos2 {
        return  rhs * lhs.scaling + lhs.translation
    }
    
    /// Transforms the given rectangle.
    ///
    /// ```swift
    /// let rect = Rect(min: Pos2(x: 5.0, y: 5.0), max: Pos2(x: 15.0, y: 10.0))
    /// let ts = TSTransform(translation: Vec2(x: 1.0, y: 0.0), scaling: 3.0)
    /// let transformed = ts.mulRect(rect)
    /// assertEqual(transformed.min, Pos2(x: 16.0, y: 15.0))
    /// assertEqual(transformed.max, Pos2(x: 46.0, y: 30.0))
    /// ```
    @inlinable
    static func * (lhs: Self, rhs: Rect) -> Rect {
        Rect(
            min: lhs * rhs.min,
            max: lhs * rhs.max
        )
    }
    
    /// Applies the right hand side transform, then the left hand side.
    ///
    /// ```
    /// # use emath::{TSTransform, vec2};
    /// let ts1 = TSTransform::new(vec2(1.0, 0.0), 2.0);
    /// let ts2 = TSTransform::new(vec2(-1.0, -1.0), 3.0);
    /// let ts_combined = TSTransform::new(vec2(2.0, -1.0), 6.0);
    /// assert_eq!(ts_combined, ts2 * ts1);
    /// ```
    @inlinable
    static func * (lhs: Self, rhs: Self) -> Self {
        TSTransform(scaling: lhs.scaling * rhs.scaling, translation: lhs.translation + lhs.scaling * rhs.translation)
    }
}
