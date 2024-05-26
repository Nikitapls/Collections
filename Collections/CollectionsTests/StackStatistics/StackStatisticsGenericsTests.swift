import Collections
import XCTest

final class StackStatisticsGenericsTests: XCTestCase {
    func test_withVariousGenericParameters() {
        _ = StackStatistics<Int>()
        _ = StackStatistics<Double>()
        _ = StackStatistics<String>()
    }
}
