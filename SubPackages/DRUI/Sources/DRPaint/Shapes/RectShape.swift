//
//  RectShape.swift
//  
//
//  Created by 蒋艺 on 2024/4/5.
//

import DRMath
import DRColor


/// How to paint a rectangle.
public struct RectShape {
    public var rect: Rect
    
    /// How rounded the corners are. Use `Rounding::ZERO` for no rounding.
    public var rounding: Rounding

    /// How to fill the rectangle.
    public var fill: Color32

    /// The thickness and color of the outline.
    public var stroke: Stroke

    /// If larger than zero, the edges of the rectangle
    /// (for both fill and stroke) will be blurred.
    ///
    /// This can be used to produce shadows and glow effects.
    ///
    /// The blur is currently implemented using a simple linear blur in sRGBA gamma space.
    public var blur_width: Float32


    /// If the rect should be filled with a texture, which one?
    ///
    /// The texture is multiplied with [`Self::fill`].
    public var fill_texture_id: TextureId

    /// What UV coordinates to use for the texture?
    ///
    /// To display a texture, set [`Self::fill_texture_id`],
    /// and set this to `Rect::from_min_max(pos2(0.0, 0.0), pos2(1.0, 1.0))`.
    ///
    /// Use [`Rect::ZERO`] to turn off texturing.
    public var uv: Rect
    
    // init
    @inlinable
    public init(rect: Rect, rounding: Rounding, fill: Color32, stroke: Stroke, blur_width: Float32, fill_texture_id: TextureId, uv: Rect) {
        self.rect = rect
        self.rounding = rounding
        self.fill = fill
        self.stroke = stroke
        self.blur_width = blur_width
        self.fill_texture_id = fill_texture_id
        self.uv = uv
    }
}

public extension RectShape {
    @inlinable
    static func filled(
        rect: Rect,
        rounding: Rounding,
        fill_color: Color32
    ) -> Self {
       return Self(rect: rect, rounding: rounding, fill: fill_color, stroke: .none, blur_width: 0.0, fill_texture_id: .default, uv: .zero)
    }

    @inlinable
    static func stroke(rect: Rect, rounding: Rounding, stroke: Stroke) -> Self {
        return Self(rect: rect, rounding: rounding, fill: .transparent, stroke: stroke, blur_width: 0.0, fill_texture_id: .default, uv: .zero)
    }

    /// If larger than zero, the edges of the rectangle
    /// (for both fill and stroke) will be blurred.
    ///
    /// This can be used to produce shadows and glow effects.
    ///
    /// The blur is currently implemented using a simple linear blur in `sRGBA` gamma space.
    @inlinable
    func with_blur_width(_ blur_width: Float32) -> Self {
        var shape = self
        shape.blur_width = blur_width;
        return shape
    }

    /// The visual bounding rectangle (includes stroke width)
    @inlinable
    func visual_bounding_rect() -> Rect {
        if self.fill == Color32.transparent && self.stroke.is_empty() {
            return .zero
        } else {
            return self.rect
                .expand(by: (self.stroke.width + self.blur_width) / 2.0)
        }
    }
}

