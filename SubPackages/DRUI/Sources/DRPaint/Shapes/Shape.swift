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
/// [`Shape.Text`] depends on the current `pixels_per_point` (dpi scale)
/// and so must be recreated every time `pixels_per_point` changes.
public enum Shape {
    /// Paint nothing. This can be useful as a placeholder.
    case noop
    
    /// Recursively nest more shapes - sometimes a convenience to be able to do.
    /// For performance reasons it is better to avoid it.
    case vec([Shape])
    
    /// Circle with optional outline and fill.
    case circle(CircleShape)
    
    /// Ellipse with optional outline and fill.
    case ellipse(EllipseShape)
    
    
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
    // TODO: text implementation
    //    case text(TextShape)
    
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

/// ## Constructors
public extension Shape {
    /// A line between two points.
    /// More efficient than calling [`Self.line`].
    @inlinable
    static func line_segment(points: (Pos2, Pos2), stroke: Stroke) -> Self {
        return Self.lineSegment(points: points, stroke: stroke)
    }
    
    /// A horizontal line.
    static func hline(x: ClosedRange<Float32>, y: Float32, stroke: Stroke) -> Self {
        .lineSegment(
            points: (Pos2(x: x.lowerBound, y: y), Pos2(x: x.upperBound, y: y)),
            stroke: stroke
        )
    }
    
    /// A vertical line.
    static func vline(x: Float32, y: ClosedRange<Float32>, stroke: Stroke) -> Self {
        .lineSegment(points: (Pos2(x: x, y: y.lowerBound), Pos2(x: x, y: y.upperBound)), stroke: stroke)
    }
    
    /// A line through many points.
    ///
    /// Use [`Self.line_segment`] instead if your line only connects two points.
    @inlinable
    static func line(points: Array<Pos2>, stroke: Stroke) -> Self {
        //        Self.Path(PathShape.line(points, stroke))
        .path(PathShape.line(points: points, stroke: stroke))
    }
    
    /// A line that closes back to the start point again.
    @inlinable
    static func closed_line(points: Array<Pos2>, stroke: Stroke) -> Self {
        .path(PathShape.closed_line(points: points, stroke: stroke))
    }
    
    /// Turn a line into equally spaced dots.
    static func dotted_line(
        path: [Pos2],
        color: Color32,
        spacing: Float32,
        radius: Float32
    ) -> Array<Self> {
        var shapes: [Shape] = []
        points_from_line(path: path, spacing: spacing
                         , radius: radius
                         , color: color, shapes: &shapes)
        return shapes
    }
    
    /// Turn a line into dashes.
    static func dashed_line(
        path: [Pos2],
        stroke: Stroke,
        dash_length: Float32,
        gap_length: Float32
    ) -> Array<Self> {
        var shapes: [Shape] = []
        dashes_from_line(path: path, stroke: stroke, dash_lengths: [dash_length], gap_lengths: [gap_length], shapes: &shapes, dash_offset: 0.0)
        return shapes
    }
    
    /// Turn a line into dashes with different dash/gap lengths and a start offset.
    static func dashed_line_with_offset(
        path: [Pos2],
        stroke: Stroke,
        dash_lengths: [Float32],
        gap_lengths: [Float32],
        dash_offset: Float32
    ) -> Array<Self> {
        var shapes: [Shape] = []
        dashes_from_line(path: path, stroke: stroke, dash_lengths: dash_lengths, gap_lengths: gap_lengths, shapes: &shapes, dash_offset: dash_offset)
        return shapes
    }
    
    /// Turn a line into dashes. If you need to create many dashed lines use this instead of
    /// [`Self.dashed_line`].
    static func dashed_line_many(
        points: [Pos2],
        stroke: Stroke,
        dash_length: Float32,
        gap_length: Float32,
        shapes: inout Array<Self>
    ) {
        dashes_from_line(path: points, stroke: stroke, dash_lengths: [dash_length], gap_lengths: [gap_length], shapes: &shapes, dash_offset: 0.0)
    }
    
