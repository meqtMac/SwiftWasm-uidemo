//
//  Hsva.swift
//
//
//  Created by 蒋艺 on 2024/4/1.
//

/// Hue, saturation, value, alpha. All in the range [0, 1].
/// No premultiplied alpha.
public struct Hsva: Hashable, Equatable {
    /// hue 0-1
    public var h: Float32
    
    /// saturation 0-1
    public var s: Float32
    
    /// value 0-1
    public var v: Float32
    
    /// alpha 0-1. A negative value signifies an additive color (and alpha is ignored).
    public var a: Float32
    
    /// Creates a new HSVA color.
    ///
    /// - Parameters:
    ///   - h: The hue component in the range [0, 1].
    ///   - s: The saturation component in the range [0, 1].
    ///   - v: The value component in the range [0, 1].
    ///   - a: The alpha component in the range [0, 1].
    public init(h: Float32, s: Float32, v: Float32, a: Float32) {
        self.h = h
        self.s = s
        self.v = v
        self.a = a
    }
    
//    impl From<Rgba> for Hsva {
//        #[inline]
//        fn from(rgba: Rgba) -> Self {
//            Self::from_rgba_premultiplied(rgba.0[0], rgba.0[1], rgba.0[2], rgba.0[3])
//        }
//    }
    public init(rgba: Rgba) {
        self = Hsva.fromRgbaPremultiplied(r: rgba.r, g: rgba.g, b: rgba.b, a: rgba.a)
    }
    
    public init(srgba: Color32) {
        self = Hsva(rgba: Rgba(srgba: srgba))
    }
    


}

public extension Hsva {
    /// Creates an HSVA color from sRGBA components with premultiplied alpha.
    ///
    /// - Parameter rgba: The sRGBA components with premultiplied alpha.
    /// - Returns: The created HSVA color.
    @inlinable static func fromSrgbaPremultiplied(r: UInt8, g: UInt8, b: UInt8, a: UInt8) -> Hsva {
        let r = linearF32FromGammaU8(r)
        let g = linearF32FromGammaU8(g)
        let b = linearF32FromGammaU8(b)
        let a = linearF32FromLinearU8(a)
        return Hsva.fromRgbaPremultiplied(r: r, g: g, b: b, a: a)
    }
    
    /// Creates an HSVA color from sRGBA components without premultiplied alpha.
    ///
    /// - Parameter rgba: The sRGBA components without premultiplied alpha.
    /// - Returns: The created HSVA color.
    @inlinable static func fromSrgbaUnmultiplied(r: UInt8, g: UInt8, b: UInt8, a: UInt8) -> Hsva {
        let r = linearF32FromGammaU8(r)
        let g = linearF32FromGammaU8(g)
        let b = linearF32FromGammaU8(b)
        let a = linearF32FromLinearU8(a)
        return Hsva.fromRgbaUnmultiplied(r: r, g: g, b: b, a: a)
    }
    
    /// Creates an HSVA color from RGBA components with premultiplied alpha.
    ///
    /// - Parameters:
    ///   - r: The red component in the range [0, 1].
    ///   - g: The green component in the range [0, 1].
    ///   - b: The blue component in the range [0, 1].
    ///   - a: The alpha component in the range [0, 1].
    /// - Returns: The created HSVA color.
    @inlinable static func fromRgbaPremultiplied(r: Float32, g: Float32, b: Float32, a: Float32) -> Hsva {
        if a == 0.0 {
            if r == 0.0 && b == 0.0 && a == 0.0 {
                return Hsva(h: 0, s: 0, v: 0, a: 0) // Default constructor
            } else {
                return Hsva.fromAdditiveRgb(r: r, g: g, b: b)
            }
        } else {
            let (h, s, v) = hsvFromRgb(r: r / a, g: g / a, b: b / a)
            return Hsva(h: h, s: s, v: v, a: a)
        }
    }
    
    /// Creates an HSVA color from RGBA components without premultiplied alpha.
    ///
    /// - Parameters:
    ///   - r: The red component in the range [0, 1].
    ///   - g: The green component in the range [0, 1].
    ///   - b: The blue component in the range [0, 1].
    ///   - a: The alpha component in the range [0, 1].
    /// - Returns: The created HSVA color.
    @inlinable static func fromRgbaUnmultiplied(r: Float, g: Float, b: Float, a: Float) -> Hsva {
        let (h, s, v) = Hsva.hsvFromRgb(r: r, g: g, b: b)
        return Hsva(h: h, s: s, v: v, a: a)
    }
    
    /// Creates an HSVA color from additive RGB components.
    ///
    /// - Parameter rgb: The additive RGB components.
    /// - Returns: The created HSVA color.
    @inlinable static func fromAdditiveRgb(r: Float32, g: Float32, b: Float32) -> Hsva {
        let (h, s, v) = Hsva.hsvFromRgb(r: r, g: g, b: b)
        return Hsva(h: h, s: s, v: v, a: -0.5) // Anything negative is treated as additive
    }
    
    /// Creates an HSVA color from additive sRGB components.
    ///
    /// - Parameter rgb: The additive sRGB components.
    /// - Returns: The created HSVA color.
    @inlinable static func fromAdditiveSrgb(r: UInt8, g: UInt8, b: UInt8) -> Hsva {
        return Hsva.fromAdditiveRgb(
            r: linearF32FromGammaU8(r),
            g: linearF32FromGammaU8(g),
            b: linearF32FromGammaU8(b)
        )
    }
    
