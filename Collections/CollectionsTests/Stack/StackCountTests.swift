import XCTest
import Collections

final class StackCountTests: XCTestCase {
    func test_count_withEmptyStack_returnsZero() {
        XCTAssertEqual(Stack<Int>().count, 0)
    }

    func test_count_withNonEmptyStack_returnsNumberOfElements() {
        // Given
        let stackElements = [1, 2, 3]
        let stack = Stack(stackElements)
        let expectedStackCount = stackElements.count

        // When, Then
        XCTAssertEqual(stack.count, expectedStackCount)
    }
}
