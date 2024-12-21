/// A `MinHeap` is a binary tree-based data structure
/// designed to quickly return the minimum element.
/// It ensures that the smallest element is always at the root of the tree.
///
/// Each node in a `MinHeap` can have up to two children, known as the left and right child.
/// This structure maintains the heap invariant, ensuring that for any given node,
/// its value is less than or equal to the values of its children.
public struct MinHeap<T: Comparable> {
    /// The underlying array representation of the heap.
    /// The heap invariant is maintained such that for any element at index `i`,
    /// the element is less than or equal to its children at indices `2*i + 1` and `2*i + 2`.
    private var heap: [T] = []

    private let maximumNumberOfChildren = 2

    // MARK: - Initializers

    /// Initializes an empty heap.
    public init() {}

    /// Initializes a new heap with elements from a given sequence.
    /// - Parameter elements: A sequence of elements to initialize the heap.
    public init(_ elements: some Sequence<T>) {
        heap = Array(elements)

        let halfDivider = 2
        let lastNonLeafIndexOffset = 1
        let lastNonLeafNodeIndex = heap.count / halfDivider - lastNonLeafIndexOffset
        let rootNodeIndex = 0
        let step = -1

        for index in stride(from: lastNonLeafNodeIndex, through: rootNodeIndex, by: step) {
            bubbleDown(from: index)
        }
    }

    // MARK: - Heap State Properties

    /// A Boolean value indicating whether the heap is empty.
    public var isEmpty: Bool {
        heap.isEmpty
    }

    /// The number of elements in the heap.
    public var count: Int {
        heap.count
    }

    /// Returns the minimum element.
    /// - Returns: The minimum element, if the heap is not empty; otherwise `nil`.
    /// If there are multiple equal lesser values, the result is any of them.
    public var min: T? {
        heap.first
    }

    // MARK: - Insertion of element

    /// Inserts a new element into the heap.
    /// - Complexity: `O(log n)` on average, over many calls to `insert(_:)`,
    /// where `n` is the number of elements in the heap.
    /// The worst case is `O(n)`, where `n` is the number of elements in the heap.
    public mutating func insert(_ value: T) {
        heap.append(value)
        bubbleUp(from: heap.count - 1)
    }

    // MARK: - Deletion of Minimum Element

    /// Removes and returns the minimum element from the heap.
    /// - Returns: The minimum element, if the heap is not empty.
    /// If there are multiple elements with the minimum value, any one of them may be returned.
    /// - Complexity: `O(log n)`, where `n` is the number of elements in the heap.
    @discardableResult
    public mutating func removeMin() -> T? {
        guard !heap.isEmpty else { return nil }

        guard heap.count > 1 else {
            return heap.removeLast()
        }

        let min = heap[0]
        heap[0] = heap.removeLast()
        bubbleDown(from: 0)

        return min
    }

    // MARK: - Heap Invariant Maintenance

    /// Adjusts the position of an element at `index` upwards in the heap
    /// to maintain the heap invariant.
    ///
    /// - Parameter index: The index of the element to be adjusted upwards.
    /// - Complexity: `O(log n)`, where `n` is the number of elements in the heap.
    private mutating func bubbleUp(from index: Int) {
        var currentIndex = index
        while currentIndex > 0 {
            let parent = parentIndex(of: currentIndex)

            guard heap[currentIndex] < heap[parent] else {
                break
            }

            heap.swapAt(currentIndex, parent)
            currentIndex = parent
        }
    }

    /// Adjusts the position of an element at `index` downwards in the heap
    /// to maintain the heap invariant.
    ///
    /// - Parameter index: The index of the element to be adjusted downwards.
    /// - Complexity: `O(log n)`, where `n` is the number of elements in the heap.
    private mutating func bubbleDown(from index: Int) {
        var currentIndex = index
        while true {
            let left = leftChildIndex(of: currentIndex)
            let right = rightChildIndex(of: currentIndex)
            var smallest = currentIndex

            if left < heap.count, heap[left] < heap[smallest] {
                smallest = left
            }
            if right < heap.count, heap[right] < heap[smallest] {
                smallest = right
            }

            if smallest != currentIndex {
                heap.swapAt(currentIndex, smallest)
                currentIndex = smallest
            } else {
                break
            }
        }
    }

    // MARK: - Index Calculation Helpers

    private func parentIndex(of index: Int) -> Int {
        let rootIndexOffset = 1
        return (index - rootIndexOffset) / maximumNumberOfChildren
    }

    private func leftChildIndex(of index: Int) -> Int {
        let leftChildOffset = 1
        return (maximumNumberOfChildren * index) + leftChildOffset
    }

    private func rightChildIndex(of index: Int) -> Int {
        let rightChildOffset = 2
        return (maximumNumberOfChildren * index) + rightChildOffset
    }
}
