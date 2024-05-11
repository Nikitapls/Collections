/// Ordered structure that holds elements and follows a principle
/// that the last element added is the first one to be removed.
public struct Stack<Element>: LastInFirstOutContainer {
    private var elements: [Element]

    /// Creates a new instance of the stack with initial elements.
    /// - Parameter elements: Elements to store in the stack.
    /// The initial elements to be added to the stack
    /// in the order they appear in the array.
    /// The first element in the array will be
    /// the last one to be removed from the stack.
    public init(_ elements: [Element] = []) {
        self.elements = elements
    }

    /// The number of elements in the stack.
    public var count: Int { elements.count }

    /// A Boolean value indicating whether the stack is empty.
    public var isEmpty: Bool { elements.isEmpty }

    /// Adds a new element in a position where it will be the first one to be removed.
    ///
    /// The following example adds a new element into the stack,
    /// and then retrieves all elements from the stack using standard operation:
    ///
    ///     var numbers = Stack([1, 2, 3, 4, 5])
    ///     numbers.push(6)
    ///     var elements = [Int]()
    ///     while let number = numbers.pop() {
    ///         elements.append(number)
    ///     }
    ///     print(elements)
    ///     // Prints "[6, 5, 4, 3, 2, 1]"
    ///
    /// - Parameter newElement: The element to be added to the stack.
    /// - Complexity: O(1) on average, over many calls to `push(_:)` on the
    ///   same stack.
    /// Worst case is O(`n`), where `n` is the number of elements in the stack.
    public mutating func push(_ newElement: Element) {
        elements.append(newElement)
    }

    /// Returns the most recently added element of the stack without removing it.
    /// - Returns: The last added element of the stack if the stack is empty, returns `nil`.
    /// - Complexity: O(1)
    public func top() -> Element? {
        elements.last
    }

    /// Removes and returns the most recently added element of the stack.
    /// - Returns: The last added element of the stack if the stack is empty, returns `nil`.
    /// - Complexity: O(1)
    @discardableResult
    public mutating func pop() -> Element? {
        elements.popLast()
    }
}
