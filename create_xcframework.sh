#!/usr/bin/env sh

# Create the archives
xcodebuild archive \
    -project ./Collections/Collections.xcodeproj \
    -scheme Collections \
    -destination "generic/platform=iOS" \
    -archivePath "archives/Collections-iOS" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
    -project ./Collections/Collections.xcodeproj \
    -scheme Collections \
    -destination "generic/platform=macOS" \
    -archivePath "archives/Collections-macOS" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES 

# Create the XCFramework
xcodebuild -create-xcframework \
    -archive archives/Collections-iOS.xcarchive -framework Collections.framework \
    -archive archives/Collections-macOS.xcarchive -framework Collections.framework \
    -output "./Collections.xcframework"
