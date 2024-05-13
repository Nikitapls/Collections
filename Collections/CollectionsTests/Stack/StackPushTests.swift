import XCTest
import Collections

final class StackPushTests: XCTestCase {
    func test_push_addsElementToStack() {
        // Given
        var stack = Stack<Int>()
        let expectedTopElementAfterPush = 1

        // When
        stack.push(1)

        // Then
        XCTAssertEqual(stack.top(), expectedTopElementAfterPush)
    }

    func test_push_addsElementToTheEndOfTheStack() {
        // Given
        var stack = Stack<Int>([0])
        let elementToBeAdded = 1
        let expectedTopElementAfterPush = elementToBeAdded

        // When
        stack.push(elementToBeAdded)

        // Then
        XCTAssertEqual(stack.top(), expectedTopElementAfterPush)
    }
}
