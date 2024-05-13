import XCTest
import Collections

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
