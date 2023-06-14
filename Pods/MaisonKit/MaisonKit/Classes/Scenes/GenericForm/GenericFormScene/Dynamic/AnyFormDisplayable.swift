// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A model representing a dynamic form with sections and data
public struct AnyFormDisplayable {
    /// The sections for the form that will be shown
    public let sections: [FormSection<AnyFormData>]
    /// The data the form should be pre-populated with, if any
    public let data: AnyFormData

    /// Creates a new `AnyFormDisplayable` with the given sections and initial data
    /// - Parameters:
    ///   - sections: The sections for the form that will be shown
    ///   - data: The data the form should be pre-populated with, if any
    public init(sections: [FormSection<AnyFormData>], data: AnyFormData = AnyFormData(data: [:])) {
        self.sections = sections
        self.data = data
    }
}
