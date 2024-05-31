import Collections
import XCTest

final class StackGenericsTests: XCTestCase {
    func test_withVariousGenericParameters() {
        _ = Stack<Int>()
        _ = Stack<Double>()
        _ = Stack<String>()
    }
}
