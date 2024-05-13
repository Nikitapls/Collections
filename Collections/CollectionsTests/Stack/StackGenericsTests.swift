import XCTest
import Collections

final class StackGenericsTests: XCTestCase {
    func test_withVariousGenericParameters() {
        _ = Stack<Int>()
        _ = Stack<Double>()
        _ = Stack<String>()
    }
}
