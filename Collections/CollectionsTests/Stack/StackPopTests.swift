import Collections
import XCTest

final class StackPopTests: XCTestCase {
    var stack = Stack<Int>()

    override func setUp() {
        stack = Stack<Int>()
    }

    func test_pop_withEmptyStack_returnsNil() {
        XCTAssertNil(stack.pop())
    }

    func test_pop_withNonEmptyStack_returnsLastAddedElement() {
        // Given
        stack.push(1)

        // When, Then
        XCTAssertEqual(stack.pop(), 1)
    }

    func test_pop_withNonEmptyStack_removesLastAddedElement() {
        // Given
        stack.push(1)

        // When
        stack.pop()

        // Then
        XCTAssertTrue(stack.isEmpty)
    }

    func test_pop_withNonEmptyStack_removesOnlyLastAddedElement() {
        // Given
        stack = Stack([1, 2, 3])
        let stackSizeBeforePop = stack.count
        let expectedStackSizeAfterPop = stackSizeBeforePop - 1

        // When
        stack.pop()
        let stackSizeAfterPop = stack.count

        // Then
        XCTAssertEqual(stackSizeAfterPop, expectedStackSizeAfterPop)
    }

    func test_pop_withNonEmptyStack_returnsElementsAccordingToLifo() {
        // Given
        let pushedElements = Array(-10...1_000)
        let expectedPoppedElements = Array(pushedElements.reversed())
        stack = Stack(pushedElements)

        // When
        var poppedElements = [Int]()
        while let poppedElement = stack.pop() {
            poppedElements.append(poppedElement)
        }

        // Then
        XCTAssertEqual(poppedElements, expectedPoppedElements)
    }
}
