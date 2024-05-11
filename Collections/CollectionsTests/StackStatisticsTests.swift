import XCTest
import Collections

final class StackStatisticsMinimumElementTests: XCTestCase {
    private class DummyClass: Comparable {
        let value: Int

        init(value: Int) {
            self.value = value
        }

        static func < (lhs: DummyClass, rhs: DummyClass) -> Bool {
            lhs.value < rhs.value
        }

        static func == (lhs: DummyClass, rhs: DummyClass) -> Bool {
            lhs.value == rhs.value
        }
    }

    private var stack = StackStatistics<Int>()

    override func setUp() {
        stack = StackStatistics<Int>()
    }

    func test_whenStackIsEmpty_returnsNil() {
        XCTAssertNil(stack.minimumElement())
    }

    func test_whenStackHasOneElement_returnsElement() {
        // Given
        let elementToPush = 1
        let expectedMinimumElement = elementToPush
        stack.push(1)

        // When, Then
        XCTAssertEqual(stack.minimumElement(), expectedMinimumElement)
    }

    func test_whenStackHasMultipleElements_returnsSmallerElement() {
        // Given
        let expectedSmallestElement = 1
        stack.push(3)
        stack.push(expectedSmallestElement)
        stack.push(2)

        // When, Then
        XCTAssertEqual(stack.minimumElement(), expectedSmallestElement)
    }

    func test_whenStackHasMultipleElements_returnsLastLesserElementAfterEveryPopInvocation() {
        // Given
        let inputElements = [3, 1, 2, 0]
        let expectedMinimumSequence = [0, 1, 1, 3]
        var stack = StackStatistics(inputElements)

        // When
        var minimumElements = [stack.minimumElement()]
        while stack.pop() != nil,
              let nextMinimumElement = stack.minimumElement() {
            minimumElements.append(nextMinimumElement)
        }

        // Then
        XCTAssertEqual(minimumElements, expectedMinimumSequence)
    }

    func test_whenMultipleMinimumElementsAdded_returnsFirstLesserElement() {
        // Given
        var stack = StackStatistics<DummyClass>()
        let objectA = DummyClass(value: 0)
        let objectB = DummyClass(value: 0)
        let expectedMinimumObject = objectA
        stack.push(objectA)
        stack.push(DummyClass(value: 2))
        stack.push(objectB)
        stack.push(DummyClass(value: 2))

        // When
        let minimumElement = stack.minimumElement()

        // Then
        XCTAssertTrue(minimumElement === expectedMinimumObject)
    }
}

final class StackStatisticsGenericsTests: XCTestCase {
    func test_withVariousGenericParameters() {
        _ = StackStatistics<Int>()
        _ = StackStatistics<Double>()
        _ = StackStatistics<String>()
    }
}

final class StackStatisticsIsStructureTests: XCTestCase {
    func test_stack_isStructure() {
        // Given
        let stack = StackStatistics<Int>()
        let mirror = Mirror(reflecting: stack)

        // When, Then
        XCTAssertEqual(mirror.displayStyle, .struct)
    }
}

final class StackStatisticsCountTests: XCTestCase {
    func test_count_withEmptyStack_returnsZero() {
        XCTAssertEqual(StackStatistics<Int>().count, 0)
    }

    func test_count_withNonEmptyStack_returnsNumberOfElements() {
        // Given
        let stackElements = [1, 2, 3]
        let stack = StackStatistics(stackElements)
        let expectedStackCount = stackElements.count

        // When, Then
        XCTAssertEqual(stack.count, expectedStackCount)
    }
}

final class StackStatisticsIsEmptyTests: XCTestCase {
    func test_isEmpty_withEmptyStack_returnsTrue() {
        XCTAssertTrue(StackStatistics<Int>().isEmpty)
    }

    func test_isEmpty_withNonEmptyStack_returnsFalse() {
        // Given
        let stack = StackStatistics([1])

        // When, Then
        XCTAssertFalse(stack.isEmpty)
    }
}

final class StackStatisticsPushTests: XCTestCase {
    func test_push_addsElementToStack() {
        // Given
        var stack = StackStatistics<Int>()
        let expectedTopElementAfterPush = 1

        // When
        stack.push(1)

        // Then
        XCTAssertEqual(stack.top(), expectedTopElementAfterPush)
    }

    func test_push_addsElementToTheEndOfTheStack() {
        // Given
        var stack = StackStatistics([0])
        let elementToBeAdded = 1
        let expectedTopElementAfterPush = elementToBeAdded

        // When
        stack.push(elementToBeAdded)

        // Then
        XCTAssertEqual(stack.top(), expectedTopElementAfterPush)
    }
}

final class StackStatisticsPopTests: XCTestCase {
    var stack = StackStatistics<Int>()

    override func setUp() {
        stack = StackStatistics<Int>()
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
        stack = StackStatistics([1, 2, 3])
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
        stack = StackStatistics(pushedElements)

        // When
        var poppedElements = [Int]()
        while let poppedElement = stack.pop() {
            poppedElements.append(poppedElement)
        }

        // Then
        XCTAssertEqual(poppedElements, expectedPoppedElements)
    }
}

final class StackStatisticsTopTests: XCTestCase {
    func test_top_withEmptyStack_returnsNil() {
        XCTAssertNil(StackStatistics<Int>().top())
    }

    func test_top_withNonEmptyStack_returnsLastElement() {
        // Given
        let stackElements = [1, 2]
        let stack = StackStatistics(stackElements)
        let expectedTopElement = stackElements.last

        // When, Then
        XCTAssertEqual(stack.top(), expectedTopElement)
    }

    func test_top_doesNotRemoveLastAddedElement() {
        // Given
        let stack = StackStatistics([1])
        let expectedStackCountAfterTop = stack.count

        // When
        _ = stack.top()

        // Then
        XCTAssertEqual(stack.count, expectedStackCountAfterTop)
    }
}
