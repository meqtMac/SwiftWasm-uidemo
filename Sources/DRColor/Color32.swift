//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

/// This format is used for space-efficient color representation (32 bits).
///
/// Instead of manipulating this directly it is often better
/// to first convert it to either `Rgba` or `Hsva`.
///
/// Internally this uses 0-255 gamma space `sRGBA` color with premultiplied alpha.
/// Alpha channel is in linear space.
///
/// The special value of alpha=0 means the color is to be treated as an additive color.
@frozen
public struct Color32: Hashable, Equatable {
    
    public var r: UInt8
    
    public var g: UInt8
    
    public var b: UInt8
    
    public var a: UInt8
    
    @usableFromInline
    init(_ r: UInt8, _ g: UInt8, _ b: UInt8, _ a: UInt8) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
    
    @inlinable
    public init(r: UInt8, g: UInt8, b: UInt8, a: UInt8) {
         self.r = r
        self.g = g
        self.b = b
        self.a = a
        
    }
    
    @inlinable
    public init(rgba: Rgba) {
        self.r = gammaU8FromLinearF32(rgba.r)
        self.g = gammaU8FromLinearF32(rgba.g)
        self.b = gammaU8FromLinearF32(rgba.b)
        self.a = linearU8FromLinearF32(rgba.a)
    }
    
     @inlinable
    public init(hsva: Hsva) {
        self.init(rgba: Rgba(hsva: hsva))
    }
    
    @inlinable
    public init(hsvaGamma: HsvaGamma) {
        self.init(rgba: Rgba(hsvaGamma: hsvaGamma))
    }
    
    
}


public extension Color32 {
    static let transparent = Color32(0, 0, 0, 0)
    static let black = Color32(0, 0, 0, 255)
    static let darkGray = Color32(96, 96, 96, 255)
    static let gray = Color32(160, 160, 160, 255)
    static let lightGray = Color32(220, 220, 220, 255)
    static let white = Color32(255, 255, 255, 255)
    
    static let brown = Color32(165, 42, 42, 255)
    static let darkRed = Color32(139, 0, 0, 255)
    static let red = Color32(255, 0, 0, 255)
    static let lightRed = Color32(255, 128, 128, 255)
    
    static let yellow = Color32(255, 255, 0, 255)
    static let lightYellow = Color32(255, 255, 224, 255)
    static let khaki = Color32(240, 230, 140, 255)
    
    static let darkGreen = Color32(0, 100, 0, 255)
    static let green = Color32(0, 255, 0, 255)
    static let lightGreen = Color32(144, 238, 144, 255)
    
    static let darkBlue = Color32(0, 0, 139, 255)
    static let blue = Color32(0, 0, 255, 255)
    static let lightBlue = Color32(173, 216, 230, 255)
    
    static let gold = Color32(255, 215, 0, 255)
    
    static let debugColor = Color32(0, 200, 0, 128)
    
    /// An ugly color that is planned to be replaced before making it to the screen.
    ///
    /// This is an invalid color, in that it does not correspond to a valid multiplied color,
    /// nor to an additive color.
    ///
    /// This is used as a special color key,
    /// i.e. often taken to mean "no color".
    static let placeholder = Color32(64, 254, 0, 128)
    
    /// An ugly color that is planned to be replaced before making it to the screen.
    ///
    /// This is an invalid color, in that it does not correspond to a valid multiplied color,
    /// nor to an additive color.
    ///
    /// This is used as a special color key,
    /// i.e. often taken to mean "no color".
    static let temporaryColor = placeholder
}

//exte
public extension Color32 {
    
    @inlinable static func fromRgb(r: UInt8, g: UInt8, b: UInt8) -> Color32 {
        return Color32(r, g, b, 255)
    }
    
    @inlinable static func fromRbgAdditive(r: UInt8, g: UInt8, b: UInt8) -> Color32 {
        return Color32(r, g, b, 0)
    }
    
    @inlinable static func fromRgbaPremultiplied(r: UInt8, g: UInt8, b: UInt8, a: UInt8) -> Color32 {
        return Color32(r, g, b, a)
    }
    
    @inlinable func isOpaque() -> Bool {
        return a == 255
    }
    
    
    /// From `sRGBA` WITHOUT premultiplied alpha.
    @inlinable static func fromRgbaUnmultiplied(r: UInt8, g: UInt8, b: UInt8, a: UInt8) -> Self {
        if a == 255 {
            return Self.fromRgb(r: r, g: g, b: b) // common-case optimization
        } else if a == 0 {
            return Self.transparent // common-case optimization
        } else {
            let rLin = linearF32FromGammaU8(r)
            let gLin = linearF32FromGammaU8(g)
            let bLin = linearF32FromGammaU8(b)
            let aLin = linearF32FromLinearU8(a)
            
            let r = gammaU8FromLinearF32(rLin * aLin)
            let g = gammaU8FromLinearF32(gLin * aLin)
            let b = gammaU8FromLinearF32(bLin * aLin)
            
            return Self.fromRgbaPremultiplied(r: r, g: g, b: b, a: a)
        }
    }
    
    @inlinable static func fromGray(_ l: UInt8) -> Self {
        Self(l, l, l, 255)
    }
    
    @inlinable static func fromBlackAlpha(_ a: UInt8) -> Self {
        Self(0, 0, 0, a)
    }
    
    @inlinable static func fromWhiteAlpha(_ a: UInt8) -> Self {
        Self(rgba: Rgba.fromWhiteAlpha(a: linearF32FromLinearU8(a)))
    }
    
    @inlinable static func fromAdditiveLuminance(_ l: UInt8) -> Self {
        Self(l, l, l, 0)
    }
    
    
    @inlinable func toOpaque() -> Self {
        return Color32(rgba: Rgba(srgba: self).toOpaque() )
    }
    
    @inlinable
    var additive: Self {
        return Self(r, g, b, 0)
    }
    
    @inlinable func isAdditive() -> Bool {
        return self.a == 0
    }
    
    @inlinable func toArray() -> [UInt8] {
        return [self.r, self.g, self.b, self.a]
    }
    
    @inlinable func toTuple() -> (UInt8, UInt8, UInt8, UInt8) {
        return (self.r, self.g, self.b, self.a)
    }
    
    @inlinable func toSrgbaUnmultiplied() -> (r: UInt8, g: UInt8, b: UInt8, a: UInt8)  {
        Rgba(srgba: self).toSrgbaUnmultipiled()
    }
    
    @inlinable func gammaMultiply(factor: Float) -> Self {
        assert(0.0 <= factor && factor <= 1.0)
        let (r, g, b, a) = (self.r, self.g, self.b, self.a)
        return Self(
            UInt8(Float(r) * factor + 0.5),
            UInt8(Float(g) * factor + 0.5),
            UInt8(Float(b) * factor + 0.5),
            UInt8(Float(a) * factor + 0.5)
        )
    }
    
    @inlinable func linearMultiply(factor: Float) -> Self {
        assert(0.0 <= factor && factor <= 1.0)
        return Self(rgba: factor * Rgba(srgba: self) )
    }
    
    @inlinable func toNormalizedGammaF32() -> (r: Float32, g: Float32, b: Float32, a: Float32) {
        return (
            Float32(r) / 255.0,
            Float32(g) / 255.0,
            Float32(b) / 255.0,
            Float32(a) / 255.0
        )
    }
    
}
