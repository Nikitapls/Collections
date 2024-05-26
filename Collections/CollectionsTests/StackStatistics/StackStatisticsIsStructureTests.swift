import Collections
import XCTest

final class StackStatisticsIsStructureTests: XCTestCase {
    func test_stack_isStructure() {
        // Given
        let stack = StackStatistics<Int>()
        let mirror = Mirror(reflecting: stack)

        // When, Then
        XCTAssertEqual(mirror.displayStyle, .struct)
    }
}
