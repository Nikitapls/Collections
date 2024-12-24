import Collections
import XCTest

public final class MinHeapInitWithElementsTests: XCTestCase {
    func test_withNonEmptySequence_returnsMin() {
        // Given
        let elements = [3, 0, 4, 0, 5]
        let expectedMinimum = 0

        // When
        let heap = MinHeap(elements)

        // Then
        XCTAssertEqual(heap.min, expectedMinimum)
    }

    func test_withEmptySequence_returnsNil() {
        // Given
        let emptyArray = [Int]()

        // When
        let heap = MinHeap(emptyArray)

        // Then
        XCTAssertNil(heap.min)
    }
}
