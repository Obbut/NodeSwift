// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "SwiftJS",
    dependencies: [
        .Package(url: "https://github.com/vapor/socks.git", majorVersion: 1),
        .Package(url: "https://github.com/OpenKitten/Cheetah.git", majorVersion: 0, minor: 3)
    ]
)
