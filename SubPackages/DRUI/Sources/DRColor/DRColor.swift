//
//  lib.swift
//
//
//  Created by 蒋艺 on 2024/4/1.
//

import Foundation
#if canImport(DRColorMacroImpl)
import DRColorMacroImpl

@freestanding(expression)
public macro hexColor(_ hexString: StaticString) -> Color32 = #externalMacro(module: "DRColorMacroImpl", type: "HexToColorMacro")
#endif

/// Color conversions and types.
///
/// If you want a compact color representation, use `Color32`.
/// If you want to manipulate RGBA colors, use `Rgba`.
/// If you want to manipulate colors in a way closer to how humans think about colors, use `HsvaGamma`.
///
/// ## Feature flags
/// #![cfg_attr(feature = "document-features", doc = document_features::document_features!())]
///
/// #![allow(clippy::wrong_self_convention)]
///
/// #[cfg(feature = "cint")]
/// mod cint_impl;
///
/// mod color32;
/// pub use color32::*;
///
/// mod hsva_gamma;
/// pub use hsva_gamma::*;
///
/// mod hsva;
/// pub use hsva::*;
///
/// #[cfg(feature = "color-hex")]
/// mod hex_color_macro;
///
/// mod rgba;
/// pub use rgba::*;
///
/// mod hex_color_runtime;
/// pub use hex_color_runtime::*;
///
/// Color conversion:
///
/// ```
/// # use crate::{Color32, Rgba};
/// # use std::f32;
/// # use std::u8;
/// #
/// impl From<Color32> for Rgba {
///     fn from(srgba: Color32) -> Self {
///         Self([
///             linear_f32_from_gamma_u8(srgba.0[0]),
///             linear_f32_from_gamma_u8(srgba.0[1]),
///             linear_f32_from_gamma_u8(srgba.0[2]),
///             linear_f32_from_linear_u8(srgba.0[3]),
///         ])
///     }
/// }
///
/// impl From<Rgba> for Color32 {
///     fn from(rgba: Rgba) -> Self {
///         Self([
///             gamma_u8_from_linear_f32(rgba.0[0]),
///             gamma_u8_from_linear_f32(rgba.0[1]),
///             gamma_u8_from_linear_f32(rgba.0[2]),
///             linear_u8_from_linear_f32(rgba.0[3]),
///         ])
///     }
/// }
/// ```
///
/// gamma [0, 255] -> linear [0, 1].
public func linearF32FromGammaU8(_ s: UInt8) -> Float32 {
    if s <= 10 {
        return Float32(s) / 3294.6
    } else {
        return pow((Float32(s) + 14.025) / 269.025, 2.4)
    }
}

/// linear [0, 255] -> linear [0, 1].
/// Useful for alpha-channel.
///
/// - Parameter a: Alpha channel value in the range [0, 255].
/// - Returns: Alpha channel value in the range [0, 1].
public func linearF32FromLinearU8(_ a: UInt8) -> Float32 {
    return Float32(a) / 255.0
}

/// linear [0, 1] -> gamma [0, 255] (clamped).
/// Values outside this range will be clamped to the range.
///
/// - Parameter l: Linear value in the range [0, 1].
/// - Returns: Gamma-corrected value in the range [0, 255].
public func gammaU8FromLinearF32(_ l: Float32) -> UInt8 {
    if l <= 0.0 {
        return 0
    } else if l <= 0.0031308 {
        return fastRound(3294.6 * l)
    } else if l <= 1.0 {
        return fastRound(269.025 * pow(l, 1.0 / 2.4) - 14.025)
    } else {
        return 255
    }
}

/// linear [0, 1] -> linear [0, 255] (clamped).
/// Useful for alpha-channel.
///
/// - Parameter a: Alpha channel value in the range [0, 1].
/// - Returns: Alpha channel value in the range [0, 255].
public func linearU8FromLinearF32(_ a: Float32) -> UInt8 {
    return fastRound(a * 255.0)
}


public func fastRound(_ r: Float32) -> UInt8 {
//    return UInt8((r + 0.5).rounded(.toNearestOrEven))
    return UInt8(r.rounded())
}

///// An assert that is only active when `epaint` is compiled with the `extra_asserts` feature
///// or with the `extra_debug_asserts` feature in debug builds.
/////
///// - Parameter condition: The condition to check.
//public func ecolorAssert(_ condition: Bool) {
//    if any(
//        feature == "extra_asserts",
//        all(feature == "extra_debug_asserts", debug_assertions)
//    ) {
//        assert(condition)
//    }
//}

/// gamma [0, 1] -> linear [0, 1] (not clamped).
/// Works for numbers outside this range (e.g. negative numbers).
public func linearfromGamma(_ gamma: Float32) -> Float32 {
    if gamma < 0.0 {
        -linearfromGamma(-gamma)
    } else if gamma <= 0.04045 {
        gamma / 12.92
    } else {
        pow((gamma + 0.055) / 1.055, 2.4)
    }
}



public func gammaFromLinear(_ linear: Float32) -> Float32 {
    if linear < 0.0 {
        return -gammaFromLinear(-linear)
    } else if linear <= 0.0031308 {
        return 12.92 * linear
    } else {
        return 1.055 * pow(linear, 1.0/2.4) - 0.055
    }
}

/// Cheap and ugly.
/// Made for graying out disabled `Ui`s.
///
/// - Parameters:
///   - color: The color to tint.
///   - target: The target color to tint towards.
/// - Returns: The tinted color.
public func tintColorTowards(_ color: Color32, _ target: Color32) -> Color32 {
    var (r, g, b, a) = color.toTuple()

    if a == 0 {
        r /= 2
        g /= 2
        b /= 2
    } else if a < 170 {
        let div = UInt8( (2 * 255 / Int(a)) )
        r = r / 2 + target.r / div
        g = g / 2 + target.g / div
        b = b / 2 + target.b / div
        a /= 2
    } else {
        r = r / 2 + target.r / 2
        g = g / 2 + target.g / 2
        b = b / 2 + target.b / 2
    }
    return Color32.fromRgbaPremultiplied(r: r, g: g, b: b, a: a)
}

