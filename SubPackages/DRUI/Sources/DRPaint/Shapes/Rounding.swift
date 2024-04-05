//
//  Rounding.swift
//
//
//  Created by 蒋艺 on 2024/4/4.
//

// MARK: - Checked

/// How rounded the corners of things should be
public struct Rounding: Equatable {
    /// Radius of the rounding of the North-West (left top) corner.
    public var nw: Float32

    /// Radius of the rounding of the North-East (right top) corner.
    public var ne: Float32

    /// Radius of the rounding of the South-West (left bottom) corner.
    public var sw: Float32

    /// Radius of the rounding of the South-East (right bottom) corner.
    public var se: Float32
    
    public init(nw: Float32, ne: Float32, sw: Float32, se: Float32) {
        self.nw = nw
        self.ne = ne
        self.sw = sw
        self.se = se
    }
}



public extension Rounding {
    static let zero = Rounding(nw: 0.0, ne: 0.0, sw: 0.0, se: 0.0)

    static func same(radius: Float) -> Rounding {
        return Rounding(nw: radius, ne: radius, sw: radius, se: radius)
    }

    func isSame() -> Bool {
        return nw == ne && nw == sw && nw == se
    }

    func atLeast(min: Float) -> Rounding {
        return Rounding(nw: max(nw, min), ne: max(ne, min), sw: max(sw, min), se: max(se, min))
    }

    func atMost(max: Float) -> Rounding {
        return Rounding(nw: min(nw, max), ne: min(ne, max), sw: min(sw, max), se: min(se, max))
    }
}

public extension Rounding {
    static func += (lhs: inout Rounding, rhs: Rounding) {
        lhs.nw += rhs.nw
        lhs.ne += rhs.ne
        lhs.sw += rhs.sw
        lhs.se += rhs.se
    }
     static func += (lhs: inout Rounding, rhs: Float32) {
        lhs.nw += rhs
        lhs.ne += rhs
        lhs.sw += rhs
        lhs.se += rhs
    }
    

    static func -= (lhs: inout Rounding, rhs: Rounding) {
        lhs.nw -= rhs.nw
        lhs.ne -= rhs.ne
        lhs.sw -= rhs.sw
        lhs.se -= rhs.se
    }
    
    static func -= (lhs: inout Rounding, rhs: Float32) {
        lhs.nw -= rhs
        lhs.ne -= rhs
        lhs.sw -= rhs
        lhs.se -= rhs
    }


    static func + (lhs: Rounding, rhs: Rounding) -> Rounding {
        return Rounding(nw: lhs.nw + rhs.nw, ne: lhs.ne + rhs.ne, sw: lhs.sw + rhs.sw, se: lhs.se + rhs.se)
    }

    static func - (lhs: Rounding, rhs: Rounding) -> Rounding {
        return Rounding(nw: lhs.nw - rhs.nw, ne: lhs.ne - rhs.ne, sw: lhs.sw - rhs.sw, se: lhs.se - rhs.se)
    }

    static func * (lhs: Rounding, rhs: Float) -> Rounding {
        return Rounding(nw: lhs.nw * rhs, ne: lhs.ne * rhs, sw: lhs.sw * rhs, se: lhs.se * rhs)
    }

    static func / (lhs: Rounding, rhs: Float) -> Rounding {
        return Rounding(nw: lhs.nw / rhs, ne: lhs.ne / rhs, sw: lhs.sw / rhs, se: lhs.se / rhs)
    }
    
        
    static func /= (lhs: inout Rounding, rhs: Float32) {
        lhs.nw /= rhs
        lhs.ne /= rhs
        lhs.sw /= rhs
        lhs.se /= rhs
    }

    static func *= (lhs: inout Rounding, rhs: Float32) {
        lhs.nw *= rhs
        lhs.ne *= rhs
        lhs.sw *= rhs
        lhs.se *= rhs
    }


}
