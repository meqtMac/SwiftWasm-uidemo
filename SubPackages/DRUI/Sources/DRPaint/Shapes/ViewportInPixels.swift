//
//  ViewPortInPixels.swift
//
//
//  Created by 蒋艺 on 2024/4/5.
//
import DRMath
import DRColor

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


extension ViewportInPixels {
    // TODO: -
    // from_points
    
    public static func from_points(rect: Rect, pixels_per_point: Float32, screen_size_px: (UInt32, UInt32)) -> Self {
        // Fractional pixel values for viewports are generally valid, but may cause sampling issues
        // and rounding errors might cause us to get out of bounds.

        // Round:
        var left_px = Int32( (pixels_per_point * rect.min.x).rounded() )
        var top_px = Int32( (pixels_per_point * rect.min.y).rounded())
        var right_px = Int32( (pixels_per_point * rect.max.x).rounded())
        var bottom_px = Int32( (pixels_per_point * rect.max.y).rounded() )

        // Clamp to screen:
        let screen_width = Int32( screen_size_px.0)
        let screen_height = Int32( screen_size_px.1)
        left_px = min(screen_width, max(0, left_px))
        right_px = min(screen_width, max(left_px, right_px))
        top_px = min(screen_height, max(0, top_px))
        bottom_px = min(screen_height, max(top_px, bottom_px))

        let width_px = right_px - left_px;
        let height_px = bottom_px - top_px;
        
       return Self(left_px: left_px, top_px: top_px, from_bottom_px: screen_height - height_px - top_px, width_px: width_px, height_px: height_px)
    }

    //
}
