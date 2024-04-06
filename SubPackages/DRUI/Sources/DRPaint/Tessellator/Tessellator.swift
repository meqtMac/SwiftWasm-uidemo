//
//  Tessellate.swift
//
//
//  Created by 蒋艺 on 2024/4/3.
//

import DRMath
import DRColor
import Foundation

/// Tessellation quality options
public struct TessellationOptions {
    /// Use "feathering" to smooth out the edges of shapes as a form of anti-aliasing.
    ///
    /// Feathering works by making each edge into a thin gradient into transparency.
    /// The size of this edge is controlled by [`Self::feathering_size_in_pixels`].
    ///
    /// This makes shapes appear smoother, but requires more triangles and is therefore slower.
    ///
    /// This setting does not affect text.
    ///
    /// Default: `true`.
    public var feathering: Bool = true

    /// The size of the the feathering, in physical pixels.
    ///
    /// The default, and suggested, value for this is `1.0`.
    /// If you use a larger value, edges will appear blurry.
    public var feathering_size_in_pixels: Float32 = 1.0

    /// If `true` (default) cull certain primitives before tessellating them.
    /// This likely makes
    public var coarse_tessellation_culling: Bool = true

    /// If `true`, small filled circled will be optimized by using pre-rasterized circled
    /// from the font atlas.
    public var prerasterized_discs: Bool = true

    /// If `true` (default) align text to mesh grid.
    /// This makes the text sharper on most platforms.
    public var round_text_to_pixels: Bool = true

    /// Output the clip rectangles to be painted.
    public var debug_paint_clip_rects: Bool = false

    /// Output the text-containing rectangles.
    public var debug_paint_text_rects: Bool = false

    /// If true, no clipping will be done.
    public var debug_ignore_clip_rects: Bool = false

    /// The maximum distance between the original curve and the flattened curve.
    public var bezier_tolerance: Float32 = 0.1

    /// The default value will be 1.0e-5, it will be used during float compare.
    public var epsilon: Float32 = 1e-5

    /// If `rayon` feature is activated, should we parallelize tessellation?
    public var parallel_tessellation: Bool = true

    /// If `true`, invalid meshes will be silently ignored.
    /// If `false`, invalid meshes will cause a panic.
    ///
    /// The default is `false` to save performance.
    public var validate_meshes: Bool = false
}

/// Converts [`Shape`]s into triangles ([`Mesh`]).
///
/// For performance reasons it is smart to reuse the same [`Tessellator`].
///
/// See also [`tessellate_shapes`], a convenient wrapper around [`Tessellator`].
public struct Tessellator {
    @usableFromInline
    var pixels_per_point:  Float32
    
    @usableFromInline
    var options: TessellationOptions
    @usableFromInline
    var font_tex_size: (Int, Int)

    /// See [`TextureAtlas::prepared_discs`].
    @usableFromInline
    var prepared_discs: [PreparedDisc]

    /// size of feathering in points. normally the size of a physical pixel. 0.0 if disabled
     @usableFromInline
    var feathering: Float32

    /// Only used for culling
     @usableFromInline
    var clip_rect: Rect

     @usableFromInline
    var scratchpad_points: [Pos2]
    
     @usableFromInline
    var scratchpad_path: Path
    
    /// Create a new [`Tessellator`].
    ///
    /// * `pixels_per_point`: number of physical pixels to each logical point
    /// * `options`: tessellation quality
    /// * `shapes`: what to tessellate
    /// * `font_tex_size`: size of the font texture. Required to normalize glyph uv rectangles when tessellating text.
    /// * `prepared_discs`: What [`TextureAtlas::prepared_discs`] returns. Can safely be set to an empty vec.
 
    public init(
        pixels_per_point: Float32,
        options: TessellationOptions,
        font_tex_size: (Int, Int),
        prepared_discs: [PreparedDisc]
   ) {
        let feathering: Float32 = if options.feathering {
            options.feathering_size_in_pixels * 1.0 / pixels_per_point
        } else {
            0.0
        }
        self.pixels_per_point = pixels_per_point
        self.options = options
        self.font_tex_size = font_tex_size
        self.prepared_discs = prepared_discs
        self.feathering = feathering
        self.clip_rect = .everything
        self.scratchpad_points = []
        self.scratchpad_path = .init()
    }
}


public extension Tessellator {
    /// Set the `Rect` to use for culling.
        mutating func setClipRect(_ clipRect: Rect) {
            self.clip_rect = clipRect
        }