    /// Creates an HSVA color from RGB components.
    ///
    /// - Parameter rgb: The RGB components.
    /// - Returns: The created HSVA color.
    @inlinable static func fromRgb(r: Float32, g: Float32, b: Float32) -> Hsva {
        let (h, s, v) = Hsva.hsvFromRgb(r: r, g: g, b: b)
        return Hsva(h: h, s: s, v: v, a: 1.0)
    }
    
    /// Creates an HSVA color from sRGB components.
    ///
    /// - Parameter rgb: The sRGB components.
    /// - Returns: The created HSVA color.
    @inlinable static func fromSrgb(r: UInt8, g: UInt8, b: UInt8) -> Hsva {
        return Hsva.fromRgb(
            r: linearF32FromGammaU8(r),
            g: linearF32FromGammaU8(g),
            b: linearF32FromGammaU8(b)
        )
    }
    
    /// Converts the HSVA color to an opaque color.
    ///
    /// - Returns: The opaque HSVA color.
    @inlinable func toOpaque() -> Hsva {
        return Hsva(h: self.h, s: self.s, v: self.v, a: 1.0)
    }
    
    /// Converts the HSVA color to RGB components.
    ///
    /// - Returns: The RGB components.
    @inlinable func toRgb() -> (r:Float, g: Float32, b: Float32) {
        return Hsva.rgbFromHsv(h: h, s: s, v: v)
    }
    
    /// Converts the HSVA color to sRGB components.
    ///
    /// - Returns: The sRGB components.
    @inlinable func toSrgb() -> (r: UInt8, g: UInt8, b: UInt8) {
        let (r, g, b) = self.toRgb()
        return (
            gammaU8FromLinearF32(r),
            gammaU8FromLinearF32(g),
            gammaU8FromLinearF32(b)
        )
    }
    
    /// Converts the HSVA color to premultiplied RGBA components.
    ///
    /// - Returns: The premultiplied RGBA components.
    @inlinable func toRgbaPremultiplied() -> (r:Float, g: Float32, b: Float32, a: Float32)  {
        let (r, g, b, a) = self.toRgbaUnmultiplied()
        let additive = self.a < 0.0
        if additive {
            return (r, g, b, 0.0)
        } else {
            return (self.a * r, self.a * g, self.a * b, self.a)
        }
    }
    
    /// Converts the HSVA color to RGBA components without premultiplication.
    ///
    /// - Returns: The RGBA components without premultiplication.
    @inlinable func toRgbaUnmultiplied() ->  (r: Float32, g: Float32, b: Float32, a: Float32){
        let (r, g, b) = Hsva.rgbFromHsv(h: h, s: s, v: v)
        return (r, g, b, a)
    }
    
    /// Converts the HSVA color to premultiplied sRGBA components.
    ///
    /// - Returns: The premultiplied sRGBA components.
    @inlinable func toSrgbaPremultiplied() -> (r: UInt8, g: UInt8, b: UInt8, a: UInt8) {
        let rgba = self.toRgbaPremultiplied()
        return (
            gammaU8FromLinearF32(rgba.0),
            gammaU8FromLinearF32(rgba.1),
            gammaU8FromLinearF32(rgba.2),
            linearU8FromLinearF32(rgba.3)
        )
    }
    
    /// Converts the HSVA color to sRGBA components without premultiplication.
    ///
    /// - Returns: The sRGBA components without premultiplication.
    @inlinable func toSrgbaUnmultiplied() -> (r: UInt8, g: UInt8, b: UInt8, a: UInt8) {
        let rgba = self.toRgbaUnmultiplied()
        return (
            gammaU8FromLinearF32(rgba.0),
            gammaU8FromLinearF32(rgba.1),
            gammaU8FromLinearF32(rgba.2),
            linearU8FromLinearF32(abs(rgba.3))
        )
    }
}

extension Hsva {
    /// Converts RGB components to HSVA components.
    ///
    /// - Parameter rgb: The RGB components.
    /// - Returns: The HSVA components.
    @usableFromInline static func hsvFromRgb(r: Float32, g: Float32, b: Float32) -> (h: Float32, s: Float32, v: Float32) {
        let min = min(r, min(g, b))
        let max = max(r, max(g, b))
        let range = max - min
        
        let h: Float32
        if max == min {
            h = 0.0 // Hue is undefined
        } else if max == r {
            h = (g - b) / (6.0 * range)
        } else if max == g {
            h = (b - r) / (6.0 * range) + 1.0 / 3.0
        } else {
            // max == rgb[2]
            h = (r - g) / (6.0 * range) + 2.0 / 3.0
        }
        
        let s = max == 0.0 ? 0.0 : 1.0 - min / max
        return ((h + 1.0).truncatingRemainder(dividingBy: 1.0), s, max)
    }
    
    /// Converts HSVA components to RGB components.
    ///
    /// - Parameter hsv: The HSVA components.
    /// - Returns: The RGB components.
    @usableFromInline static func rgbFromHsv(h: Float32, s: Float32, v: Float32) -> (r: Float32, g: Float32, b: Float32) {
        let h = (h + 1.0).truncatingRemainder(dividingBy: 1.0) // Wrap hue
        let s = min(max(s, 0.0), 1.0)
        
        let f = h * 6.0 - (h * 6.0).rounded(.down)
        let p = v * (1.0 - s)
        let q = v * (1.0 - f * s)
        let t = v * (1.0 - (1.0 - f) * s)
        
        switch Int((h * 6.0).rounded(.down)) % 6 {
        case 0: return (v, t, p)
        case 1: return (q, v, p)
        case 2: return (p, v, t)
        case 3: return (p, q, v)
        case 4: return (t, p, v)
        case 5: return (v, p, q)
        default: fatalError()
        }
    }
}

