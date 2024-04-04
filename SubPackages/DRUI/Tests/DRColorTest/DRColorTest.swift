//
//  DRColorTest.swift
//
//
//  Created by 蒋艺 on 2024/4/2.
//

import XCTest
import DRColor

final class DRColorTest: XCTestCase {
    
    func testHsvRoundtrip() {
        for r in UInt8(0)...255 {
            for g in UInt8(0)...255 {
                for b in UInt8(0)...255 {
                    let srgba = Color32(r: r, g: g, b: b, a: 255)
                    let hsva = Hsva(srgba: srgba)
                    XCTAssertEqual(srgba, Color32(hsva: hsva))
                }
            }
        }
    }
    
    func testSrgbaConversion() {
        for b in UInt8(0)...255 {
            let l = linearF32FromGammaU8(b)
            XCTAssertTrue(0 <= l && l <= 1)
            XCTAssertEqual(gammaU8FromLinearF32(l), b)
        }
    }
    
}
