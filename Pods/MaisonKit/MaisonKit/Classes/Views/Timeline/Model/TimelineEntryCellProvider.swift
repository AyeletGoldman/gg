// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// A closure to confirm or deny timeline item
public typealias TimelineEntryConfirmationClosure = (TimelineEntryConfirmationAction) -> Void

/// An abstraction over a closure that will create the view to be displayed in a timeline entry.
/// This allows any implementer to customise the cell to be displayed in the timeline.
public struct TimelineEntryCellProvider {

    /// A closure that will create the view that will be used as the cell in the timeline
    public let entryCreation: (TimelineEntryConfirmationClosure?) -> AnyView

    /// Creates a new `TimelineEntryCellProvider`
    /// - Parameter body: a closure that will create the view that will be used as the cell
    public init<V: View>(body: @escaping () -> V) {
        self.entryCreation = { _ in
            body().eraseToAnyView()
        }
    }

    /// Creates a new `TimelineEntryCellProvider`
    /// - Parameter body: a closure that will create the view that will be used as the cell
    public init<V: View>(body: @escaping (TimelineEntryConfirmationClosure?) -> V) {
        self.entryCreation = { confirmationClosure in
            body(confirmationClosure).eraseToAnyView()
        }
    }
}
