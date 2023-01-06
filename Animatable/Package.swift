// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Animatable",
    platforms: [
        .macOS(.v10_15), .iOS(.v13)
    ],
    products: [
        .library(
            name: "Animatable",
            targets: ["Animatable"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Animatable",
            dependencies: []),
    ]
)