        /// Round a point to pixel if `roundTextToPixels` is enabled.
        @inlinable
        func roundToPixel(_ point: Float) -> Float {
            if options.round_text_to_pixels {
                return (point * pixels_per_point).rounded() / pixels_per_point
            } else {
                return point
            }
        }

//        /// Tessellate a clipped shape into a list of primitives.
//        mutating func tessellateClippedShape(
//            _ clippedShape: ClippedShape,
//            outPrimitives: inout [ClippedPrimitive]
//        ) {
//            let clip_rect = clippedShape.clip_rect
//            let shape = clippedShape.shape
//
//            guard clip_rect.isPositive() else {
//                return
//            }
//            
//            if case .Vec(let shapes) = shape {
//                for shape in shapes {
//                    tessellateClippedShape(ClippedShape(clipRect: clipRect, shape: shape), outPrimitives: &outPrimitives)
//                }
//                return
//            }
//            
//            if case .Callback(let callback) = shape {
//                outPrimitives.append(ClippedPrimitive(clipRect: clipRect, primitive: .Callback(callback)))
//                return
//            }
//
//            let startNewMesh: Bool
//            if let lastPrimitive = outPrimitives.last {
//                switch lastPrimitive.primitive {
//                case .Mesh(let outputMesh):
//                    startNewMesh = lastPrimitive.clipRect != clipRect || outputMesh.textureId != shape.textureId()
//                case .Callback:
//                    startNewMesh = true
//                }
//            } else {
//                startNewMesh = true
//            }
//
//            if startNewMesh {
//                outPrimitives.append(ClippedPrimitive(clipRect: clipRect, primitive: .Mesh(Mesh())))
//            }
//
//            let out = outPrimitives.last!
//
//            if case .Mesh(var outMesh) = out.primitive {
//                self.clipRect = clipRect
//                tessellateShape(shape, into: &outMesh)
//            } else {
//                fatalError("Unexpected state")
//            }
//        }
    
    
    
    /// Tessellate a single [`CircleShape`] into a [`Mesh`].
    ///
    /// * `shape`: the circle to tessellate.
    /// * `out`: triangles are appended to this.
    mutating func tessellateCircle(shape: CircleShape, out: inout Mesh) {
        let center = shape.center
        let radius = shape.radius
        var fill = shape.fill
        let stroke = shape.stroke
        
        if radius <= 0.0 {
            return
        }
        
        if self.options.coarse_tessellation_culling 
            && !self.clip_rect
            .expand(by: radius + stroke.width)
            .contains(center) {
            return
        }
        
        if self.options.prerasterized_discs && fill != .transparent {
            let radiusPx = radius * self.pixels_per_point
            let cutoffRadius = radiusPx * pow(2.0, 0.25)
            
            for disc in prepared_discs {
                if cutoffRadius <= disc.r {
                    let side = radiusPx * disc.w / (pixels_per_point * disc.r)
                    let rect = Rect(center: center, size: Vec2(x: side, y: side))
                    out.addRectWithUv(rect, uv: disc.uv, color: fill)
                    
                    if stroke.isEmpty() {
                        return;
                    } else {
                        // we still need to do the stroke
                        fill = .transparent
                        break;
                    }
                }
            }
        }
        
        self.scratchpad_path.clear()
        self.scratchpad_path.addCircle(center: center, radius: radius)
        self.scratchpad_path.fill(feathering: self.feathering, color: fill, out: &out)
        self.scratchpad_path.strokeClosed(feathering: self.feathering, stroke: stroke, out: &out)
    }
    
