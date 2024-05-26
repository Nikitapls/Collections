import Collections
import XCTest

final class StackIsEmptyTests: XCTestCase {
    func test_isEmpty_withEmptyStack_returnsTrue() {
        XCTAssertTrue(Stack<Int>().isEmpty)
    }

    func test_isEmpty_withNonEmptyStack_returnsFalse() {
        // Given
        let stack = Stack<Int>([1])

        // When, Then
        XCTAssertFalse(stack.isEmpty)
    }
}
