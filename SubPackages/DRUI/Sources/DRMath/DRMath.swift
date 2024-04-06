//
//  DRMath.swift
//
//
//  Created by 蒋艺 on 2024/4/2.
//

import Foundation

/// Linear interpolation.
///
/// ```
/// # use emath::lerp;
/// assert_eq!(lerp(1.0..=5.0, 0.0), 1.0);
/// assert_eq!(lerp(1.0..=5.0, 0.5), 3.0);
/// assert_eq!(lerp(1.0..=5.0, 1.0), 5.0);
/// assert_eq!(lerp(1.0..=5.0, 2.0), 9.0);
/// ```
@inlinable
public func lerp<T>(_ range: ClosedRange<T>, _ t: T) -> T
where T: FloatingPoint & ExpressibleByIntegerLiteral {
    let start = range.lowerBound
    let end = range.upperBound
    return (T(1) - t) * start + t * end
}

/// Where in the range is this value? Returns 0-1 if within the range.
///
/// Returns <0 if before and >1 if after.
///
/// Returns `nil` if the input range is zero-width.
///
/// ```
/// # use emath::inverse_lerp;
/// assert_eq!(inverse_lerp(1.0..=5.0, 1.0), Some(0.0));
/// assert_eq!(inverse_lerp(1.0..=5.0, 3.0), Some(0.5));
/// assert_eq!(inverse_lerp(1.0..=5.0, 5.0), Some(1.0));
/// assert_eq!(inverse_lerp(1.0..=5.0, 9.0), Some(2.0));
/// assert_eq!(inverse_lerp(1.0..=1.0, 3.0), nil);
/// ```
@inlinable
public func inverseLerp<R>(_ range: ClosedRange<R>, _ value: R) -> R?
where R: FloatingPoint & ExpressibleByIntegerLiteral {
    let min = range.lowerBound
    let max = range.upperBound
    guard min != max else { return nil }
    return (value - min) / (max - min)
}

/// Linearly remap a value from one range to another,
/// so that when `x == from.start()` returns `to.start()`
/// and when `x == from.end()` returns `to.end()`.
@inlinable
public func remap<T>(_ x: T, _ from: ClosedRange<T>, _ to: ClosedRange<T>) -> T
where T: FloatingPoint & ExpressibleByIntegerLiteral {
    assert(from.lowerBound != from.upperBound, "Input range cannot be zero-width")
    let t = (x - from.lowerBound) / (from.upperBound - from.lowerBound)
    return lerp(to, t)
}

/// Like `remap`, but also clamps the value so that the returned value is always in the `to` range.
@inlinable
public func remapClamp<T>(_ x: T, _ from: ClosedRange<T>, _ to: ClosedRange<T>) -> T
where T: FloatingPoint & ExpressibleByIntegerLiteral {
    if from.upperBound < from.lowerBound {
        return remapClamp(x, from.upperBound...from.lowerBound, to.upperBound...to.lowerBound)
    }
    if x <= from.lowerBound {
        return to.lowerBound
    } else if from.upperBound <= x {
        return to.upperBound
    } else {
        assert(from.lowerBound != from.upperBound, "Input range cannot be zero-width")
        let t = (x - from.lowerBound) / (from.upperBound - from.lowerBound)
        if 1 <= t {
            return to.upperBound
        } else {
            return lerp(to, t)
        }
    }
}

/// Round a value to the given number of decimal places.
public func roundToDecimals(_ value: Float32, _ decimalPlaces: Int) -> Float32 {
    return Float32(String(format: "%.\(decimalPlaces)f", value)) ?? value
}

public func formatWithMinimumDecimals(_ value: Float32, _ decimals: Int) -> String {
    return formatWithDecimalsInRange(value, decimals...6)
}

public func formatWithDecimalsInRange(_ value: Float32, _ decimalRange: ClosedRange<Int>) -> String {
    let minDecimals = decimalRange.lowerBound
    let maxDecimals = decimalRange.upperBound
    assert(minDecimals <= maxDecimals, "Minimum decimals must be less than or equal to maximum decimals")
    assert(maxDecimals < 100, "Maximum decimals must be less than 100")
    let maxDecimalsClamped = min(maxDecimals, 16)
    let minDecimalsClamped = min(minDecimals, maxDecimalsClamped)
    
    if minDecimalsClamped != maxDecimalsClamped {
        for decimals in minDecimalsClamped..<maxDecimalsClamped {
            let text = String(format: "%.\(decimals)f", value)
            let epsilon: Float = 16.0 * .ulpOfOne // margin large enough to handle most people's round-tripping needs
            if almostEqual(Float(text)!, Float(value), epsilon: epsilon) {
                return text
            }
        }
    }
    return String(format: "%.\(maxDecimalsClamped)f", value)
}

/// Return true when arguments are the same within some rounding error.
///
/// For instance `almostEqual(x, x.degreesToRadians(), .ulpOfOne)` should hold true for all x.
/// The `epsilon`  can be `.ulpOfOne` to handle simple transforms (like degrees -> radians)
/// but should be higher to handle more complex transformations.
@inlinable
public func almostEqual(_ a: Float32, _ b: Float32, epsilon: Float32) -> Bool {
    if a == b {
        return true // handle infinites
    } else {
        let absMax = max(abs(a), abs(b))
        return absMax <= epsilon || abs(a - b) / absMax <= epsilon
    }
}

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
public extension FloatingPoint {
    
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
    
    @inlinable
    func cbrt() -> Self {
        return 
    }


    
}

/// Calculate a lerp-factor for exponential smoothing using a time step.
///
/// - Parameters:
///   - reachThisFraction: The fraction to reach.
///   - inThisManySeconds: The time duration in seconds.
///   - dt: The time step.
/// - Returns: The lerp-factor.
public func exponentialSmoothFactor(reachThisFraction: Float, inThisManySeconds: Float, dt: Float) -> Float {
    return 1.0 - pow(1.0 - reachThisFraction, dt / inThisManySeconds)
}

/// If you have a value animating over time,
/// how much towards its target do you need to move it this frame?
///
/// You only need to store the start time and target value in order to animate using this function.
///
/// - Parameters:
///   - startTime: The start time of the animation.
///   - endTime: The end time of the animation.
///   - currentTime: The current time.
///   - dt: The time step.
///   - easing: The easing function.
/// - Returns: The interpolation factor.
public func interpolationFactor(startTime: Double, endTime: Double, currentTime: Double, dt: Float, easing: (Float) -> Float) -> Float {
    let animationDuration = Float(endTime - startTime)
    let prevTime = currentTime - Double(dt)
    let prevT = easing(Float(prevTime - startTime) / animationDuration)
    let endT = easing(Float(currentTime - startTime) / animationDuration)
    if endT < 1.0 {
        return (endT - prevT) / (1.0 - prevT)
    } else {
        return 1.0
    }
}

/// Ease in, ease out.
///
/// `f(0) = 0, f'(0) = 0, f(1) = 1, f'(1) = 0`.
@inline(__always)
public func easeInEaseOut(t: Float32) -> Float32 {
    let t = t.min(1.0).max(0.0)
    let t2 = 3 * t * t
    let t3 = 2 * t * t * t
    return (t2 - t3).clamped(min: 0.0, max: 1.0)
}
