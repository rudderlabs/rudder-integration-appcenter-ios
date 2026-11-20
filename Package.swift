// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Rudder-AppCenter",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "Rudder-AppCenter",
            targets: ["Rudder-AppCenter"]
        )
    ],
    dependencies: [
        .package(name: "AppCenter", url: "https://github.com/microsoft/appcenter-sdk-apple", from: "5.0.0"),
        .package(name: "Rudder", url: "https://github.com/rudderlabs/rudder-sdk-ios", "1.0.0"..<"2.0.0"),
    ],
    targets: [
        .target(
            name: "Rudder-AppCenter",
            dependencies: [
                .product(name: "AppCenterAnalytics", package: "AppCenter"),
                .product(name: "AppCenterCrashes", package: "AppCenter"),
                .product(name: "Rudder", package: "Rudder"),
            ],
            path: "Rudder-AppCenter",
            sources: ["Classes/"],
            publicHeadersPath: "Classes/",
            cSettings: [
                .headerSearchPath("Classes/")
            ]
        )
    ]
)
