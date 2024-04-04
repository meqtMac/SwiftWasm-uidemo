//
//  File.swift
//
//
//  Created by 蒋艺 on 2024/4/2.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

enum MacroError: Error {
    case notFoundHex
    case failedToParseHex
}

func hexStringToRGB(_ hex: String) -> (r: UInt8, g: UInt8, b: UInt8, a: UInt8)? {
    var hexFormatted = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
    // Remove the '#' prefix if exists
    if hexFormatted.hasPrefix("#") {
        hexFormatted = String(hexFormatted.dropFirst())
    }
    
    var rgbValue: UInt64 = 0
    guard Scanner(string: hexFormatted).scanHexInt64(&rgbValue) else {
        return nil
    }
    
    var r, g, b, a: UInt8
    if hexFormatted.count == 6 {
        r = UInt8((rgbValue & 0xFF0000) >> 16)
        g = UInt8((rgbValue & 0x00FF00) >> 8)
        b = UInt8(rgbValue & 0x0000FF)
        a = 255 // Fully opaque by default
    } else if hexFormatted.count == 8 {
        r = UInt8((rgbValue & 0xFF000000) >> 24)
        g = UInt8((rgbValue & 0x00FF0000) >> 16)
        b = UInt8((rgbValue & 0x0000FF00) >> 8)
        a = UInt8(rgbValue & 0x000000FF)
    } else {
        // Invalid hex string length
        return nil
    }
    
    return (r, g, b, a)
}

func hexString(from stringLiteral: StringLiteralExprSyntax) -> String {
    guard case .stringSegment(let segment) = stringLiteral.segments.first else {
        fatalError("macro signature is wrong")
    }
    
    // easier way, no safety.
    let hexString = segment.content.text
    return hexString
}

public struct HexToColorMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        
        var args = node.argumentList.makeIterator()
        guard let arg_hex = args.next()?.expression else {
            context.addDiagnostics(from: MacroError.notFoundHex, node: node)
            return ""
        }
        
        guard let stringLiteral = arg_hex.as(StringLiteralExprSyntax.self) else {
            context.addDiagnostics(from: MacroError.notFoundHex, node: node)
            return ""
        }
        
        let hexString = hexString(from: stringLiteral)
        guard let (r, g, b, a) = hexStringToRGB(hexString) else {
            context.addDiagnostics(from: MacroError.failedToParseHex, node: node)
            return ""
        }
        
        return """
    Color32(r: \(raw: r), g: \(raw: g), b: \(raw: b), a: \(raw: a))
    """
    }
}


@main
struct DRColorMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        HexToColorMacro.self,
    ]
}
