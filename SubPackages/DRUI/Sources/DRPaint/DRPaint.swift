//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/26.
//

import DRMath

/// The UV coordinate of a white region of the texture mesh.
/// The default egui texture has the top-left corner pixel fully white.
/// You need need use a clamping texture sampler for this to work
/// (so it doesn't do bilinear blending with bottom right corner).
public let WHITE_UV: Pos2 = Pos2(x: 0, y: 0)

/// What texture to use in a [`Mesh`] mesh.
///
/// If you don't want to use a texture, use `TextureId::Managed(0)` and the [`WHITE_UV`] for uv-coord.
public enum TextureId: Equatable, Hashable {
    /// Textures allocated using [`TextureManager`].
    ///
    /// The first texture (`TextureId::Managed(0)`) is used for the font data.
    case managed(UInt64)

    /// Your own texture, defined in any which way you want.
    /// The backend renderer will presumably use this to look up what texture to use.
    case user(UInt64)
    
    public static let `default` = TextureId.managed(0)
}

/// A [`Shape`] within a clip rectangle.
///
/// Everything is using logical points.
public struct ClippedShape {
    /// Clip / scissor rectangle.
    /// Only show the part of the [`Shape`] that falls within this.
public var clip_rect: Rect

    /// The shape
    public var shape: Shape

}

