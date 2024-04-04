//
//  SmartAim.swift
//
//
//  Created by 蒋艺 on 2024/4/2.
//

// MARK: Checked

import Foundation

let NUM_DECIMALS: Int = 15

/// Find the "simplest" number in a closed range [min, max], i.e. the one with the fewest decimal digits.
///
/// So in the range `[0.83, 1.354]` you will get `1.0`, and for `[0.37, 0.48]` you will get `0.4`.
/// This is used when dragging sliders etc to get the values that users are most likely to desire.
/// This assumes a decimal centric user.
public func bestInRange(min: Double, max: Double) -> Double {
    // Avoid NaN if we can:
    if min.isNaN {
        return max
    }
    if max.isNaN {
        return min
    }
    
    if max < min {
        return bestInRange(min: max, max: min)
    }
    if min == max {
        return min
    }
    if min <= 0.0 && 0.0 <= max {
        return 0.0 // always prefer zero
    }
    if min < 0.0 {
        return -bestInRange(min: -max, max: -min)
    }
    
    // Prefer finite numbers:
    if !max.isFinite {
        return min
    }
    
    let minExponent = log10(min)
    let maxExponent = log10(max)
    
    if minExponent.rounded(.down) != maxExponent.rounded(.down) {
        // pick the geometric center of the two:
        let exponent = (minExponent + maxExponent) / 2.0
        return pow(10.0, exponent.rounded() as Double)
    }
    
    if minExponent.rounded() == minExponent {
        return pow(10.0, minExponent)
    }
    if maxExponent.rounded() == maxExponent {
        return pow(10.0, maxExponent)
    }
    
    let expFactor = pow(10.0, maxExponent.rounded(.down))
    
    let minStr = toDecimalString(v: min / expFactor)
    let maxStr = toDecimalString(v: max / expFactor)
    
    var retStr = Array(repeating: 0, count: NUM_DECIMALS)
    
    // Select the common prefix:
    var i = 0
    while i < NUM_DECIMALS && maxStr[i] == minStr[i] {
        retStr[i] = maxStr[i]
        i += 1
    }
    
    if i < NUM_DECIMALS {
        // Pick the deciding digit.
        // Note that "toDecimalString" rounds down, so we that's why we add 1 here
        retStr[i] = simplestDigitClosedRange(min: minStr[i] + 1, max: maxStr[i])
    }
    
    return fromDecimalString(s: retStr) * expFactor
}

//static func isInteger(_ f: Double) -> Bool {
//    return f.rounded() == f
//}

fileprivate func toDecimalString(v: Float64) -> [Int] {
    assert(v < 10.0)
    var digits = Array(repeating: 0, count: NUM_DECIMALS)
    var v = abs(v)
    for r in digits.indices {
        let digit = v.rounded(.down)
        digits[r] = Int(digit)
        v -= digit
        v *= 10.0
    }
    return digits
}

fileprivate func fromDecimalString(s: [Int]) -> Float64 {
    var ret: Float64 = 0.0
    for (i, digit) in s.enumerated() {
        ret += Float64(digit) * pow(10.0, -Double((i)))
    }
    return ret
}

/// Find the simplest integer in the range [min, max]
fileprivate func simplestDigitClosedRange(min: Int, max: Int) -> Int {
    assert(1 <= min && min <= max && max <= 9)
    if min <= 5 && 5 <= max {
        return 5
    } else {
        return (min + max) / 2
    }
}

