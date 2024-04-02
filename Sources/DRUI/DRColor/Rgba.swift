//
//  Rgba.swift
//
//
//  Created by 蒋艺 on 2024/4/1.
//

import Foundation

/// 0-1 linear space `RGBA` color with premultiplied alpha.
@frozen
public struct Rgba: Equatable, Hashable {
    public var r: Float32
    public var g: Float32
    public var b: Float32
    public var a: Float32
    
    public init(srgba: Color32) {
        self.r = linearF32FromGammaU8(srgba.r)
        self.g = linearF32FromGammaU8(srgba.g)
        self.b = linearF32FromGammaU8(srgba.b)
        self.a = linearF32FromLinearU8(srgba.a)
    }
    
    @usableFromInline
    init(_ r: Float32, _ g: Float32, _ b: Float32, _ a: Float32) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
 
//    public init
}

import Foundation

/// A structure representing RGBA colors.
public extension Rgba {
    /// Transparent black
     static let transparent = Rgba.fromRgbaPremultiplied(r: 0.0, g: 0.0, b: 0.0, a: 0.0)
    /// Black
     static let black = Rgba.fromRgb(r: 0.0, g: 0.0, b: 0.0)
    /// White
     static let white = Rgba.fromRgb(r: 1.0, g: 1.0, b: 1.0)
    /// Red
     static let red = Rgba.fromRgb(r: 1.0, g: 0.0, b: 0.0)
    /// Green
     static let green = Rgba.fromRgb(r: 0.0, g: 1.0, b: 0.0)
    /// Blue
     static let blue = Rgba.fromRgb(r: 0.0, g: 0.0, b: 1.0)

    /// Creates an RGBA color from premultiplied components.
    ///
    /// - Parameters:
    ///   - r: The red component in the range [0, 1].
    ///   - g: The green component in the range [0, 1].
    ///   - b: The blue component in the range [0, 1].
    ///   - a: The alpha component in the range [0, 1].
    /// - Returns: The created RGBA color.
     @inlinable
    static func fromRgbaPremultiplied(r: Float, g: Float, b: Float, a: Float) -> Rgba {
        return Rgba(r, g, b, a)
    }

    /// Creates an RGBA color from unpremultiplied components.
    ///
    /// - Parameters:
    ///   - r: The red component in the range [0, 1].
    ///   - g: The green component in the range [0, 1].
    ///   - b: The blue component in the range [0, 1].
    ///   - a: The alpha component in the range [0, 1].
    /// - Returns: The created RGBA color.
     @inlinable 
    static func fromRgbaUnmultiplied(r: Float, g: Float, b: Float, a: Float) -> Rgba {
        return Rgba(r * a, g * a, b * a, a)
    }

    /// Creates an RGBA color from sRGBA components.
    ///
    /// - Parameters:
    ///   - r: The red component in the range [0, 255].
    ///   - g: The green component in the range [0, 255].
    ///   - b: The blue component in the range [0, 255].
    ///   - a: The alpha component in the range [0, 255].
    /// - Returns: The created RGBA color.
     @inlinable 
    static func fromSrgbaPremultiplied(r: UInt8, g: UInt8, b: UInt8, a: UInt8) -> Rgba {
        let r = linearF32FromGammaU8(r)
        let g = linearF32FromGammaU8(g)
        let b = linearF32FromGammaU8(b)
        let a = linearF32FromLinearU8(a)
        return Rgba.fromRgbaPremultiplied(r: r, g: g, b: b, a: a)
    }

    /// Creates an RGBA color from unpremultiplied sRGBA components.
    ///
    /// - Parameters:
    ///   - r: The red component in the range [0, 255].
    ///   - g: The green component in the range [0, 255].
    ///   - b: The blue component in the range [0, 255].
    ///   - a: The alpha component in the range [0, 255].
    /// - Returns: The created RGBA color.
     @inlinable 
    static func fromSrgbaUnmultiplied(r: UInt8, g: UInt8, b: UInt8, a: UInt8) -> Rgba {
        let r = linearF32FromGammaU8(r)
        let g = linearF32FromGammaU8(g)
        let b = linearF32FromGammaU8(b)
        let a = linearF32FromLinearU8(a)
        return Rgba.fromRgbaPremultiplied(r: r * a, g: g * a, b: b * a, a: a)
    }

    /// Creates an RGBA color from RGB components.
    ///
    /// - Parameters:
    ///   - r: The red component in the range [0, 1].
    ///   - g: The green component in the range [0, 1].
    ///   - b: The blue component in the range [0, 1].
    /// - Returns: The created RGBA color.
     @inlinable 
    static func fromRgb(r: Float32, g: Float32, b: Float32) -> Rgba {
        return Rgba(r, g, b, 1.0)
    }

    /// Creates a grayscale RGBA color.
    ///
    /// - Parameter l: The luminance value in the range [0, 1].
    /// - Returns: The created RGBA color.
     @inlinable 
    static func fromGray(l: Float32) -> Rgba {
        return Rgba(l, l, l, 1.0)
    }

