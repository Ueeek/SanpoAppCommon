// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SanpoAppCommon",
    platforms: [
        .iOS(.v17),
        .watchOS(.v10)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SanpoAppCommon",
            targets: ["SanpoAppCommon"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.16.1"),
        .package(url: "https://github.com/Ueeek/composable-core-location", revision: "363839a87ee57bf2b73285921243dca982397eef")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SanpoAppCommon",
            dependencies: [
                .product(name: "CoreLocationClient", package: "composable-core-location"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "SanpoAppCommonTests",
            dependencies: ["SanpoAppCommon"]
        ),
    ]
)
