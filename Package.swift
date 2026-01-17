// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "elementary-flow",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(name: "ElementaryFlow", targets: ["ElementaryFlow"])
        //.plugin(name: "ElementaryFlowCSSGenerator", targets: ["ElementaryFlowCSSGenerator"]),
    ],
    dependencies: [
        .package(url: "https://github.com/elementary-swift/elementary", from: "0.6.0")
    ],
    targets: [
        .target(
            name: "ElementaryFlow",
            dependencies: [
                .product(name: "Elementary", package: "elementary"),
                .target(name: "CSSDefinitions"),
            ]
        ),
        .target(name: "CSSDefinitions"),
        .testTarget(
            name: "ElementaryFlowTests",
            dependencies: ["ElementaryFlow"]
        ),
        .plugin(
            name: "ElementaryFlowCSSGenerator",
            capability: .command(
                intent: .custom(
                    verb: "generate-css",
                    description: "Generates the ElementaryFlow style sheet"
                ),
                permissions: [
                    .writeToPackageDirectory(reason: "Write generated CSS file.")
                ]
            ),
            dependencies: [
                "ElementaryFlowCSSGeneratorTool"
            ]
        ),
        .executableTarget(
            name: "ElementaryFlowCSSGeneratorTool",
            dependencies: ["CSSDefinitions"],
            path: "Tools/ElementaryFlowCSSGenerator"
        ),
    ]
)