    /// Tessellate a single [`EllipseShape`] into a [`Mesh`].
    ///
    /// * `shape`: the ellipse to tessellate.
    /// * `out`: triangles are appended to this.
    mutating func tessellate_ellipse(shape: EllipseShape, out: inout Mesh) {
        let center = shape.center
        let radius = shape.radius
        let fill = shape.fill
        let stroke = shape.stroke

        if radius.x <= 0.0 || radius.y <= 0.0 {
            return
        }

        if self.options.coarse_tessellation_culling 
        && !self
            .clip_rect
            .expand2(by: radius + Vec2(x: stroke.width, y: stroke.width))
            .contains(center)
        {
            return
        }

        // Get the max pixel radius
        let max_radius = UInt32(radius.maxElem() * self.pixels_per_point)

        // Ensure there is at least 8 points in each quarter of the ellipse
        let num_points = max(8, max_radius / 16);

        // Create an ease ratio based the ellipses a and b
        let ratio = ((radius.y / radius.x) / 2.0).clamped(min: 0.0, max: 1.0)

                // Generate points between the 0 to pi/2
        let quarter  =  (1..<num_points)
            .map { i in
            // return 1.0
            let percent = Float(i) / Float(num_points)

                // // Ease the percent value, concentrating points around tight bends
                let eased = 2.0 * (percent - pow(percent, 2.0)) * ratio + pow(percent, 2.0)

                // Scale the ease to the quarter
                let t = eased * Float.pi / 2
                // let t = eased * Float32.pi / 2
                // return [radius.x * cos(t), radius.y * sin(t)]
                return Vec2(x: radius.x * cos(t), y: radius.y * sin(t))
            }

        // Build the ellipse from the 4 known vertices filling arcs between
        // them by mirroring the points between 0 and pi/2
        var points: [Pos2] = []
        points.append(center + Vec2(x: radius.x, y: 0.0))
        points.append(contentsOf: quarter.map{ center + $0 })
        points.append(center + Vec2(x: 0.0, y: radius.y))
        points.append(contentsOf: quarter.map { center + Vec2(x: -$0.x, y: $0.y)})
        points.append(center + Vec2(x: -radius.x, y: 0.0))
        points.append(contentsOf: quarter.map {center - $0})
        points.append(center + Vec2(x: 0.0, y: -radius.y))
        points.append(contentsOf: quarter.map { center + Vec2(x: $0.x, y: $0.y)})
    
        self.scratchpad_path.clear()
        self.scratchpad_path.addLineLoop(points: points)
        self.scratchpad_path.fill(feathering: self.feathering, color: fill, out: &out)
        self.scratchpad_path
            .strokeClosed(feathering: self.feathering, stroke: stroke, out: &out)
   }
 
    /// Tessellate a single [`Mesh`] into a [`Mesh`].
    ///
    /// * `mesh`: the mesh to tessellate.
    /// * `out`: triangles are appended to this.
    mutating func tessellate_mesh(mesh: Mesh, out: inout Mesh) {
        if !mesh.isValid() {
            // crate::epaint_assert!(false, "Invalid Mesh in Shape::Mesh");
            assertionFailure("Invalid Mesh in Shape::Mesh")
            return;
        }

        if self.options.coarse_tessellation_culling
            && !self.clip_rect.intersects(mesh.calcBounds())
        {
            return;
        }

        out.append(ref: mesh)
    }


    /// Tessellate a line segment between the two points with the given stroke into a [`Mesh`].
    ///
    /// * `shape`: the mesh to tessellate.
    /// * `out`: triangles are appended to this.
    mutating func tessellate_line(points: (Pos2, Pos2), stroke: Stroke, out: inout Mesh) {
        if stroke.isEmpty() {
            return;
        }

        if self.options.coarse_tessellation_culling
            && !self
                .clip_rect
                .intersects(
                    Rect(twoPos: points.0, b: points.1)
                    .expand(by: stroke.width)
                )
        {
            return;
        }

        self.scratchpad_path.clear();
        // self.scratchpad_path.add_line_segment(points);
        self.scratchpad_path.addLineSegment(points: points)
        self.scratchpad_path
            .strokeOpen(feathering: self.feathering, stroke: stroke, out: &out)
    }

    /// Tessellate a single [`PathShape`] into a [`Mesh`].
    ///
    /// * `path_shape`: the path to tessellate.
    /// * `out`: triangles are appended to this.
    mutating func tessellate_path(path_shape: PathShape, out: inout Mesh) {
        if path_shape.points.count < 2 {
            return
        }

        if self.options.coarse_tessellation_culling
        && !path_shape.visual_bounding_rect().intersects(self.clip_rect) {
            return
        }

        let points = path_shape.points
        let closed = path_shape.closed
        let fill = path_shape.fill
        let stroke = path_shape.stroke

        self.scratchpad_path.clear()
        if closed {
            self.scratchpad_path.addLineLoop(points: points)
        } else {
            self.scratchpad_path.addOpenPoints(points: points)
        }

        if fill != .transparent {
            assertionFailure("You asked to fill a path that is not closed. That makes no sense")
            self.scratchpad_path.fill(feathering: self.feathering, color: fill, out: &out)
        }

        let typ = if closed {
            PathType.closed
        } else {
            PathType.open
        }


        self.scratchpad_path
            .stroke(feathering: self.feathering, pathType: typ, stroke: stroke, out: &out)
    }

