import Collections
import XCTest

public final class MinHeapRemoveMinTests: XCTestCase {
    func test_withEmptyHeap_returnsNil() {
        // Given
        var heap = MinHeap<Int>()

        // When
        let minimumElement = heap.removeMin()

        // Then
        XCTAssertNil(minimumElement)
    }

    func test_withNonEmptyHeap_returnsAndRemovesMinimumElement() {
        // Given
        var heap = MinHeap([2, -10, 0, 15])
        let expectedMinimum = -10

        // When
        let minimumElement = heap.removeMin()

        // Then
        XCTAssertEqual(minimumElement, expectedMinimum)
    }

    func test_withMultipleDeletions_updatesMinimumCorrectly() {
        // Given
        var heap = MinHeap([1, 23, 52, -10, 0, -5, 19])
        let expectedMinimums = [-10, -5, 0, 1, 19, 23, 52]

        // When
        for expectedMinimum in expectedMinimums {
            // Then
            XCTAssertEqual(heap.min, expectedMinimum)

            heap.removeMin()
        }
    }
}
