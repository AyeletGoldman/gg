// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

public extension GFField {

    /// Creates a new field that displays a toggle interface.
    /// - Parameters:
    ///   - title: The title to use for the toggle; this will be shown in the trailing edge of the field.
    ///   - editMode: Whether this field is editable or not.
    ///   - keyPath: The keypath this field should bind to.
    /// - Returns: A new `GFField` that models a toggle interface to control a boolean value.
    static func toggle(title: String,
                       editMode: GFFieldEditMode = .editable,
                       keyPath: WritableKeyPath<Object, Bool>) -> GFField {
        return GFField { (object, isReadOnly) -> GFToggleFieldView in
            return GFToggleFieldView(value: object[dynamicMember: keyPath],
                                     config: GFFieldConfiguration(title: title,
                                                                  showRequiredSymbol: false,
                                                                  editMode: editMode,
                                                                  isReadOnly: isReadOnly))
        }
    }
}
