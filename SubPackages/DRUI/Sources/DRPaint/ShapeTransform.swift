//
//  ShapeTransform.swift
//
//
//  Created by 蒋艺 on 2024/4/3.
//

import DRColor
import DRMath

/// Remember to handle [`Color32::PLACEHOLDER`] specially!
func adjust_colors(shape: inout Shape, adjust_color: (inout Color32) -> Void) {
    switch shape {
    case .noop:
        return
    case .vec(var array):
        for index in array.indices {
            adjust_colors(shape: &array[index], adjust_color: adjust_color)
        }
    case .lineSegment( _, var stroke):
        adjust_color(&stroke.color)
    case .circle(var circleShape):
        adjust_color(&circleShape.fill)
        adjust_color(&circleShape.stroke.color)
    case .ellipse(var ellipseShape):
        adjust_color(&ellipseShape.fill)
        adjust_color(&ellipseShape.stroke.color)
    case .path(var pathShape):
        adjust_color(&pathShape.fill)
        adjust_color(&pathShape.stroke.color)
    case .rect(var rectShape):
        adjust_color(&rectShape.fill)
        adjust_color(&rectShape.stroke.color)
    case .quadraticBezier(var shape):
        adjust_color(&shape.fill)
        adjust_color(&shape.stroke.color)
    case .cubicBezier(var shape):
        adjust_color(&shape.fill)
        adjust_color(&shape.stroke.color)
    case .mesh(var mesh):
        for index in mesh.vertices.indices {
            adjust_color(&mesh.vertices[index].color)
        }
    case .callback(_):
        break
        // Can't tint user callback code
    }
}
