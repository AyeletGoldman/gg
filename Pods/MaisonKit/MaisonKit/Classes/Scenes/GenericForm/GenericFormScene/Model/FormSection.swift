// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A section for a form in the  generic form.
/// Sections are used to divide different parts of a form, and can have a title above the fields in that section.
public struct FormSection<Object> {

    /// Optional. A title to display above the fields in the section.
    public let title: String?
    /// The fields that make up this section.
    /// If this property is empty (`[]`), the whole section will be hidden.
    public let fields: [GFField<Object>]

    /// Creates a new `FormSection`
    /// - Parameters:
    ///   - title: Optional. A title to display above the fields in the section. Defaults to `nil`.
    ///   - fields: The fields that make up this section.
    ///   If this property is empty (`[]`), the whole section will be hidden.
    public init(title: String? = nil, fields: [GFField<Object>]) {
        self.title = title
        self.fields = fields
    }
}
