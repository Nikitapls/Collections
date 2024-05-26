import Collections
import XCTest

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