    /// Turn a line into dashes with different dash/gap lengths and a start offset. If you need to
    /// create many dashed lines use this instead of [`Self.dashed_line_with_offset`].
    static func dashed_line_many_with_offset(
        points: [Pos2],
        stroke: Stroke,
        dash_lengths:[Float32],
        gap_lengths: [Float32],
        dash_offset: Float32,
        shapes: inout Array<Self>
    ) {
        dashes_from_line(path: points, stroke: stroke, dash_lengths: dash_lengths, gap_lengths: gap_lengths, shapes: &shapes, dash_offset: dash_offset)
    }
    
    /// A convex polygon with a fill and optional stroke.
    ///
    /// The most performant winding order is clockwise.
    @inlinable
    static func convex_polygon(
        points: Array<Pos2>,
        fill: Color32,
        stroke: Stroke
    ) -> Self {
        .path(PathShape.convex_polygon(points: points, fill: fill, stroke: stroke))
    }
    
    @inlinable
    static func circle_filled(center: Pos2, radius: Float32, fill_color: Color32) -> Self {
        //        Self.Circle(CircleShape.filled(center, radius, fill_color))
        .circle(CircleShape.filled(center: center, radius: radius, fill_color: fill_color))
    }
    
    @inlinable
    static func circle_stroke(center: Pos2, radius: Float32, stroke: Stroke) -> Self {
        .circle(CircleShape.stroke(center: center, radius: radius, stroke: stroke))
    }
    
    @inlinable
    static func ellipse_filled(center: Pos2, radius: Vec2, fill_color: Color32) -> Self {
        .ellipse(EllipseShape.filled(center: center, radius: radius, fill_color: fill_color))
    }
    
    @inlinable
    static func ellipse_stroke(center: Pos2, radius: Vec2, stroke: Stroke) -> Self {
        .ellipse(EllipseShape.stroke(center: center, radius: radius, stroke: stroke))
    }
    
    @inlinable
    static func rect_filled(
        rect: Rect,
        rounding: Rounding,
        fill_color: Color32
    ) -> Self {
        .rect(.filled(rect: rect, rounding: rounding, fill_color: fill_color))
    }
    
    @inlinable
    static func rect_stroke(
        rect: Rect,
        rounding: Rounding,
        stroke: Stroke
    ) -> Self {
        .rect(.stroke(rect: rect, rounding: rounding, stroke: stroke))
    }
    
    //    static func text(
    //        fonts: &Fonts,
    //        pos: Pos2,
    //        anchor: Align2,
    //        text: impl ToString,
    //        font_id: FontId,
    //        color: Color32,
    //    ) -> Self {
    //        let galley = fonts.layout_no_wrap(text.to_string(), font_id, color);
    //        let rect = anchor.anchor_size(pos, galley.size());
    //        Self.galley(rect.min, galley, color)
    //    }
    
    /// Any uncolored parts of the [`Galley`] (using [`Color32.PLACEHOLDER`]) will be replaced with the given color.
    ///
    /// Any non-placeholder color in the galley takes precedence over this fallback color.
    //    @inlinable
    //    static func galley(pos: Pos2, galley: Arc<Galley>, fallback_color: Color32) -> Self {
    //        TextShape.new(pos, galley, fallback_color).into()
    //    }
    
    /// All text color in the [`Galley`] will be replaced with the given color.
    //    @inlinable
    //    static func galley_with_override_text_color(
    //        pos: Pos2,
    //        galley: Arc<Galley>,
    //        text_color: Color32,
    //    ) -> Self {
    //        TextShape.new(pos, galley, text_color)
    //            .with_override_text_color(text_color)
    //            .into()
    //    }
    
    //    @inlinable
    //    @available(*, deprecated, renamed: "Shape.galley", message: "Use `Shape.galley` or `Shape.galley_with_override_text_color` instead")
    //    static func galley_with_color(pos: Pos2, galley: Arc<Galley>, text_color: Color32) -> Self {
    //        Self.galley_with_override_text_color(pos, galley, text_color)
    //    }
    
//    @inlinable
//    static func mesh(mesh: Mesh) -> Self {
//        //        crate.epaint_assert!(mesh.is_valid());
//        assert(mesh.isValid())
//        return .mesh(mesh: mesh)
//    }
    
