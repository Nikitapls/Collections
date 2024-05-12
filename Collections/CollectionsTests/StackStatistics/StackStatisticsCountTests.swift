import XCTest
import Collections

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
