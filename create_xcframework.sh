#!/usr/bin/env sh

readonly SCRIPT_FOLDER=$(dirname -- "${0}")
readonly ARCHIVE_FOLDER="archives"
readonly FRAMEWORK_NAME="Collections"
readonly BUILDS_FOLDER="builds"

cd "${SCRIPT_FOLDER}" || exit

archive_framework() {
  platform="${1}"
  xcodebuild archive \
    -project Collections/Collections.xcodeproj \
    -scheme Collections \
    -destination "generic/platform="${platform}"" \
    -archivePath ""${ARCHIVE_FOLDER}"/"${FRAMEWORK_NAME}"-"${platform}""
}

archive_framework iOS
archive_framework macOS

rm -rf ""${BUILDS_FOLDER}"/"

xcodebuild -create-xcframework \
    -archive ""${ARCHIVE_FOLDER}"/"${FRAMEWORK_NAME}"-iOS.xcarchive" \
    -framework ""${FRAMEWORK_NAME}".framework" \
    -archive ""${ARCHIVE_FOLDER}"/"${FRAMEWORK_NAME}"-macOS.xcarchive" \
    -framework ""${FRAMEWORK_NAME}".framework" \
    -output ""${BUILDS_FOLDER}"/"${FRAMEWORK_NAME}".xcframework"

rm -rf ""${ARCHIVE_FOLDER}"/"