    /// An image at the given position.
    ///
    /// `uv` should normally be `Rect.from_min_max(pos2(0.0, 0.0), pos2(1.0, 1.0))`
    /// unless you want to crop or flip the image.
    ///
    /// `tint` is a color multiplier. Use [`Color32.WHITE`] if you don't want to tint the image.
    static func image(texture_id: TextureId, rect: Rect, uv: Rect, tint: Color32) -> Self {
        var mesh = Mesh(texture_id: texture_id)
        mesh.addRectWithUv(rect, uv: uv, color: tint)
        return .mesh(mesh)
    }
    
    /// The visual bounding rectangle (includes stroke widths)
    func visual_bounding_rect() -> Rect {
        switch self {
        case .noop:
            return .nothing
        case .vec(let shapes):
            var rect = Rect.nothing
            for shape in shapes {
                rect = rect.union(shape.visual_bounding_rect())
            }
            return rect
        case .circle(let shape):
            return shape.visual_bounding_rect()
        case var .ellipse(ellipse_shape):
            return ellipse_shape.visual_bounding_rect()
        case let .lineSegment(points, stroke):
            if stroke.is_empty() {
                return .nothing
            } else {
                return Rect(twoPos: points.0, b: points.1).expand(by: stroke.width / 2.0)
            }
        case let .path(path):
            return path.visual_bounding_rect()
        case let .rect(rect):
            return rect.visual_bounding_rect()
        case let .mesh(mesh):
            return mesh.calcBounds()
        case let .quadraticBezier(shape):
            return shape.visual_bounding_rect()
        case let .cubicBezier(shape):
            return shape.visual_bounding_rect()
        case let .callback(custom):
            return custom.rect
        }
        
    }
}

/// ## Inspection and transforms
public extension Shape {
    @inline(__always)
    func texture_id() -> TextureId {
        //        if let Self.Mesh(mesh) = self {
        //            mesh.texture_id
        //        } else if let Self.Rect(rect_shape) = self {
        //            rect_shape.fill_texture_id
        //        } else {
        //            super.TextureId.default()
        //        }
        if case let .mesh(mesh) = self {
            return mesh.texture_id
        } else if case let .rect(rect) = self {
            return rect.fill_texture_id
        } else {
            return .default
        }
    }
    
    /// Scale the shape by `factor`, in-place.
    ///
    /// A wrapper around [`Self.transform`].
    @inline(__always)
    mutating func scale(factor: Float32) {
        self.transform(transform: TSTransform(scaling: factor, translation: .zero));
    }
    
    /// Move the shape by `delta`, in-place.
    ///
    /// A wrapper around [`Self.transform`].
    @inline(__always)
    mutating func translate(delta: Vec2) {
        self.transform(transform: TSTransform(scaling: 1.0, translation: delta))
    }
    
