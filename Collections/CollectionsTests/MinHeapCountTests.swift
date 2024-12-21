import Collections
import XCTest

public final class MinHeapCountTests: XCTestCase {
    func test_withEmptyHeap_returnsZero() {
        // Given
        let heap = MinHeap<Int>()
        let expectedCount = 0

        // When, Then
        XCTAssertEqual(heap.count, expectedCount)
    }

    func test_withNonEmptyHeap_returnsCorrectCount() {
        // Given
        let elements = [1, 2, 3]
        let expectedCount = elements.count
        let heap = MinHeap(elements)

        // When, Then
        XCTAssertEqual(heap.count, expectedCount)
    }
}
