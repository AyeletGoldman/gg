// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// Failed loading picklist options status with retry action to try loading the items again
public struct PicklistOptionsStatusError: Error {

    enum Labels {
        static let defaultErrorDescription = MKLocalizedString("generic-form.field.picklist.options.error.title",
                                                               comment: "Title error title for picklist options")
    }

    /// The retry action in case of failed status
    public let action: () -> Void
    /// The localized error to show in the picklist field instead of the value in case of an error
    public let errorDescription: String

    /// Creates a new `PicklistOptionsStatusError`
    /// - Parameters:
    ///   - action: The retry action in case of failed status
    ///   - errorDescription: The localized error to show in the picklist field instead of the value in case of an error. Defaults to `nil`.
    ///     If no value is passed, the error displayed is a generic error message defined by the translation value for `generic-form.field.picklist.options.error.title`.
    public init(action: @escaping () -> Void, errorDescription: String? = nil) {
        self.action = action
        self.errorDescription = errorDescription ?? Labels.defaultErrorDescription
    }
}

/// The picklist options status in multiple selection and single selection in generic form fields
/// `.waiting`: picklist options data is not initialised yet. the field is disabled and grayed out.
/// `.loading`: picklist options data is loading. the field is disabled with an enabled design + an animated spinner in the trailing corner.
/// `.found`: picklist options data is available. the field is enabled for editing.
/// `.error`: failed to load slots data. the field has an error design + error message instead of the value + retry button.
public typealias PicklistOptionsStatus = ResultState<[SelectionListItem], PicklistOptionsStatusError>

public extension PicklistOptionsStatus {

    /// The retry action in case of failed status
    var retryAction: (() -> Void)? {
        if case .failed(let error) = self {
            return error.action
        } else {
            return nil
        }
    }

    /// The error description in case of failed status
    var errorDescription: String? {
        if case .failed(let error) = self {
            return error.errorDescription
        } else {
            return nil
        }
    }

}