    /// Creates an RGBA color from luminance and alpha components.
    ///
    /// - Parameters:
    ///   - l: The luminance value in the range [0, 1].
    ///   - a: The alpha value in the range [0, 1].
    /// - Returns: The created RGBA color.
     @inlinable 
    static func fromLuminanceAlpha(l: Float, a: Float) -> Rgba {
        assert(0.0 <= l && l <= 1.0)
        assert(0.0 <= a && a <= 1.0)
        return Rgba(l * a, l * a, l * a, a)
    }

    /// Creates a transparent black RGBA color.
    ///
    /// - Parameter a: The alpha value in the range [0, 1].
    /// - Returns: The created RGBA color.
     @inlinable 
    static func fromBlackAlpha(a: Float) -> Rgba {
       assert(0.0 <= a && a <= 1.0)
        return Rgba(0.0, 0.0, 0.0, a)
    }

    /// Creates a transparent white RGBA color.
    ///
    /// - Parameter a: The alpha value in the range [0, 1].
    /// - Returns: The created RGBA color.
     @inlinable 
    static func fromWhiteAlpha(a: Float) -> Rgba {
       assert(0.0 <= a && a <= 1.0)
        return Rgba(a, a, a, a)
    }

    /// Returns an additive version of this color (alpha = 0).
    ///
    /// - Returns: The additive version of the color.
     @inlinable
    func additive() -> Rgba {
        return Rgba(r, g, b, 0.0)
    }

    /// Checks if the alpha is 0.
    ///
    /// - Returns: A boolean value indicating if the alpha is 0.
    @inlinable
    func isAdditive() -> Bool {
        return a == 0.0
    }

    /// Multiplies the color by a factor.
    ///
    /// - Parameter alpha: The factor to multiply by.
    /// - Returns: The multiplied color.
    @inlinable
    func multiply(by alpha: Float) -> Rgba {
        return Rgba(
            alpha * r,
            alpha * g,
            alpha * b,
            alpha * a
        )
    }

    /// The intensity of the color.
    ///
    /// - Returns: The intensity of the color.
    @inlinable
    var intensity: Float32 {
        return 0.3 * r + 0.59 * g + 0.11 * b
    }

    /// Returns an opaque version of the color.
    ///
    /// - Returns: The opaque version of the color.
    @inlinable
    func toOpaque() -> Rgba {
        if a == 0.0 {
            return Rgba.fromRgb(r: r, g: g, b: b)
        } else {
            return Rgba.fromRgb(
                r: r / a,
                g: g / a,
                b: b / a
            )
        }
    }
    
    /// unmultiply the alpha
    @inlinable
    func toRgbaUnmultiplied() -> (r: Float32, g: Float32, b: Float32, a: Float32) {
        if a == 0.0 {
            // Additive, let's assume we are black
            return (r, g, b, a)
        } else {
            return (r / a, g / a, b / a, a)
        }
    }
    
    /// unmultiply the alpha
    @inlinable
    func toSrgbaUnmultipiled() -> (r: UInt8, g: UInt8, b: UInt8, a: UInt8) {
        return (gammaU8FromLinearF32(r),
                gammaU8FromLinearF32(g),
                gammaU8FromLinearF32(b),
                linearU8FromLinearF32(a))
    }
 
}

/// Adds two RGBA colors.
///
/// - Parameters:
///   - lhs: The left-hand side RGBA color.
///   - rhs: The right-hand side RGBA color.
/// - Returns: The result of adding the two RGBA colors.
public func + (lhs: Rgba, rhs: Rgba) -> Rgba {
    return Rgba(
        lhs.r + rhs.r,
        lhs.g + rhs.g,
        lhs.b + rhs.b,
        lhs.a + rhs.a
    )
}

/// Multiplies two RGBA colors.
///
/// - Parameters:
///   - lhs: The left-hand side RGBA color.
///   - rhs: The right-hand side RGBA color.
/// - Returns: The result of multiplying the two RGBA colors.
public func * (lhs: Rgba, rhs: Rgba) -> Rgba {
    return Rgba(
        lhs.r * rhs.r,
        lhs.g * rhs.g,
        lhs.b * rhs.b,
        lhs.a * rhs.a
    )
}

/// Multiplies an RGBA color by a scalar.
///
/// - Parameters:
///   - lhs: The scalar.
///   - rhs: The RGBA color.
/// - Returns: The result of multiplying the RGBA color by the scalar.
public func * (lhs: Float32, rhs: Rgba) -> Rgba {
    return Rgba(
        lhs * rhs.r,
        lhs * rhs.g,
        lhs * rhs.b,
        lhs * rhs.a
    )
}

/// Multiplies an RGBA color by a scalar.
///
/// - Parameters:
///   - lhs: The RGBA color.
///   - rhs: The scalar.
/// - Returns: The result of multiplying the RGBA color by the scalar.
public func * (lhs: Rgba, rhs: Float) -> Rgba {
    return rhs * lhs
}

