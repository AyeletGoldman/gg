// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI

public extension GFField {

    /// Creates a new read-only field that displays the value for a field alongside a tag for indicating what operation was applied to that field
    /// - Parameters:
    ///   - title: the title of the field that was changed
    ///   - value: the value to display on the field. If the operation is to add or edit, this should be the new value, if it is to remove, it should be the old value.
    ///   - operation: the operation that is to be performed on the client data
    /// - Returns: A new `GFField` that will show the data being changed and what the change is.
    static func editedField(title: String, value: String, operation: EditedFieldOperation) -> GFField {
        return GFField { _, _ in
            return GFEditedFieldView(value: value, operation: operation, config: GFFieldConfiguration(title: title, isReadOnly: true))
        }
    }
}