    /// Move the shape by this many points, in-place.
    ///
    /// If using a [`PaintCallback`], note that only the rect is scaled as opposed
    /// to other shapes where the stroke is also scaled.
    mutating func transform(transform: TSTransform) {
        switch self {
        case .noop:
            break
        case .vec(var shapes):
            for index in shapes.indices {
                shapes[index].transform(transform: transform);
            }
        case .circle(var circle_shape):
            circle_shape.center = transform * circle_shape.center;
            circle_shape.radius *= transform.scaling;
            circle_shape.stroke.width *= transform.scaling;
        case .ellipse(var ellipse_shape):
            ellipse_shape.center = transform * ellipse_shape.center;
            ellipse_shape.radius *= transform.scaling;
            ellipse_shape.stroke.width *= transform.scaling;
        case var .lineSegment(points, stroke):
            points.0 = transform * points.0
            points.1 = transform * points.1
            stroke.width *= transform.scaling;
        case .path(var path_shape):
            for index in path_shape.points.indices {
                path_shape.points[index] = transform * path_shape.points[index]
            }
            path_shape.stroke.width *= transform.scaling;
        case .rect(var rect_shape):
            rect_shape.rect = transform * rect_shape.rect;
            rect_shape.stroke.width *= transform.scaling;
            rect_shape.rounding *= transform.scaling;
            //            }
            ////            Self.Text(text_shape) => {
            //        case
            //                text_shape.pos = transform * text_shape.pos;
            //
            //                // Scale text:
            //                let galley = Arc.make_mut(&mut text_shape.galley);
            //                for row in &mut galley.rows {
            //                    row.visuals.mesh_bounds = transform.scaling * row.visuals.mesh_bounds;
            //                    for v in &mut row.visuals.mesh.vertices {
            //                        v.pos = Pos2.new(transform.scaling * v.pos.x, transform.scaling * v.pos.y);
            //                    }
            //                }
            //
            //                galley.mesh_bounds = transform.scaling * galley.mesh_bounds;
            //                galley.rect = transform.scaling * galley.rect;
            //            }
            //            Self.Mesh(mesh) => {
        case .mesh(var mesh):
            mesh.transform(by: transform);
        case var .quadraticBezier(bezier_shape):
            bezier_shape.points.0 = transform * bezier_shape.points.0
            bezier_shape.points.1 = transform * bezier_shape.points.1;
            bezier_shape.points.2 = transform * bezier_shape.points.2;
            bezier_shape.stroke.width *= transform.scaling;
        case var .cubicBezier(cubic_curve):
            cubic_curve.points.0 = transform * cubic_curve.points.0
            cubic_curve.points.1 = transform * cubic_curve.points.1
            cubic_curve.points.2 = transform * cubic_curve.points.2
            cubic_curve.points.3 = transform * cubic_curve.points.3
            cubic_curve.stroke.width *= transform.scaling;
        case var .callback(shape):
            shape.rect = transform * shape.rect
        }
    }
}




/// Creates equally spaced filled circles from a line.
func points_from_line(
    path: [Pos2],
    spacing: Float32,
    radius: Float32,
    color: Color32,
    shapes: inout Array<Shape>
) {
    var position_on_segment: Float32 = 0.0;
    path.window2()
        .forEach { window in
            let (start, end) = (window.0, window.1)
            let vector = end - start
            let segment_length = vector.length()
            
            
            while position_on_segment < segment_length {
                let new_point = start + vector * (position_on_segment / segment_length)
                shapes.append(.circle_filled(center: new_point, radius: radius, fill_color: color))
            }
            position_on_segment -= segment_length
        }
    
    
}

/// Creates dashes from a line.
func dashes_from_line(
    path: [Pos2],
    stroke: Stroke,
    dash_lengths: [Float32],
    gap_lengths: [Float32],
    shapes: inout Array<Shape>,
    dash_offset: Float32
) {
    //    assert_eq!(dash_lengths.len(), gap_lengths.len());
    assert(dash_lengths.count == gap_lengths.count)
    var position_on_segment = dash_offset;
    var drawing_dash = false;
    var step = 0;
    let steps = dash_lengths.count;
    //    path.windows(2).for_each(|window| {
    path.window2().forEach { window in
        let (start, end) = (window.0, window.1);
        let vector = end - start;
        let segment_length = vector.length();
        
        var start_point = start;
        while position_on_segment < segment_length {
            let new_point = start + vector * (position_on_segment / segment_length);
            if drawing_dash {
                // This is the end point.
                shapes.append(.lineSegment(points: (start_point, new_point), stroke: stroke))
                position_on_segment += gap_lengths[step];
                // Increment step counter
                step += 1;
                if step >= steps {
                    step = 0;
                }
            } else {
                // Start a new dash.
                start_point = new_point;
                position_on_segment += dash_lengths[step];
            }
            drawing_dash = !drawing_dash;
        }
        
        // If the segment ends and the dash is not finished, add the segment's end point.
        if drawing_dash {
            shapes.append(.lineSegment(points: (start_point, end), stroke: stroke))
        }
        
        position_on_segment -= segment_length;
    }
}


// ----------------------------------------------------------------------------



