import Collections
import XCTest

public final class MinHeapIsEmptyTests: XCTestCase {
    func test_withEmptyHeap() {
        // Given
        let heap = MinHeap<Int>()

        // When, Then
        XCTAssertTrue(heap.isEmpty)
    }

    func test_withNonEmptyHeap() {
        // Given
        var heap = MinHeap<Int>()
        heap.insert(1)

        // When, Then
        XCTAssertFalse(heap.isEmpty)
    }
}
