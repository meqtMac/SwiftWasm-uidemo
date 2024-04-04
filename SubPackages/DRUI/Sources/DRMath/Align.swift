//
//  Align.swift
//
//
//  Created by 蒋艺 on 2024/4/2.
//

// MARK: Checked

/// left/center/right or top/center/bottom alignment for e.g. anchors and layouts.
public enum Align {
    /// Left or top.
    case min
    
    /// Horizontal or vertical center.
    case center
    
    /// Right or bottom.
    case max
}

public extension Align {
    
    /// Convenience for [`Self::Min`]
    static let left: Align = .min
    
    /// Convenience for [`Self::Max`]
    static let right: Align = .max
    
    /// Convenience for [`Self::Min`]
    static let top: Align = .min
    
    /// Convenience for [`Self::Max`]
    static let bottom: Align = .max
    
    /// Convert `Min => 0.0`, `Center => 0.5` or `Max => 1.0`.
    @inline(__always)
    func toFactor() -> Float {
        switch self {
        case .min: return 0.0
        case .center: return 0.5
        case .max: return 1.0
        }
    }
    
    /// Convert `Min => -1.0`, `Center => 0.0` or `Max => 1.0`.
    @inline(__always)
func toSign() -> Float {
        switch self {
        case .min: return -1.0
        case .center: return 0.0
        case .max: return 1.0
        }
    }
    
    /// Returns a range of given size within a specified range.
    ///
    /// If the requested `size` is bigger than the size of `range`, then the returned
    /// range will not fit into the available `range`. The extra space will be allocated
    /// from:
    ///
    /// |Align |Side        |
    /// |------|------------|
    /// |Min   |right (end) |
    /// |Center|both        |
    /// |Max   |left (start)|
    ///
    /// # Examples
    /// ```
    /// use std::f32::{INFINITY, NEG_INFINITY};
    /// use emath::Align::*;
    ///
    /// // The size is smaller than a range
    /// assert_eq!(Min   .align_size_within_range(2.0, 10.0..=20.0), 10.0..=12.0);
    /// assert_eq!(Center.align_size_within_range(2.0, 10.0..=20.0), 14.0..=16.0);
    /// assert_eq!(Max   .align_size_within_range(2.0, 10.0..=20.0), 18.0..=20.0);
    ///
    /// // The size is bigger than a range
    /// assert_eq!(Min   .align_size_within_range(20.0, 10.0..=20.0), 10.0..=30.0);
    /// assert_eq!(Center.align_size_within_range(20.0, 10.0..=20.0),  5.0..=25.0);
    /// assert_eq!(Max   .align_size_within_range(20.0, 10.0..=20.0),  0.0..=20.0);
    ///
    /// // The size is infinity, but range is finite - a special case of a previous example
    /// assert_eq!(Min   .align_size_within_range(INFINITY, 10.0..=20.0),         10.0..=INFINITY);
    /// assert_eq!(Center.align_size_within_range(INFINITY, 10.0..=20.0), NEG_INFINITY..=INFINITY);
    /// assert_eq!(Max   .align_size_within_range(INFINITY, 10.0..=20.0), NEG_INFINITY..=20.0);
    /// ```
    ///
    /// The infinity-sized ranges can produce a surprising results, if the size is also infinity,
    /// use such ranges with carefully!
    ///
    /// ```
    /// use std::f32::{INFINITY, NEG_INFINITY};
    /// use emath::Align::*;
    ///
    /// // Allocating a size aligned for infinity bound will lead to empty ranges!
    /// assert_eq!(Min   .align_size_within_range(2.0, 10.0..=INFINITY),     10.0..=12.0);
    /// assert_eq!(Center.align_size_within_range(2.0, 10.0..=INFINITY), INFINITY..=INFINITY);// (!)
    /// assert_eq!(Max   .align_size_within_range(2.0, 10.0..=INFINITY), INFINITY..=INFINITY);// (!)
    ///
    /// assert_eq!(Min   .align_size_within_range(2.0, NEG_INFINITY..=20.0), NEG_INFINITY..=NEG_INFINITY);// (!)
    /// assert_eq!(Center.align_size_within_range(2.0, NEG_INFINITY..=20.0), NEG_INFINITY..=NEG_INFINITY);// (!)
    /// assert_eq!(Max   .align_size_within_range(2.0, NEG_INFINITY..=20.0),         18.0..=20.0);
    ///
    ///
    /// // The infinity size will always return the given range if it has at least one infinity bound
    /// assert_eq!(Min   .align_size_within_range(INFINITY, 10.0..=INFINITY), 10.0..=INFINITY);
    /// assert_eq!(Center.align_size_within_range(INFINITY, 10.0..=INFINITY), 10.0..=INFINITY);
    /// assert_eq!(Max   .align_size_within_range(INFINITY, 10.0..=INFINITY), 10.0..=INFINITY);
    ///
    /// assert_eq!(Min   .align_size_within_range(INFINITY, NEG_INFINITY..=20.0), NEG_INFINITY..=20.0);
    /// assert_eq!(Center.align_size_within_range(INFINITY, NEG_INFINITY..=20.0), NEG_INFINITY..=20.0);
    /// assert_eq!(Max   .align_size_within_range(INFINITY, NEG_INFINITY..=20.0), NEG_INFINITY..=20.0);
    /// ```
    @inlinable
    func alignSizeWithinRange(_ size: Float, _ range: ClosedRange<Float>) -> ClosedRange<Float> {
        let min = range.lowerBound
        let max = range.upperBound
        
        switch self {
        case .min: return min...(min + size)
        case .center:
            if size == .infinity {
                return .infinity...(.infinity)
            } else {
                let left = (min + max) / 2.0 - size / 2.0
                return left...(left + size)
            }
        case .max: return (max - size)...max
        }
    }
}

