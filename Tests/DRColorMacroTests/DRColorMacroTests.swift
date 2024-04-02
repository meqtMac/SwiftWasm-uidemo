//
//  DRColorMacroTests.swift
//
//
//  Created by 蒋艺 on 2024/4/2.
//
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport

import XCTest
import DRColorMacroImpl

let testMacros: [String: Macro.Type] = [
    "hexColor": HexToColorMacro.self,
]

final class DRColorMacroTests: XCTestCase {
    
   func testMacroWhite() throws {
        assertMacroExpansion(
          """
          #hexColor("#FFFFFF")
          """,
          expandedSource: """
            Color32(r: 255, g: 255, b: 255, a: 255)
            """,
          macros: testMacros
        )
    }
    
    func testMacroAlpha() throws {
        assertMacroExpansion(
          """
          #hexColor("#FFFFFF00")
          """,
          expandedSource: """
            Color32(r: 255, g: 255, b: 255, a: 0)
            """,
          macros: testMacros
        )
    }
    
    func testMacroNoPrefix() throws {
        assertMacroExpansion(
          """
          #hexColor("FFFFFF00")
          """,
          expandedSource: """
            Color32(r: 255, g: 255, b: 255, a: 0)
            """,
          macros: testMacros
        )
    }
    
    func testMacroRed() throws {
        assertMacroExpansion(
          """
          #hexColor("FF0000")
          """,
          expandedSource: """
            Color32(r: 255, g: 0, b: 0, a: 255)
            """,
          macros: testMacros
        )
    }
    
    
}
