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

///// A path which can be stroked and/or filled (if closed).
//public struct PathShape {
//    /// Filled paths should prefer clockwise order.
//    public var points: Array<Pos2>
//
//    /// If true, connect the first and last of the points together.
//    /// This is required if `fill != TRANSPARENT`.
//    public var closed: Bool
//
//    /// Fill is only supported for convex polygons.
//    public var fill: Color32
//
//    /// Color and thickness of the line.
//    public var stroke: Stroke
//    // TODO(emilk): Add texture support either by supplying uv for each point,
//    // or by some transform from points to uv (e.g. a callback or a linear transform matrix).
//}




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



