// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// A section for a form in the  generic form.
/// Should be in use for read only form and parse a list of `TypedField` to a list of generic form fields.
/// Sections are used to divide different parts of a form, and can have a title above the fields in that section.
public struct FormTypedFieldSection {
    /// Optional. The title for this section. This will be shown above the fields.
    public let title: String?

    /// The set of fields to be displayed in the section.
    public let fields: [TypedField]

    /// Creates a new `FormTypedFieldSection `
   /// - Parameters:
   ///   - title: Optional. The title for this section. This will be shown above the fields. Defaults to `nil`.
   ///   - fields: The set of fields to be displayed in the section.
    public init(title: String? = nil, fields: [TypedField]) {
        self.title = title
        self.fields = fields
    }
}
