//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/4/3.
//

import DRMath
import DRColor

/// A paint primitive such as a circle or a piece of text.
/// Coordinates are all screen space points (not physical pixels).
///
/// You should generally recreate your [`Shape`]s each frame,
/// but storing them should also be fine with one exception:
/// [`Shape::Text`] depends on the current `pixels_per_point` (dpi scale)
/// and so must be recreated every time `pixels_per_point` changes.
public enum Shape {
    /// Paint nothing. This can be useful as a placeholder.
    case noop

    /// Recursively nest more shapes - sometimes a convenience to be able to do.
    /// For performance reasons it is better to avoid it.
    case vec(Array<Shape>)

    /// Circle with optional outline and fill.
    case circle(CircleShape)

    /// A line between two points.
    case lineSegment( points: (Pos2, Pos2), stroke: Stroke )

    /// A series of lines between points.
    /// The path can have a stroke and/or fill (if closed).
    case path(PathShape)

    /// Rectangle with optional outline and fill.
    case rect(RectShape)

    /// Text.
    ///
    /// This needs to be recreated if `pixels_per_point` (dpi scale) changes.
    case text(TextShape)

    /// A general triangle mesh.
    ///
    /// Can be used to display images.
    case mesh(Mesh)

    /// A quadratic [Bézier Curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve).
    case quadraticBezier(QuadraticBezierShape)

    /// A cubic [Bézier Curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve).
    case cubicBezier(CubicBezierShape)

    /// Backend-specific painting.
    case callback(PaintCallback)
}

/// How to paint a circle.
public struct CircleShape {
    public var center: Pos2
    public var radius: Float32
    public var fill: Color32
    public var stroke: Stroke
}

/// A path which can be stroked and/or filled (if closed).
public struct PathShape {
    /// Filled paths should prefer clockwise order.
    public var points: Array<Pos2>

    /// If true, connect the first and last of the points together.
    /// This is required if `fill != TRANSPARENT`.
    public var closed: Bool

    /// Fill is only supported for convex polygons.
    public var fill: Color32

    /// Color and thickness of the line.
    public var stroke: Stroke
    // TODO(emilk): Add texture support either by supplying uv for each point,
    // or by some transform from points to uv (e.g. a callback or a linear transform matrix).
}

/// How rounded the corners of things should be
public struct Rounding {
    /// Radius of the rounding of the North-West (left top) corner.
    public var nw: Float32

    /// Radius of the rounding of the North-East (right top) corner.
    public var ne: Float32

    /// Radius of the rounding of the South-West (left bottom) corner.
    public var sw: Float32

    /// Radius of the rounding of the South-East (right bottom) corner.
    public var se: Float32
}


/// How to paint a rectangle.
public struct RectShape {
    public var rect: Rect
    
    /// How rounded the corners are. Use `Rounding::ZERO` for no rounding.
    public var rounding: Rounding

    /// How to fill the rectangle.
    public var fill: Color32

    /// The thickness and color of the outline.
    public var stroke: Stroke

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
}

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
}

///// Creates equally spaced filled circles from a line.
//fn points_from_line(
//    path: &[Pos2],
//    spacing: f32,
//    radius: f32,
//    color: Color32,
//    shapes: &mut Vec<Shape>,
//) {
//    let mut position_on_segment = 0.0;
//    path.windows(2).for_each(|window| {
//        let (start, end) = (window[0], window[1]);
//        let vector = end - start;
//        let segment_length = vector.length();
//        while position_on_segment < segment_length {
//            let new_point = start + vector * (position_on_segment / segment_length);
//            shapes.push(Shape::circle_filled(new_point, radius, color));
//            position_on_segment += spacing;
//        }
//        position_on_segment -= segment_length;
//    });
//}
//
///// Creates dashes from a line.
//fn dashes_from_line(
//    path: &[Pos2],
//    stroke: Stroke,
//    dash_lengths: &[f32],
//    gap_lengths: &[f32],
//    shapes: &mut Vec<Shape>,
//    dash_offset: f32,
//) {
//    assert_eq!(dash_lengths.len(), gap_lengths.len());
//    let mut position_on_segment = dash_offset;
//    let mut drawing_dash = false;
//    let mut step = 0;
//    let steps = dash_lengths.len();
//    path.windows(2).for_each(|window| {
//        let (start, end) = (window[0], window[1]);
//        let vector = end - start;
//        let segment_length = vector.length();
//
//        let mut start_point = start;
//        while position_on_segment < segment_length {
//            let new_point = start + vector * (position_on_segment / segment_length);
//            if drawing_dash {
//                // This is the end point.
//                shapes.push(Shape::line_segment([start_point, new_point], stroke));
//                position_on_segment += gap_lengths[step];
//                // Increment step counter
//                step += 1;
//                if step >= steps {
//                    step = 0;
//                }
//            } else {
//                // Start a new dash.
//                start_point = new_point;
//                position_on_segment += dash_lengths[step];
//            }
//            drawing_dash = !drawing_dash;
//        }
//
//        // If the segment ends and the dash is not finished, add the segment's end point.
//        if drawing_dash {
//            shapes.push(Shape::line_segment([start_point, end], stroke));
//        }
//
//        position_on_segment -= segment_length;
//    });
//}
//
//
// ----------------------------------------------------------------------------

/// Information passed along with [`PaintCallback`] ([`Shape::Callback`]).
public struct PaintCallbackInfo {
    /// Viewport in points.
    ///
    /// This specifies where on the screen to paint, and the borders of this
    /// Rect is the [-1, +1] of the Normalized Device Coordinates.
    ///
    /// Note than only a portion of this may be visible due to [`Self::clip_rect`].
    ///
    /// This comes from [`PaintCallback::rect`].
    public var viewport: Rect

    /// Clip rectangle in points.
    public var clip_rect: Rect

    /// Pixels per point.
    public var pixels_per_point: Float32

    /// Full size of the screen, in pixels.
    public var screen_size_px: (Int32, Int32)
}

/// Size of the viewport in whole, physical pixels.
public struct ViewportInPixels {
    /// Physical pixel offset for left side of the viewport.
    public var left_px: Int32

    /// Physical pixel offset for top side of the viewport.
    public var top_px: Int32

    /// Physical pixel offset for bottom side of the viewport.
    ///
    /// This is what `glViewport`, `glScissor` etc expects for the y axis.
    public var from_bottom_px: Int32

    /// Viewport width in physical pixels.
    public var width_px: Int32

    /// Viewport height in physical pixels.
    public var height_px: Int32
}


/// If you want to paint some 3D shapes inside an egui region, you can use this.
///
/// This is advanced usage, and is backend specific.
public struct PaintCallback {
    /// Where to paint.
    ///
    /// This will become [`PaintCallbackInfo::viewport`].
    public var rect: Rect

    /// Paint something custom (e.g. 3D stuff).
    ///
    /// The concrete value of `callback` depends on the rendering backend used. For instance, the
    /// `glow` backend requires that callback be an `egui_glow::CallbackFn` while the `wgpu`
    /// backend requires a `egui_wgpu::Callback`.
    ///
    /// If the type cannot be downcast to the type expected by the current backend the callback
    /// will not be drawn.
    ///
    /// The rendering backend is responsible for first setting the active viewport to
    /// [`Self::rect`].
    ///
    /// The rendering backend is also responsible for restoring any state, such as the bound shader
    /// program, vertex array, etc.
    ///
    /// Shape has to be clone, therefore this has to be an `Arc` instead of a `Box`.
//    pub callback: Arc<dyn Any + Send + Sync>,
    let callback: Any
}
