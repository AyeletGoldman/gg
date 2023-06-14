// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// The information about a field that has been edited. Contains the operation that was performed, the title of the field and the value of the editing.
public struct EditedField {

    /// The type of operation that was performed: adding, updating or deleting.
    public let operation: EditedFieldOperation
    /// The title of the field, this is used to display as a header for each field
    public let title: String
    /// The value to display. Depending on whether the operation is add, delete or edit you may want to use the current value or the old value.
    /// The recommendation is to use the new value for adding and editing, and the old value for deleting.
    public let value: String

    /// Creates a new `EditedField`
    /// - Parameters:
    ///   - operation: The type of operation that was performed: adding, updating or deleting.
    ///   - title: The title of the field, this is used to display as a header for each field
    ///   - value: The value to display. Depending on whether the operation is add, delete or edit you may want to use the current value or the old value.
    ///   The recommendation is to use the new value for adding and editing, and the old value for deleting.
    public init(operation: EditedFieldOperation, title: String, value: String) {
        self.operation = operation
        self.title = title
        self.value = value
    }
}
