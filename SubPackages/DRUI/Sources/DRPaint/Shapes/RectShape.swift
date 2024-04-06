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
}

public extension RectShape {
   // filled
    // stroke
    // with_blur_width
    // visual_bounding_rect
}

