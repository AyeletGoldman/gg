// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The generic field edition mode
public enum GFFieldEditMode {
    /// Editable mode, the regular edit status
    case editable
    /// Disabled mode, for disable a field that could be also for edit
    case disabled
    /// Locked mode, for a field that should be locked all the time inside an editable form
    case locked
}

/// Generic form field configuration
public struct GFFieldConfiguration {

    private enum Labels {
        static let readonlyFieldPlaceholder = MKLocalizedString("generic-form.field.readonly.placeholder",
                                                                comment: "The placeholder for a field in generic form with readonly status")
    }

    /// The field title
    public let title: String
    /// Whether to show a required symbol or not
    public let showRequiredSymbol: Bool
    /// The field placeholder
    public let placeholder: String
    /// The field edit mode
    public let editMode: GFFieldEditMode
    /// Whether the field should be only for read
    public let isReadOnly: Bool

    /// Creates new instanse of `GFFieldConfiguration`
    /// - Parameters:
    ///   - title: The field title
    ///   - placeholder: The field placeholder
    ///   - showRequiredSymbol: Whether to show a required symbol or not
    ///   - editMode: The field edit mode
    ///   - isReadOnly: Whether the field should be only for read
    public init(title: String,
                placeholder: String = "",
                showRequiredSymbol: Bool = false,
                editMode: GFFieldEditMode = .editable,
                isReadOnly: Bool) {
        self.title = title
        self.placeholder = isReadOnly ? Labels.readonlyFieldPlaceholder : placeholder
        self.showRequiredSymbol = isReadOnly ? false : showRequiredSymbol
        self.editMode = editMode
        self.isReadOnly = isReadOnly
    }
}

public extension GFFieldConfiguration {
    /// A calculation whether the field should be editable or not
    var isEditable: Bool {
        return !self.isReadOnly && self.editMode == .editable
    }

    /// Calculate the field variant for "input" stylist identifier
    /// - Parameters:
    ///   - isEmpty: whether the field is empty or not
    ///   - hasError: whether the field has an error or not
    /// - Returns: an input variant to specify the variant to be used in the stylist for this field.
    func getInputVariant(isEmpty: Bool, hasError: Bool = false) -> GFInputVariant? {
        guard !self.isReadOnly else {
            return nil
        }
        switch self.editMode {
        case .disabled:
            return .disabled
        default:
            return hasError ? .error : (isEmpty ? .blurred : nil)
        }
    }
}

// MARK: - View-level configuration options
public extension GFFieldConfiguration {
    /// A calculation whether to show the lock icon or not
    var shouldShowLockIcon: Bool {
        guard !self.isReadOnly else { return false }
        return self.editMode == .locked
    }

    /// A calculation whether to show the disclosure indicator or not
    var shouldShowDisclosureIndicator: Bool {
        guard !self.isReadOnly else { return false }
        return self.isEditable
    }
}

extension ResultState {
    func getFieldEditMode(editMode: GFFieldEditMode) -> GFFieldEditMode {
        if editMode == .editable && self.isWaiting {
            return .disabled
        } else {
            return editMode
        }
    }
}
