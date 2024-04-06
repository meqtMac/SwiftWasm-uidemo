//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/4/6.
//

import _NumericsShims

public extension FloatingPoint {
    /// Restrict a value to a certain interval unless it is NaN.
    ///
    /// Returns `max` if `self` is greater than `max`, and `min` if `self` is
    /// less than `min`. Otherwise this returns `self`.
    ///
    /// Note that this function returns NaN if the initial value was NaN as
    /// well.
    ///
    /// # Panics
    ///
    /// Panics if `min > max`, `min` is NaN, or `max` is NaN.
    ///
    /// # Examples
    ///
    /// ```
    /// assert!((-3.0f32).clamp(-2.0, 1.0) == -2.0);
    /// assert!((0.0f32).clamp(-2.0, 1.0) == 0.0);
    /// assert!((2.0f32).clamp(-2.0, 1.0) == 1.0);
    /// assert!((f32::NAN).clamp(-2.0, 1.0).is_nan());
    /// ```
    @inlinable
    func clamped(min: Self, max: Self) -> Self {
        assert(min <= max, "min > max, or either was NaN. min = {min:?}, max = {max:?}");
        var new = self
        if self < min {
            new = min
        } else if self > max {
            new = max
        }
        return new
    }
    
    @inlinable
    mutating func clamp(min: Self, max: Self) {
        assert(min <= max, "min > max, or either was NaN. min = {min:?}, max = {max:?}");
        if self < min {
            self = min
        } else if self > max {
            self = max
        }
    }
    
    @inlinable
    func max(_ other: Self) -> Self {
        return Swift.max(self, other)
    }
    
    @inlinable
    func min(_ other: Self) -> Self {
        return Swift.min(self, other)
    }
    
    
}

//    @inlinable
//    func cbrt() -> Self {
//        return Foundation.cbrt(self)
//    }
//
//
//
public protocol DRFloatMath {
    func max(_ other: Self) -> Self
    
    func min(_ other: Self) -> Self
    
    func sqrt() -> Self
    
    func floor() -> Self
    
    func ceil() -> Self
    
    func abs() -> Self
    
    func pow(_ n: Self) -> Self
    
    func exp() -> Self
    
    func exp2() -> Self
    
    //    func log(base: Self) -> Self
    
    func log() -> Self
    
    func log2() -> Self
    
    func log10() -> Self
    
    func cbrt() -> Self
    
    func hypot(_ other: Self) -> Self
    
    func sin() -> Self
    
    func cos() -> Self
    
    func tan() -> Self
    
    func asin() -> Self
    
    func acos() -> Self
    
    func atan() -> Self
    
    func atan2(_ y: Self) -> Self
    
    func sinh() -> Self
    
    func cosh() -> Self
    
    func tanh() -> Self
    
    func asinh() -> Self
    
    func acosh() -> Self
    
    func atanh() -> Self
}

extension Float32: DRFloatMath {
    @inline(__always)
    public func sqrt() -> Self {
        self.squareRoot()
    }
    
    @inline(__always)
    public func floor() -> Self {
        self.rounded(.down)
    }
    
    @inline(__always)
    public func ceil() -> Self {
        self.rounded(.up)
    }
    
    @inline(__always)
    public func abs() -> Self {
        Swift.abs(self)
    }
    
    @inline(__always)
    public func pow(_ n: Self) -> Self {
        libm_powf(self, n)
    }
    
    @inline(__always)
    public func exp() -> Self {
        libm_expf(self)
    }
    
    @inline(__always)
    public func exp2() -> Self {
        libm_exp2f(self)
    }
    
    @inline(__always)
    public func log() -> Self {
        libm_logf(self)
    }
    
    @inline(__always)
    public func log2() -> Self {
        libm_log2f(self)
    }
    
    @inline(__always)
    public func log10() -> Self {
        libm_log10f(self)
    }
    
