import XCTest
import Collections

final class StackTopTests: XCTestCase {
    func test_top_withEmptyStack_returnsNil() {
        XCTAssertNil(Stack<Int>().top())
    }

    func test_top_withNonEmptyStack_returnsLastElement() {
        // Given
        let stackElements = [1, 2]
        let stack = Stack(stackElements)
        let expectedTopElement = stackElements.last

        // When, Then
        XCTAssertEqual(stack.top(), expectedTopElement)
    }

    func test_top_doesNotRemoveLastAddedElement() {
        // Given
        let stack = Stack([1])
        let expectedStackCountAfterTop = stack.count

        // When
        _ = stack.top()

        // Then
        XCTAssertEqual(stack.count, expectedStackCountAfterTop)
    }
}
