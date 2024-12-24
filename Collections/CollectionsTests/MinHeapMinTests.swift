import Collections
import XCTest

public final class MinHeapMinTests: XCTestCase {
    func test_withEmptyHeap_returnsNil() {
        // Given
        let heap = MinHeap<Int>()

        // When
        let minimumElement = heap.min

        // Then
        XCTAssertNil(minimumElement)
    }

    func test_withNonEmptyHeap_returnsMinimumElement() {
        // Given
        let heap = MinHeap([1, 2, 0])
        let expectedMinimum = 0

        // When
        let minimumElement = heap.min

        // Then
        XCTAssertEqual(minimumElement, expectedMinimum)
    }

    func test_whileInsertingElements_returnsMinimumsCorrectly() {
        // Given
        var heap = MinHeap<Int>()
        let elements = [3, 4, 1, 4, 1, 5, 9, 2, 6, 5]
        var expectedMinimums = [3, 3, 1, 1, 1, 1, 1, 1, 1, 1]

        // When
        for element in elements {
            heap.insert(element)

            // Then
            XCTAssertEqual(heap.min, expectedMinimums.removeFirst())
        }
    }

    func test_whileRemovingElements_updatesMinimumCorrectly() {
        // Given
        var heap = MinHeap([3, 1, 4, 1, 5, 9, 2, 6, 5])
        let expectedMinimums = [1, 1, 2, 3, 4, 5, 5, 6, 9]

        // When
        for expectedMinimum in expectedMinimums {
            // Then
            XCTAssertEqual(heap.min, expectedMinimum)
            _ = heap.removeMin()
        }
    }
}
