// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "SwiftUIComponentKit",
    platforms: [.iOS("17.0")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftUIComponentKit",
            targets: ["SwiftUIComponentKit"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftUIComponentKit"),
        .testTarget(
            name: "SwiftUIComponentKitTests",
            dependencies: ["SwiftUIComponentKit"]
        ),
    ]
)
