// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

public extension GFField {

    /// A field that shows the values of a `TypedField`. This is a read-only field that displays the value of the given `TypedField`'s `value`'s `toString()` method.
    /// - Parameter field: The typed field to display
    /// - Returns: A `GFField` that shows the value of the given `TypedField`.
    static func typedField(_ field: TypedField) -> GFField {
        return GFField { _, _ in
            return GFTypedFieldView(field: field, config: GFFieldConfiguration(title: field.title, isReadOnly: true))
        }
    }
}

public extension FormSection {

    /// Creates a new `FormSection`
    /// - Parameters:
    ///   - title: Optional. A title to display above the fields in the section. Defaults to `nil`.
    ///   - fields: `TypedField` items for building the section with an array of `GFField.typedField`.
    ///   If this property is empty (`[]`), the whole section will be hidden.
    init(title: String? = nil, fields: [TypedField]) {
        self.init(title: title,
                  fields: fields.map { .typedField($0) })
    }
}
