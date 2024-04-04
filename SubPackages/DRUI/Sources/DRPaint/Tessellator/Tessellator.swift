//
//  Tessellate.swift
//
//
//  Created by 蒋艺 on 2024/4/3.
//

import DRMath
import DRColor

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
    var pixels_per_point:  Float32
    var options: TessellationOptions
    var font_tex_size: (Int, Int)

    /// See [`TextureAtlas::prepared_discs`].
    var prepared_discs: [PreparedDisc]

    /// size of feathering in points. normally the size of a physical pixel. 0.0 if disabled
    var feathering: Float32

    /// Only used for culling
    var clip_rect: Rect

    var scratchpad_points: [Pos2]
    var scratchpad_path: Path
}
