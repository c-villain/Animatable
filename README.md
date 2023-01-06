# Animatable

[![Latest release](https://img.shields.io/github/v/release/c-villain/Animatable?color=brightgreen&label=version)](https://github.com/c-villain/Animatable/releases/latest)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fc-villain%2FAnimatable%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/c-villain/Animatable)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fc-villain%2FAnimatable%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/c-villain/Animatable)
[![](https://img.shields.io/badge/SPM-supported-DE5C43.svg?color=brightgreen)](https://swift.org/package-manager/)
![](https://img.shields.io/github/license/c-villain/Animatable)

[![contact: @lexkraev](https://img.shields.io/badge/contact-%40lexkraev-blue.svg?style=flat)](https://t.me/lexkraev)
[![Telegram Group](https://img.shields.io/endpoint?color=neon&style=flat-square&url=https%3A%2F%2Ftg.sumanjay.workers.dev%2Fswiftui_dev)](https://telegram.dog/swiftui_dev)

Yet another animation modifiers for buttons on SwiftUI.

👨🏻‍💻 Feel free to subscribe to channel **[SwiftUI dev](https://t.me/swiftui_dev)** in telegram.

## Requirements

- iOS 13.0 or macOS 10.15

## Installation

#### Swift Package Manager

To integrate ```Animatable``` into your project using SwiftPM add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/c-villain/Animatable", from: "0.1.0"),
],
```
or via [XcodeGen](https://github.com/yonaskolb/XcodeGen) insert into your `project.yml`:

```yaml
name: YourProjectName
options:
  deploymentTarget:
    iOS: 13.0
packages:
  Animatable:
    url: https://github.com/c-villain/Animatable
    from: 0.1.0
targets:
  YourTarget:
    type: application
    ...
    dependencies:
       - package: Animatable
```

## Types

- live comments

