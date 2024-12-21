import Collections
import XCTest

public final class MinHeapInsertTests: XCTestCase {
    func test_afterAddingElement_updatesMinimum() {
        // Given
        var heap = MinHeap<Int>()
        let elementToAdd = 1
        let expectedMinimum = elementToAdd

        // When
        heap.insert(elementToAdd)

        // Then
        XCTAssertEqual(heap.min, expectedMinimum)
    }

    func test_whenMultipleInsertions_updatesMinimumCorrectly() {
        // Given
        var heap = MinHeap<Int>()
        let elementsToAdd = [5, 3, 8, 1, 4]
        let expectedMinimums = [5, 3, 3, 1, 1]

        // When
        for (index, element) in elementsToAdd.enumerated() {
            heap.insert(element)

            // Then
            XCTAssertEqual(heap.min, expectedMinimums[index])
        }
    }
}
