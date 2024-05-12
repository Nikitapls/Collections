#!/usr/bin/env sh

SCRIPT_FOLDER=$(dirname -- "$0")

cd "$SCRIPT_FOLDER" || exit

archive_framework() {
  platform=$1
  xcodebuild archive \
    -project ./Collections/Collections.xcodeproj \
    -scheme Collections \
    -destination "generic/platform=$platform" \
    -archivePath "archives/Collections-$platform" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES
}

archive_framework iOS
archive_framework macOS

# Create the XCFramework
xcodebuild -create-xcframework \
    -archive archives/Collections-iOS.xcarchive -framework Collections.framework \
    -archive archives/Collections-macOS.xcarchive -framework Collections.framework \
    -output "./Collections.xcframework"
