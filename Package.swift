// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Collections",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "Collections",
            type: .static,
            targets: ["Collections"]
        ),
    ],
    targets: [
        .target(
            name: "Collections",
            path: "Collections/Collections/"
        ),
        .testTarget(
            name: "CollectionsTests",
            dependencies: ["Collections"],
            path: "Collections/CollectionsTests/"
        ),
    ]
)
