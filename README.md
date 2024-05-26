# Collections

## About

This repository contains the source code of data structure implementations for both iOS and macOS projects.
The code is organized into a static framework.
A `DemoApplication` demonstrating the use of the framework is also included.

## Contents

This repository corrently provides the following implementations:
- The `Stack` class provides basic stack operations.
- The `StackStatistics` class extends the functionality of the `Stack` with a `minimumElement` method for efficient minimum element retrieval.

## Software Requirements

To run the code you need Swift version `5.10` or later, Xcode version `15.3` or later.

## Supported platforms

This framework supports both macOS and iOS application development.
The minimum supported versions are `12.0` for iOS and `10.13` for macOS.

## Integration

### Swift Package Manager

`Collections.xcframework` supports integration via Swift Package Manager starting from the `0.2.0` version.

Follow these steps to import the Swift package:

1. In Xcode, install the Google Mobile Ads Swift Package by navigating to File > Add Packages....

1. In the prompt that appears, search for the Collections GitHub repository:

```
https://github.com/nikitapls/Collections
```

1. Select the version of the Collections Swift Package you want to use. For new projects, we recommend using the Up to Next Major Version.

### XCFramework

There are two ways to get the `Collections.xcframework`:
1. Download the latest release version of the `Collections.xcramework` from this repository.
2. Build the xcframework using `./create_xcframework.sh` or you may follow the [instructions](https://developer.apple.com/documentation/xcode/creating-a-multi-platform-binary-framework-bundle#Create-archives-for-frameworks-or-libraries) provided by Apple.

Once you have the `Collections.xcframework`, you can add it to your project. We recommend choosing the `Do not embed` option.

## Versioning

We follow [SemVer 2.0](https://semver.org/#summary) for versioning. You can find the available versions in the tags of this repository.

## License

Please refer to the [LICENSE](./LICENSE.md) file for more details.

## Contact

If you have any questions or feedback, please feel free to contact me at **nikita.puzikov.work@gmail.com**.
