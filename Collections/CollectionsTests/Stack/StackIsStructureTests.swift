import XCTest
import Collections

final class StackIsStructureTests: XCTestCase {
    func test_stack_isStructure() {
        // Given
        let stack = Stack<Int>()
        let mirror = Mirror(reflecting: stack)

        // When, Then
        XCTAssertEqual(mirror.displayStyle, .struct)
    }
}
