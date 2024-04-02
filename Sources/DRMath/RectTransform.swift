//
//  RectTransform.swift
//
//
//  Created by 蒋艺 on 2024/4/2.
//

// MARK: Checked
/// Linearly transforms positions from one [`Rect`] to another.
///
/// [`RectTransform`] stores the rectangles, and therefore supports clamping and culling.
public struct RectTransform {
    public var from: Rect
    public var to: Rect
    
    public init(from: Rect, to: Rect) {
        self.from = from
        self.to = to
    }
    
    public static func identity(fromAndTo: Rect) -> RectTransform {
        return RectTransform(from: fromAndTo, to: fromAndTo)
    }
    
    /// The scale factors.
    public func scale() -> Vec2 {
        return to.size() / from.size()
    }
    
    
    public func inverse() -> RectTransform {
        return RectTransform(from: to, to: from)
    }
    
    /// Transforms the given coordinate in the `from` space to the `to` space.
    public func transformPos(pos: Pos2) -> Pos2 {
        Pos2(
            x: remap(pos.x, self.from.xRange(), self.to.xRange()),
            y: remap(pos.y, self.from.yRange(), self.to.yRange())
        )
    }
    
    /// Transforms the given rectangle in the `in`-space to a rectangle in the `out`-space.
    public func transformRect(rect: Rect) -> Rect {
        return Rect(
            min: self.transformPos(pos: rect.min),
            max: self.transformPos(pos: rect.max)
        )
    }
    
    /// Transforms the given coordinate in the `from` space to the `to` space,
    /// clamping if necessary.
    public func transformPosClamped(pos: Pos2) -> Pos2 {
        return Pos2(
            x: remapClamp(pos.x, self.from.xRange(), self.to.xRange()),
            y: remapClamp(pos.y, self.from.yRange(), self.to.yRange())
        )
    }
}

public extension RectTransform {
    
    /// Transforms the position.
    static func *(lhs: RectTransform, rhs: Pos2) -> Pos2 {
        return lhs.transformPos(pos: rhs)
    }
}
