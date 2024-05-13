import XCTest
import Collections

final class StackStatisticsGenericsTests: XCTestCase {
    func test_withVariousGenericParameters() {
        _ = StackStatistics<Int>()
        _ = StackStatistics<Double>()
        _ = StackStatistics<String>()
    }
}
