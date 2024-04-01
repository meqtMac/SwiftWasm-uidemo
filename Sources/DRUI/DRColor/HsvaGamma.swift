//
//  HsvaGamma.swift
//
//
//  Created by 蒋艺 on 2024/4/1.
//

/// Like Hsva but with the `v` value (brightness) being gamma corrected
/// so that it is somewhat perceptually even.
public struct HsvaGamma {
    /// hue 0-1
    public var h: Float32
    
    /// saturation 0-1
    public var s: Float32
    
    /// volue 0-1, in gamma-space (~preceptually even)
    public var v: Float32
    
    /// alpha 0-1. A negative value signifies an additive color (and alpha is ignored).
    public var a: Float32
    
    @inlinable
    public init(h: Float32, s: Float32, v: Float32, a: Float32) {
        self.h = h
        self.s = s
        self.v = v
        self.a = a
    }
    
    @inlinable
    public init(hsva: Hsva) {
        self.h = hsva.h
        self.s = hsva.s
        self.v = gammaFromLinear(linear: hsva.v)
        self.a = hsva.a
    }
    
    @inlinable
    public init(rgba: Rgba) {
        self = HsvaGamma(hsva: Hsva(rgba: rgba))
    }
    
    @inlinable
    public init(srgba: Color32) {
         self = HsvaGamma(hsva: Hsva(srgba: srgba))
    }

}

public extension HsvaGamma {
//    init(rgba: Rgba) {
//        
//    }
    
//    init(rgba: Rgba) {
//        
//    }
}
