// Copyright © 2022 LVMH. All rights reserved.

/// A type-erased task that you can store in a collection
/// to allow you to cancel at a later date.
///
/// Upon deinit of the task, the task will be cancelled
/// automatically. Similar to Combine's AnyCancellable.
final class AnyTask {

    /// Call this cancellation block to cancel the task manually.
    let cancel: () -> Void
    /// Checks whether the task is cancelled.
    var isCancelled: Bool {
        isCancelledBlock()
    }

    private let isCancelledBlock: () -> Bool

    deinit {
        // On deinit, if the task is not cancelled then cancel it
        if !self.isCancelled {
            self.cancel()
        }
    }

    /// Constructs an AnyTask from the provided Task.
    /// The provided task is held strongly until AnyTask is
    /// deinitted.
    /// - Parameter task: The task to construct with.
    init<S, E>(_ task: Task<S, E>) {
        self.cancel = task.cancel
        self.isCancelledBlock = { task.isCancelled }
    }
}

extension Task {
    func eraseToAnyTask() -> AnyTask { AnyTask(self) }
}
