// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport


let package = Package(
    name: "UIDemo",
    platforms: [
        .macOS(.v13),
        .iOS(.v15),
    ],
    products: [
        .executable(
            name: "DRUIDemo",
            targets: ["DRUIDemo"]
        ),
   ],
    dependencies: [
        //        .package(
        //            url: "https://github.com/swiftwasm/JavaScriptKit.git",
        //            from: "0.18.0"
        //        ),
        .package(
            url: "https://github.com/OpenCombine/OpenCombine.git",
            from: "0.14.0"
        ),
        .package(
            url: "https://github.com/swiftwasm/OpenCombineJS.git",
            from: "0.2.0"
        ),
        .package(
            url: "https://github.com/swiftwasm/carton",
            from: "1.0.0"
        ),
        // local web api kit dependency
        .package(
            name: "WebAPIKit",
            path: "SubPackages/WebAPIKit"
        ),
        .package(
            name: "DRUI",
            path: "SubPackages/DRUI"
        ),
        // WASI not support macro yet
        // Depend on the Swift 5.9 release of SwiftSyntax
        //        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
        //            .packageu
    ],
    targets: [
        .executableTarget(
            name: "DRUIDemo",
            dependencies: [
//                .product(name: "DRUI", package: "DRUI"),
                "DRFrame",
                .product(
                    name: "OpenCombineShim",
                    package: "OpenCombine"
                ),
            ]
        ),
        .target(
            name: "DRGlow",
            dependencies: [
                .product(name: "DRUI", package: "DRUI")
            ]
        ),
        .target(
            name: "DRFrame",
            dependencies: [
                .product(name: "DOM", package: "WebAPIKit"),
                .product(name: "WebGL2", package: "WebAPIKit"),
                .product(name: "DRUI", package: "DRUI")
            ]
        ),
    ]
)
