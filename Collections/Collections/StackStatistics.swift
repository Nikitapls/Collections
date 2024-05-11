/// An ordered collection of elements that works as a stack.
/// The order in which an element added to or removed from a stack is described as “last in, first out”,
/// refer the `LastInFirstOutContainer` protocol for more details.
/// In addition, data type allows to get simple statistics
/// like the current minimum element among stored in the stack.
public struct StackStatistics<Element: Comparable>: LastInFirstOutContainer {
    /// Keeps track of the lesser elements.
    /// The top of this stack always represents
    /// the current lesser element in the `StackStatistics`.
    private var minElements: Stack<Element>
    private var elements: Stack<Element>

    /// Creates a new instance of the stack with initial elements.
    /// - Parameter elements: Elements to store in the stack.
    /// The initial elements to be added to the stack
    /// in the order they appear in the array.
    /// The first element in the array will be
    /// the last one to be removed from the stack.
    public init(_ elements: [Element] = []) {
        self.elements = Stack()
        minElements = Stack()

        elements.forEach {
            push($0)
        }
    }

    /// The number of elements in the stack.
    public var count: Int { elements.count }

    /// A Boolean value indicating whether the stack is empty.
    public var isEmpty: Bool { elements.isEmpty }

    /// Adds a new element in a position where it will be the first one to be removed
    /// compared to all the other elements currently within the collection.
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
        let currentMinimum = minElements.top() ?? newElement
        let newMinimum = min(currentMinimum, newElement)
        minElements.push(newMinimum)

        elements.push(newElement)
    }

    /// Returns the last added element of the stack without removing it.
    /// - Returns: The most recently added element; if the stack is empty, returns `nil`.
    /// - Complexity: O(1)
    public func top() -> Element? {
        elements.top()
    }

    /// Removes and returns the last added element of the stack.
    /// - Returns: The most recently added element; if the stack is empty, returns `nil`.
    /// - Complexity: O(1)
    @discardableResult
    public mutating func pop() -> Element? {
        minElements.pop()
        return elements.pop()
    }

    /// Returns the current lesser element in the stack.
    /// If there are multiple equal lesser values, returns the first one among such.
    /// - Returns: The current lesser element; if the stack is empty, returns `nil`.
    /// - Complexity: O(1)
    public func minimumElement() -> Element? {
        minElements.top()
    }
}
