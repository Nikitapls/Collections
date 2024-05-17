## Environment

Our environment consists of:
- Xcode `15.3`
- SwiftLint `0.53.0`
- SwiftFormat `0.53.8`

## How to Control the Style Guide

We are using `SwiftLint` and `SwiftFormat` to control the style guide in our repository.

Follow these steps to apply our style guide rules to your code:
1. To use `SwiftFormat`, run this command: `swiftformat --config .swiftformat <path_to_check>`.
1. To use `SwiftLint`, run this command: `swiftlint --fix --config ./swiftlint.yml <path_to_check>`.
1. Fix all warnings or ignore them only if you're sure it's needed in your situation.
1. Commit the changes to your branch.

## Issue Submission Guidelines

Please adhere to the following:
1. Add a simple and short title to the issue that clearly shows what the issue is about and makes it easier to find in the list.
1. Include a `Description` section in the issue. This section should outline the problem the issue is addressing.

## How to Submit a PR

1. Make sure that the code builds successfully on the branch which you want to merge to the target branch.
1. You should check that your code conforms to our style guide (you could follow the steps from the [section](how-to-control-the-style-guide)).
1. Make sure that your PR has an addressed issue attached to it.
1. Your PR description should describe the list of changes in it.
1. Your PR shouldn't have any conflicts with the target branch.