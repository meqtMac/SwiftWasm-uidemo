//
//  TextShape.swift
//
//
//  Created by 蒋艺 on 2024/4/5.
//

import DRMath
import DRColor

/// How to paint some text on screen.
///
/// This needs to be recreated if `pixels_per_point` (dpi scale) changes.
public struct TextShape {
    /// Top left corner of the first character.
    public var pos: Pos2

    /// The laid out text, from [`Fonts::layout_job`].
//    public var galley: Arc<Galley>

    /// Add this underline to the whole text.
    /// You can also set an underline when creating the galley.
    public var underline: Stroke

    /// Any [`Color32::PLACEHOLDER`] in the galley will be replaced by the given color.
    /// Affects everything: backgrounds, glyphs, strikethough, underline, etc.
    public var fallback_color: Color32

    /// If set, the text color in the galley will be ignored and replaced
    /// with the given color.
    ///
    /// This only affects the glyphs and will NOT replace background color nor strikethrough/underline color.
    public var override_text_color: Color32?

    /// If set, the text will be rendered with the given opacity in gamma space
    /// Affects everything: backgrounds, glyphs, strikethough, underline, etc.
    public var opacity_factor: Float32

    /// Rotate text by this many radians clockwise.
    /// The pivot is `pos` (the upper left corner of the text).
    public var angle: Float32
    
    // TODO: -
    // init
}

public extension TextShape {
    // visual_bounding_rect
    // with_underline
    // with_override_text_color
    // with_angle
    // with_opacity_factor
}


