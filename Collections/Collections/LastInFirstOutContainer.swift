/// An interface for a container where elements are added and removed in a specific order:
/// the last element added is the first one to be removed.
///
/// This container supports the following operations,
/// which allow for the manipulation of its state:
///   - adding an element;
///   - removing the most recently added (top) element;
///   - retrieving the most recently added (top) element without removing it.
public protocol LastInFirstOutContainer {
    /// The type of elements contained in the container.
    associatedtype Element

    /// Adds a new element in a position where it will be the first one to be removed.
    /// - Parameter newElement: The element to be added to the container.
    mutating func push(_ newElement: Element)

    /// Returns the most recently added element of the container without removing it.
    /// - Returns: The last added element of the container if the container is not empty;
    /// otherwise, `nil`.
    func top() -> Element?

    /// Removes and returns the most recently added element of the container.
    /// - Returns: The last added element of the container if the container is not empty;
    /// otherwise, `nil`.
    @discardableResult
    mutating func pop() -> Element?
}