    @inline(__always)
    public func cbrt() -> Self {
        libm_cbrtf(self)
    }
    
    @inline(__always)
    public func hypot(_ other: Self) -> Self {
        libm_hypotf(self, other)
    }
    
    @inline(__always)
    public func sin() -> Self {
        libm_sinf(self)
    }
    
    @inline(__always)
    public func cos() -> Self {
        libm_cosf(self)
    }
    
    
     @inline(__always)
    public func tan() -> Self {
        libm_tanf(self)
    }
    
     @inline(__always)
    public func asin() -> Self {
        libm_asinf(self)
    }
    
     @inline(__always)
    public func acos() -> Self {
        libm_acosf(self)
    }
    
     @inline(__always)
    public func atan() -> Self {
        libm_atanf(self)
    }
    
     @inline(__always)
    public func atan2(_ y: Self) -> Self {
        libm_atan2f(y, self)
    }
    
     @inline(__always)
    public func sinh() -> Self {
        libm_sinhf(self)
    }
    
     @inline(__always)
    public func cosh() -> Self {
        libm_coshf(self)
    }
    
     @inline(__always)
    public func tanh() -> Self {
        libm_tanf(self)
    }
    
     @inline(__always)
    public func asinh() -> Self {
        libm_asinhf(self)
    }
    
     @inline(__always)
    public func acosh() -> Self {
        libm_acoshf(self)
    }
    
     @inline(__always)
    public func atanh() -> Self {
        libm_atanhf(self)
    }
}

extension Float64: DRFloatMath {
    @inline(__always)
    public func sqrt() -> Self {
        self.squareRoot()
    }
    
    @inline(__always)
    public func floor() -> Self {
        self.rounded(.down)
    }
    
    @inline(__always)
    public func ceil() -> Self {
        self.rounded(.up)
    }
    
    @inline(__always)
    public func abs() -> Self {
        Swift.abs(self)
    }
    
    @inline(__always)
    public func pow(_ n: Self) -> Self {
        libm_pow(self, n)
    }
    
    @inline(__always)
    public func exp() -> Self {
        libm_exp(self)
    }
    
    @inline(__always)
    public func exp2() -> Self {
        libm_exp2(self)
    }
    
    @inline(__always)
    public func log() -> Self {
        libm_log(self)
    }
    
    @inline(__always)
    public func log2() -> Self {
        libm_log2(self)
    }
    
    @inline(__always)
    public func log10() -> Self {
        libm_log10(self)
    }
    
    @inline(__always)
    public func cbrt() -> Self {
        libm_cbrt(self)
    }
    
    @inline(__always)
    public func hypot(_ other: Self) -> Self {
        libm_hypot(self, other)
    }
    
    @inline(__always)
    public func sin() -> Self {
        libm_sin(self)
    }
    
    @inline(__always)
    public func cos() -> Self {
        libm_cos(self)
    }
    
    
     @inline(__always)
    public func tan() -> Self {
        libm_tan(self)
    }
    
     @inline(__always)
    public func asin() -> Self {
        libm_asin(self)
    }
    
     @inline(__always)
    public func acos() -> Self {
        libm_acos(self)
    }
    
     @inline(__always)
    public func atan() -> Self {
        libm_atan(self)
    }
    
     @inline(__always)
    public func atan2(_ other: Self) -> Self {
        libm_atan2(other, self)
    }
    
     @inline(__always)
    public func sinh() -> Self {
        libm_sinh(self)
    }
    
     @inline(__always)
    public func cosh() -> Self {
        libm_cosh(self)
    }
    
     @inline(__always)
    public func tanh() -> Self {
        libm_tan(self)
    }
    
     @inline(__always)
    public func asinh() -> Self {
        libm_asinh(self)
    }
    
     @inline(__always)
    public func acosh() -> Self {
        libm_acosh(self)
    }
    
     @inline(__always)
    public func atanh() -> Self {
        libm_atanh(self)
    }
}
