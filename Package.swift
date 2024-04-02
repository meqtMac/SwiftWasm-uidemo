// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swiftwasm-uidemo",
    platforms: [
        .macOS(.v13),
        .iOS(.v15),
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
        .package(path: "WebAPIKit")
    ],
    targets: [
        .executableTarget(
            name: "DRUIDemo",
            dependencies: [
                "DRUI",
                .product(
                    name: "OpenCombineShim",
                    package: "OpenCombine"
                ),
            ]
        ),
        .target(
            name: "DRUI",
            dependencies: [
                .product(name: "DOM", package: "WebAPIKit"),
                .product(name: "WebGL2", package: "WebAPIKit"),
                "RefCount",
                "DRColor",
                "DRMath"
            ]
        ),
        .target(
            name: "DRPaint",
            dependencies: [
                "DRColor",
                "DRMath"
            ]
        ),
        .target(name: "DRColor"),
        .target(name: "DRMath"),
        .target(name: "RefCount"),
    ]
)
