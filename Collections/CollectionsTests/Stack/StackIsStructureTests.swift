import Collections
import XCTest

final class StackIsStructureTests: XCTestCase {
    func test_stack_isStructure() {
        // Given
        let stack = Stack<Int>()
        let mirror = Mirror(reflecting: stack)

        // When, Then
        XCTAssertEqual(mirror.displayStyle, .struct)
    }
}