    /// Tessellate a single [`Rect`] into a [`Mesh`].
    ///
    /// * `rect`: the rectangle to tessellate.
    /// * `out`: triangles are appended to this.
    mutating func tessllate_rect(rect: RectShape, out: inout Mesh) {
        var rounding = rect.rounding
        let fill = rect.fill
        let stroke = rect.stroke
        var blur_width = rect.blur_width
        let fill_texture_id = rect.fill_texture_id
        let uv = rect.uv
        var rect = rect.rect
        if self.options.coarse_tessellation_culling
            && !rect.expand(by: stroke.width).intersects(self.clip_rect) {
            return
        }

        if rect.isNegative() {
            return
        }

        // It is common to (sometimes accidentally) create an infinitely sized rectangle.
        // Make sure we can handle that:
        // rect.min = max(rect.min, Pos2(x: -1e7, y: -1e7)
        rect.min = rect.min.max(Pos2(x: -1e7, y: -1e7))
        rect.max = rect.max.min(Pos2(x: -1e7, y: -1e7))

        let old_feathering = self.feathering

        if old_feathering < blur_width {
            // We accomplish the blur by using a larger-than-normal feathering.
            // Feathering is usually used to make the edges of a shape softer for anti-aliasing.

            // The tessellator can't handle blurring/feathering larger than the smallest side of the rect.
            // Thats because the tessellator approximate very thin rectangles as line segments,
            // and these line segments don't have rounded corners.
            // When the feathering is small (the size of a pixel), this is usually fine,
            // but here we have a huge feathering to simulate blur,
            // so we need to avoid this optimization in the tessellator,
            // which is also why we add this rather big epsilon:
            let eps: Float32 = 0.1
            blur_width = blur_width
                .min(rect.size().minElem() - eps)
                .max(0.0)

            rounding += Rounding.same(radius: 0.5 * blur_width)

            self.feathering = self.feathering.max(blur_width)
        }

        if rect.width < self.feathering {
            // Very thin - approximate by a vertical line-segment:
            let line = (rect.centerTop(), rect.centerBottom());
            if fill != .transparent {
                self.tessellate_line(points: line, stroke: stroke, out: &out)
            }
            if !stroke.isEmpty() {
                self.tessellate_line(points: line, stroke: stroke, out: &out)
                self.tessellate_line(points: line, stroke: stroke, out: &out)
            }
        } else if rect.height < self.feathering {
            // Very thin - approximate by a horizontal line-segment:
            let line = (rect.leftCenter(), rect.rightCenter())
            if fill != .transparent {
                self.tessellate_line(points: line, stroke: Stroke(width: rect.height, color: fill), out: &out)
            }
            if !stroke.isEmpty() {
                self.tessellate_line(points: line, stroke: stroke, out: &out)
                self.tessellate_line(points: line, stroke: stroke, out: &out)
            }
        } else {
            // let path = &
            self.scratchpad_path.clear()
            // self.scratchpad_path.round
            Path.roundedRectangle(path: &self.scratchpad_points, rect: rect, rounding: rounding)
            // self.scratchpad_path.ro
            self.scratchpad_path.addLineLoop(points: self.scratchpad_points)

            if uv.isPositive() {
                // Textured
                // let uv_from_pos = 
                func uv_from_pos(_ p: Pos2) -> Pos2 {
                    Pos2(
                        x: remap(p.x, rect.xRange(), uv.xRange()), 
                        y: remap(p.y, rect.yRange(), uv.yRange())
                    )
                }

                self.scratchpad_path
                    .fillWithUV(
                        feathering: self.feathering, 
                        color: fill, 
                        textureId: fill_texture_id, 
                        uvFromPos: uv_from_pos(_:), 
                        out: &out)
            } else {
                // Untextured
                self.scratchpad_path
                    .fill(feathering: self.feathering, color: fill, out: &out)
            }
            self.scratchpad_path
            .strokeClosed(feathering: self.feathering, stroke: stroke, out: &out)
        }
        
        self.feathering = old_feathering
    }
        
    /// Tessellate a single [`TextShape`] into a [`Mesh`].
    /// * `text_shape`: the text to tessellate.
    /// * `out`: triangles are appended to this.
    mutating func tessellate_text(text_shape: TextShape, out: inout Mesh) {
        // TODO: implementation
    }

    /// Tessellate a single [`QuadraticBezierShape`] into a [`Mesh`].
    ///
    /// * `quadratic_shape`: the shape to tessellate.
    /// * `out`: triangles are appended to this.
     mutating func tessellate_quadratic_bezier(
        quadratic_shape: QuadraticBezierShape,
        out: inout Mesh
    ) {
        let options = self.options;
        let clip_rect = self.clip_rect;

        // if options.coarse_tessellation_culling
        //     && !quadratic_shape
        //     // .visual_bounding_rect.intersects(clip_rect)
        // {
        //     return;
        // }

        // let points = quadratic_shape.flatten(Some(options.bezier_tolerance));

        // self.tessellate_bezier_complete(
        //     &points,
        //     quadratic_shape.fill,
        //     quadratic_shape.closed,
        //     quadratic_shape.stroke,
        //     out,
        // );
    }



 


}
