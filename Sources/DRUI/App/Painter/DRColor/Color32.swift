//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/3/26.
//

import Foundation

@frozen
public struct Color32 {
    public let r: UInt8
    public let g: UInt8
    public let b: UInt8
    public let a: UInt8
}

public extension Color32 {
    static let black: Self = .init(r: 0, g: 0, b: 0, a: 255)
    static let red: Self = .init(r: 255, g: 0, b: 0, a: 255)
    static let green: Self = .init(r: 0, g: 255, b: 0, a: 255)
    static let blue: Self = .init(r: 0, g: 0, b: 255, a: 255)
    static let yellow: Self = .init(r: 0, g: 255, b: 255, a: 255)
    static let maganta: Self = .init(r: 255, g: 0, b: 255, a: 255)
    static let white: Self = .init(r: 255, g: 255, b: 255, a: 255)
    static let orange: Self = .init(r: 255, g: 255, b: 0, a: 255)
//    init(
    static func rgba(_ r: UInt8, _ g: UInt8, _ b: UInt8, _ a: UInt8) -> Self {
        Color32(r: r, g: g, b: b, a: a)
    }
}

