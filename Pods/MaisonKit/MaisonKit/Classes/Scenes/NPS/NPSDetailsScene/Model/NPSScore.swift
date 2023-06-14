// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The score representation for an NPS survey.
public struct NPSScore {
    /// The value given to this NPS by the client.
    public let value: Int
    /// The maximum available value for the survey.
    public let maximumValue: Int
    /// An identifier to use to style the progress view according to the value.
    public let identifierVariant: String?

    /// Creates a new `NPSScore`.
    /// - Parameters:
    ///   - value: The value given to this NPS by the client.
    ///   - maximumValue: The maximum available value for the survey.
    ///   - identifierVariant: An identifier to use to style the progress view according to the value.
    public init(value: Int, maximumValue: Int, identifierVariant: String? = nil) {
        self.value = value
        self.maximumValue = maximumValue
        self.identifierVariant = identifierVariant
    }
}

extension NPSScore {
    var displayableValue: String {
        String(format: Progress.Labels.scoreFormat, "\(self.value)", "\(self.maximumValue)")
    }
}
