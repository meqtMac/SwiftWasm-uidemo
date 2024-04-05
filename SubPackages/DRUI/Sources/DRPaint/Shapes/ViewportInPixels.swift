//
//  ViewPortInPixels.swift
//
//
//  Created by 蒋艺 on 2024/4/5.
//

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


public extension ViewportInPixels {
    // TODO: -
    // from_points
    
    // 
}
