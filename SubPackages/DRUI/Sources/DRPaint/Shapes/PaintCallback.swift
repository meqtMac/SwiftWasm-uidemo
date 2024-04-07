//
//  PaintCallback.swift
//
//
//  Created by 蒋艺 on 2024/4/5.
//

import DRMath

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
    public var screen_size_px: (UInt32, UInt32)
    
    public init(viewport: Rect, clip_rect: Rect, pixels_per_point: Float32, screen_size_px: (UInt32, UInt32)) {
        self.viewport = viewport
        self.clip_rect = clip_rect
        self.pixels_per_point = pixels_per_point
        self.screen_size_px = screen_size_px
    }
}

extension PaintCallbackInfo {
    // TODO: -
    // view_port_in_pixels
    // clip_rect_in_pixels
    /// The viewport rectangle. This is what you would use in e.g. `glViewport`.
    public func viewport_in_pixels() -> ViewportInPixels {
        ViewportInPixels.from_points(rect: self.viewport, pixels_per_point: self.pixels_per_point, screen_size_px: self.screen_size_px)
    }

    /// The "scissor" or "clip" rectangle. This is what you would use in e.g. `glScissor`.
    public func clip_rect_in_pixels() -> ViewportInPixels {
        ViewportInPixels.from_points(rect: self.clip_rect, pixels_per_point: self.pixels_per_point, screen_size_px: self.screen_size_px)
    }

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
    public var callback: Any
//    Arc<dyn Any + Send + Sync>,
}

