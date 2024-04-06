//
//  Shadow.swift
//
//
//  Created by 蒋艺 on 2024/4/3.
//

import DRMath
import DRColor

/// The color and fuzziness of a fuzzy shape.
///
/// Can be used for a rectangular shadow with a soft penumbra.
///
/// Very similar to a box-shadow in CSS.
public struct Shadow {
    /// Move the shadow by this much.
    ///
    /// For instance, a value of `[1.0, 2.0]` will move the shadow 1 point to the right and 2 points down,
    /// causing a drop-shadow effet.
    public var offset: Vec2

    /// The width of the blur, i.e. the width of the fuzzy penumbra.
    ///
    /// A value of 0.0 means a sharp shadow.
    public var blur: Float32

    /// Expand the shadow in all directions by this much.
    public var spread: Float32

    /// Color of the opaque center of the shadow.
    public var color: Color32
}

public extension Shadow {
    /// No shadow at all.
    static let NONE: Self = Self (
        offset: .zero,
        blur: 0.0,
        spread: 0.0,
        color: .transparent
        )

    /// The argument is the rectangle of the shadow caster.
    func as_shape(rect: Rect, rounding: Rounding) -> RectShape {
        // tessellator.clip_rect = clip_rect; // TODO(emilk): culling

//        let (
//            offset,
//            blur,
//            spread,
//            color,
//        ) = *self;
//
        let offset = self.offset
        let blur = self.blur
        let spread = self.spread
        let color = self.color
        
        let rect = rect.translated(by: offset).expand(by: spread)
//        rect.translate(offset).expand(spread);
//        let rounding = rounding.into() + Rounding::same(spread.abs());
        let rounding = rounding + Rounding.same(radius: spread.abs())

//        RectShape::filled(rect, rounding, color).with_blur_width(blur)
        return RectShape.filled(rect: rect, rounding: rounding, fill_color: color)
    }

    /// How much larger than the parent rect are we in each direction?
    func margin() -> Margin {
       let offset = self.offset
        let blur = self.blur
        let spread = self.spread
        return Margin (
            left: spread + 0.5 * blur - offset.x,
            right: spread + 0.5 * blur + offset.x,
        top: spread + 0.5 * blur - offset.y,
        bottom: spread + 0.5 * blur + offset.y
            )
    }
}
