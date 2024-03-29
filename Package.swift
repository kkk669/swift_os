// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift_os",
    products: [
        .library(name: "Kernel", type: .static, targets: ["Kernel"])
    ],
    targets: [
        .target(
            name: "Kernel",
            dependencies: [
                "Volatile",
                "MailboxMessage",
            ],
            swiftSettings: [
                .enableExperimentalFeature("Embedded"),
                .unsafeFlags(["-Xfrontend", "-no-allocations"]),
                .unsafeFlags(["-Xfrontend", "-function-sections"]),
                .unsafeFlags(["-Xfrontend", "-disable-stack-protector"]),
                .define("RASPI3"),
            ]
        ),
        .systemLibrary(name: "Volatile"),
        .target(name: "MailboxMessage"),
    ],
    swiftLanguageVersions: [.version("6")]
)
