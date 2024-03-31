//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

// Import required types
import Foundation

// MARK: - TSTransform

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
    
}

// Default implementation for TSTransform
extension TSTransform {
    public static let identity = Self(translation: .zero, scaling: 1.0)
    
    /// Creates a new transform that first scales points around `(0, 0)`,
    /// then translates them.
    public init(translation: Vec2, scaling: Float) {
        self.translation = translation
        self.scaling = scaling
    }
    
    public static func fromTranslation(_ translation: Vec2) -> Self {
        return Self(translation: translation, scaling: 1.0)
    }
    
    public static func fromScaling(_ scaling: Float) -> Self {
        return Self(translation: .zero, scaling: scaling)
    }
}

// MARK: - TSTransform Methods

extension TSTransform {
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
    public func inverse() -> TSTransform {
        return TSTransform(
            translation: Vec2( -translation.x, -translation.y) / scaling,
            scaling: 1.0 / scaling
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
    public static func * (lhs: Self, rhs: Pos2) -> Pos2 {
        return  rhs * lhs.scaling + Pos2(lhs.translation.x, lhs.translation.y)
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
    public static func * (lhs: Self, rhs: Rect) -> Rect {
        Rect(
            min: lhs * rhs.min,
            max: lhs * rhs.max
        )
    }
}

// MARK: - TSTransform Conformances

// Conformance for vector multiplication
