import XCTest
import Collections

final class StackIsStructureTests: XCTestCase {
    func test_stack_isStructure() {
        // Given
        let stack = Stack<Int>()
        let mirror = Mirror(reflecting: stack)

        // When, Then
        XCTAssertEqual(mirror.displayStyle, .struct)
    }
}

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

final class StackPopTests: XCTestCase {
    var stack: Stack<Int>!

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
        let pushedElements = Array(-10 ... 1_000)
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
