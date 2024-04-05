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
    }
 
    
    
}
