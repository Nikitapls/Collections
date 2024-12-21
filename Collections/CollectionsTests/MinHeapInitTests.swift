import Collections
import XCTest

public final class MinHeapInitTests: XCTestCase {
    func test_withEmptySequence_returnsNil() {
        // Given, When
        let heap = MinHeap<Int>()

        // Then
        XCTAssertNil(heap.min)
    }
}