/// Two-dimension alignment, e.g. [`Align2::LEFT_TOP`].
public struct Align2 {
    public var xAlign: Align
    public var yAlign: Align
    
    @inlinable
    public init(_ xAlign: Align, _ yAlign: Align) {
        self.xAlign = xAlign
        self.yAlign = yAlign
    }
}

public extension Align2 {
    
    
    static let leftBottom: Align2 = Align2(.min, .max)
    static let leftCenter: Align2 = Align2(.min, .center)
    static let leftTop: Align2 = Align2(.min, .min)
    static let centerBottom: Align2 = Align2(.center, .max)
    static let centerCenter: Align2 = Align2(.center, .center)
    static let centerTop: Align2 = Align2(.center, .min)
    static let rightBottom: Align2 = Align2(.max, .max)
    static let rightCenter: Align2 = Align2(.max, .center)
    static let rightTop: Align2 = Align2(.max, .min)
    
    /// Returns an alignment by the X (horizontal) axis
    @inline(__always)
    func x() -> Align {
        return xAlign
    }
    
    /// Returns an alignment by the Y (vertical) axis
    @inline(__always)
    func y() -> Align {
        return yAlign
    }
    
    /// -1, 0, or +1 for each axis
    func toSign() -> Vec2 {
        //        return SIMD2<Float>(x().toSign(), y().toSign())
        Vec2(x: xAlign.toSign(), y: yAlign.toSign())
    }
    
    /// Used e.g. to anchor a piece of text to a part of the rectangle.
    /// Give a position within the rect, specified by the aligns
    func anchorRect(_ rect: Rect) -> Rect {
        let x: Float32 = switch xAlign {
        case .min: rect.left
        case .center: rect.left - 0.5 * rect.width
        case .max: rect.right - rect.width
        }
        let y: Float32 = switch yAlign {
        case .min: rect.top
        case .center: rect.top - 0.5 * rect.height
        case .max: rect.top - rect.height
            
        }
        return Rect(min: Pos2(x: x, y: y), size: rect.size())
    }
    
    /// Use this anchor to position something around `pos`,
    /// e.g. [`Self::RIGHT_TOP`] means the right-top of the rect
    /// will end up at `pos`.
    func anchorSize(_ pos: Pos2 , _ size: Vec2) -> Rect {
        let x: Float32 = switch xAlign {
        case .min: pos.x
        case .center: pos.x - 0.5 * size.x
        case .max: pos.x - size.x
        }
        let y: Float32 = switch yAlign {
        case .min: pos.y
        case .center: pos.y - 0.5 * size.y
        case .max: pos.y - size.y
        }
        
        return Rect(min: Pos2(x: x, y: y), size: size)
        
    }
    
    /// e.g. center a size within a given frame
    func alignSizeWithinRect(_ size: Vec2, _ frame: Rect) -> Rect {
        let xRange = xAlign.alignSizeWithinRange(size.x, frame.xRange())
        let yRange = yAlign.alignSizeWithinRange(size.y, frame.yRange())
        return Rect(xRange: xRange, yRange: yRange)
        
    }
    
    /// Returns the point on the rect's frame or in the center of a rect according
    /// to the alignments of this object.
    ///
    /// ```text
    /// (*)-----------+------(*)------+-----------(*)--> X
    ///  |            |               |            |
    ///  |  Min, Min  |  Center, Min  |  Max, Min  |
    ///  |            |               |            |
    ///  +------------+---------------+------------+
    ///  |            |               |            |
    /// (*)Min, Center|Center(*)Center|Max, Center(*)
    ///  |            |               |            |
    ///  +------------+---------------+------------+
    ///  |            |               |            |
    ///  |  Min, Max  | Center, Max   |  Max, Max  |
    ///  |            |               |            |
    /// (*)-----------+------(*)------+-----------(*)
    ///  |
    ///  Y
    /// ```
    func posInRect(_ frame: Rect) -> Pos2 {
        let x: Float32 = switch xAlign {
        case .min: frame.left
        case .center: frame.center.x
        case .max: frame.right
        }
        let y: Float32 = switch yAlign {
        case .min: frame.top
        case .center: frame.center.y
        case .max: frame.bottom
        }
        
        return Pos2(x: x, y: y)
    }
}

/// Allocates a rectangle of the specified `size` inside the `frame` rectangle
/// around of its center.
///
/// If `size` is bigger than the `frame`s size the returned rect will bounce out
/// of the `frame`.
public func centerSizeInRect(size: Vec2, frame: Rect) -> Rect {
    Align2.centerCenter.alignSizeWithinRect(size, frame)
}

