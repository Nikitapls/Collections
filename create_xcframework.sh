#!/usr/bin/env sh

SCRIPT_FOLDER=$(dirname -- "$0")

cd "$SCRIPT_FOLDER" || exit

readonly ARCHIVE_PATH="archives"
readonly FRAMEWORK_NAME="Collections"

archive_framework() {
  platform=$1
  xcodebuild archive \
    -project ./Collections/Collections.xcodeproj \
    -scheme Collections \
    -destination "generic/platform=$platform" \
    -archivePath "$ARCHIVE_PATH/$FRAMEWORK_NAME-$platform" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES
}

archive_framework iOS
archive_framework macOS

xcodebuild -create-xcframework \
    -archive "$ARCHIVE_PATH/$FRAMEWORK_NAME-iOS.xcarchive" \
    -framework $FRAMEWORK_NAME.framework \
    -archive "$ARCHIVE_PATH/$FRAMEWORK_NAME-macOS.xcarchive" \
    -framework $FRAMEWORK_NAME.framework \
    -output "./builds/$FRAMEWORK_NAME.xcframework"

rm -rf "$ARCHIVE_PATH/"
