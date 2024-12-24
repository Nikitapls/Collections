## Environment

The development environment consists of:
- Xcode `16.0` or later
- Swift `6.0` or later
- SwiftLint `0.57.0` or later
- SwiftFormat `0.54.6` or later

## How to Control the Style Guide

We are using `SwiftLint` and `SwiftFormat` to control the style guide in our repository.

Follow these steps to apply our style guide rules to your code:
1. To use `SwiftFormat`, run this command: `swiftformat --config <path_to_swiftformat_config> <path_to_check>`, where `<path_to_swiftformat_config>` is a path to the `.swiftformat` file from the current repository, `<path_to_check>` is path to files or directories to be processed.
1. To use `SwiftLint`, run this command: `swiftlint --config <path_to_swiftlint_config> <path_to_check>`, where `<path_to_swiftlint_config>` is a path to the `.swiftlint.yml` file from the current repository, `<path_to_check>` is path to files or directories to be processed.
1. Fix all warnings or ignore them only if you're sure it's needed in your situation.

## Issue Submission Guidelines

Follow these steps to submit an issue:

1. **Ensure you're on the latest version.** Update to the most recent `Collections` package release if possible.
2. **Check for similar issues** before opening any new ones. It's possible somebody has encountered this bug already. Please add a comment to the existing issue instead of opening a new one.
3. **Use a clear and descriptive title** for the issue that clearly shows what the issue is about and makes it easier to find in the list.
4. Include a `Description` section in the issue. This section should:
    - **Outline the problem** the issue is addressing in as many details as possible.
    - **Provide code samples** if applicable.
    - **Include screenshots or animated GIFs** which could clearly demonstrate the problem, if it's possible.
    - **Explain which behaviour you expect to see and why.**
5. **Provide information about your environment** such as the `Collections` version, OS version, and Xcode version.

## How to Submit a PR

1. Make sure that the code builds successfully on the branch which you want to merge to the target branch.
1. You should check that your code conforms to our style guide (you could follow the steps from the [How to Control the Style Guide](./CONTRIBUTING.md#how-to-control-the-style-guide)).
1. Make sure that your PR has an addressed issue attached to it.
1. Your PR description should describe the list of changes in it.
1. Your PR shouldn't have any conflicts with the target branch.
1. Before merging your PR, ensure it has been reviewed and approved by at least one member of the team.
1. Do not merge your PR without approval. This helps to avoid introducing unstable code into the repository.
