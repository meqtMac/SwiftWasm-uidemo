////
////  Range.swift
////
////
////  Created by 蒋艺 on 2024/4/2.
////
//
//import Foundation

public extension ClosedRange where ClosedRange.Bound == Float32 {
    var min: Float32 {
        self.lowerBound
    }
    var max: Float32 {
        self.upperBound
    }
    
    func span() -> Float32 {
        self.upperBound - self.lowerBound
    }
    
    func center() -> Float32 {
        0.5 * (max + min)
    }
    
//    func contains(_ x: Float32) -> Bool {
//        self.c
//    }
}
//
///// Inclusive range of floats, i.e. `min..=max`, but more ergonomic than `ClosedRange<Float>`.
//public struct Rangef {
//    public var min: Float
//    public var max: Float
//    
//    public init(min: Float, max: Float) {
//        self.min = min
//        self.max = max
//    }
//    
//    public static let EVERYTHING = Rangef(min: -.infinity, max: .infinity)
//    public static let NOTHING = Rangef(min: .infinity, max: -.infinity)
//    public static let NAN = Rangef(min: .nan, max: .nan)
//    
//    public func span() -> Float {
//        max - min
//    }
//    
//    public func center() -> Float {
//        0.5 * (min + max)
//    }
//    
//    public func contains(_ x: Float) -> Bool {
//        min <= x && x <= max
//    }
//    
//    // FIXME: platform dependent implt
////    public func clamp(_ x: Float) -> Float {
////        x.clamped(to: min...max)
////    }
////    
////    public func asPositive() -> Rangef {
////        Rangef(min: min.clamped(to: .zero...), max: max.clamped(to: .zero...))
////    }
//    
//    public func shrink(by amnt: Float) -> Rangef {
//        Rangef(min: min + amnt, max: max - amnt)
//    }
//    
//    public func expand(by amnt: Float) -> Rangef {
//        Rangef(min: min - amnt, max: max + amnt)
//    }
//    
//    public func flip() -> Rangef {
//        Rangef(min: max, max: min)
//    }
//    
//    public func intersection(with other: Rangef) -> Rangef {
//        Rangef(min: Swift.max(min, other.min), max: Swift.min(max, other.max))
//    }
//    
//    public func intersects(_ other: Rangef) -> Bool {
//        other.min <= max && min <= other.max
//    }
//}
//
//public extension Rangef {
//    init(_ minAndMax: Float) {
//        self.init(min: minAndMax, max: minAndMax)
//    }
//}
//
//extension Rangef: Equatable {}
//
//extension Rangef: CustomDebugStringConvertible {
//    public var debugDescription: String {
//        "Rangef(min: \(min), max: \(max))"
//    }
//}
//
//public extension Rangef {
//    init(_ range: ClosedRange<Float>) {
//        self.init(min: range.lowerBound, max: range.upperBound)
//    }
//    
//    init(_ range: Range<Float>) {
//        self.init(min: range.lowerBound, max: .infinity)
//    }
//}
