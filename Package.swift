// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swiftwasm-uidemo",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .executable(
            name: "DRUIDemo",
            targets: ["DRUIDemo"]
        ),
        .library(
            name: "DRUI",
            targets: ["DRUI"]
        ),
        .library(
            name: "WebAPIBase",
            targets: ["WebAPIBase"]
        ),
        .library(
            name: "DOM",
            targets: ["DOM"]
        ),
        .library(
            name: "WebSockets",
            targets: ["WebSockets"]
        ),
        .library(
            name: "WebAnimations",
            targets: ["WebAnimations"]
        ),
        .library(
            name: "WebGL1",
            targets: ["WebGL1"]
        ),
        .library(
            name: "WebGL2",
            targets: ["WebGL2"]
        ),
        .library(
            name: "WebGPU",
            targets: ["WebGPU"]
        ),
        .library(
            name: "Gamepad",
            targets: ["Gamepad"]
        ),
        .library(
            name: "CSSOM",
            targets: ["CSSOM"]
        ),
        .library(
            name: "SVG",
            targets: ["SVG"]
        ),
        .library(
            name: "FileSystem",
            targets: ["FileSystem"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swiftwasm/JavaScriptKit.git",
            from: "0.18.0"
        ),
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
    ],
    targets: [
        .executableTarget(
            name: "DRUIDemo",
            dependencies: [
                "DOM", 
                "DRUI",
                .product(
                    name: "OpenCombineShim",
                    package: "OpenCombine"
                ),
            ]
        ),
        .target(
            name: "DRUI",
            dependencies: ["DOM", "WebAPIBase", "JavaScriptKit"]
        ),
        .target(
            name: "WebAPIBase",
            dependencies: ["ECMAScript"]
        ),
        .target(
            name: "DOM",
            dependencies: ["WebAPIBase", "ECMAScript"]
        ),
        .target(
            name: "WebSockets",
            dependencies: ["DOM", "WebAPIBase", "ECMAScript"]
        ),
        .target(
            name: "WebAnimations",
            dependencies: ["DOM", "WebAPIBase", "ECMAScript"]
        ),
        .target(
            name: "WebGL1",
            dependencies: ["DOM", "WebAPIBase", "WebAnimations", "ECMAScript"]
        ),
        .target(
            name: "WebGL2",
            dependencies: ["DOM", "WebAPIBase", "WebAnimations", "WebGL1", "ECMAScript"]
        ),
        .target(
            name: "WebGPU",
            dependencies: ["DOM", "WebAPIBase", "WebAnimations", "WebGL1", "ECMAScript"]
        ),
        .target(
            name: "Gamepad",
            dependencies: ["DOM", "WebAPIBase", "ECMAScript"]
        ),
        .target(
            name: "CSSOM",
            dependencies: ["DOM", "WebAPIBase", "SVG", "ECMAScript"]
        ),
        .target(
            name: "SVG",
            dependencies: ["DOM", "WebAPIBase", "ECMAScript"]
        ),
        .target(
            name: "FileSystem",
            dependencies: ["DOM", "WebAPIBase", "ECMAScript"]
        ),
       .target(
            name: "ECMAScript",
            dependencies: [
                "JavaScriptKit",
                .product(name: "JavaScriptEventLoop", package: "JavaScriptKit"),
                .product(name: "JavaScriptBigIntSupport", package: "JavaScriptKit"),
            ]
        ),
    ]
)
