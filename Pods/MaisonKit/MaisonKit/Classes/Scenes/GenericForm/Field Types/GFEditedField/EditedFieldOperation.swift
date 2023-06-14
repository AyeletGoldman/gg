// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// An operation that is performed on a field in a form.
public enum EditedFieldOperation {

    private enum Labels {
        static let addedLabel = MKLocalizedString("forms.edited-field.added-badge.title",
                                                  comment: "The title of the badge for an edited field where a value was added")
        static let removedLabel = MKLocalizedString("forms.edited-field.removed-badge.title",
                                                    comment: "The title of the badge for an edited field where a value was removed")
        static let updatedLabel = MKLocalizedString("forms.edited-field.updated-badge.title",
                                                    comment: "The title of the badge for an edited field where a value was updated")
    }

    /// When a field is added, e.g. when the value was an empty string or `nil` before.
    case added
    /// When a field is removed, e.g. the value was there before and it is now `nil`.
    case removed
    /// When a field is updated, e.g. its value changed.
    case updated
}

extension EditedFieldOperation {
    var stylistVariant: String {
        switch self {
        case .added:
            return "add"
        case .removed:
            return "delete"
        case .updated:
            return "update"
        }
    }

    var title: String {
        switch self {
        case .added:
            return Labels.addedLabel
        case .removed:
            return Labels.removedLabel
        case .updated:
            return Labels.updatedLabel
        }
    }
}
