// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// The relevant data for displaying `TimelineClientEventScene`
public struct TimelineClientEventDisplayable {

    /// The client ID the event belong to
    public let clientID: String
    /// The form fields and data
    public let form: AnyFormDisplayable

    /// Creates a new `TimelineClientEventDisplayable`
    /// - Parameters:
    ///   - clientID: The client ID the event belong to
    ///   - form: The form fields and data
    public init(clientID: String, form: AnyFormDisplayable) {
        self.clientID = clientID
        self.form = form
    }
}
