// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport


//let packageName =  "swiftwasm-uidemo"
let package = Package(
    name: "DRUI",
    products: [
        .library(
            name: "DRUI",
            targets: ["DRUI"]
        ),
    ],
    dependencies: [
       // WASI not support macro yet
        // Depend on the Swift 5.9 release of SwiftSyntax
//        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.35.8"),
    ],
    targets: [
       .target(
            name: "DRUI",
            dependencies: [
                "RefCount",
                "DRColor",
                "DRMath",
                "DRPaint"
            ]
        ),
        .target(
            name: "DRPaint",
            dependencies: [
                "DRColor",
                "DRMath"
            ]
        ),
        .target(
            name: "DRColor",
            dependencies: [
                // "RustHelper",
                // WASI not support macro yet
                //"DRColorMacroImpl"
            ]
        ),
        .target(
            name: "DRMath",
            dependencies: [
                "_NumericsShims"
            ]
        ),
       // MARK: - Implementation details
           .target(name: "_NumericsShims"),
       
        .target(name: "RefCount"),
        // .target(name: "RustHelper"),
        .testTarget(
            name: "DRColorTest",
            dependencies: [
                "DRColor"
            ]
        ),
        // WASI not support macro yet
        //"DRColorMacroImpl"
        //        .macro(
        //            name: "DRColorMacroImpl",
        //            dependencies: [
        //                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
        //                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
        //            ]
        //        ),
        // A test target used to develop the macro implementation.
        //        .testTarget(
        //            name: "DRColorMacroTests",
        //            dependencies: [
        //                "DRColorMacroImpl",
        //                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
        //            ]
        //        ),
   ]
)
