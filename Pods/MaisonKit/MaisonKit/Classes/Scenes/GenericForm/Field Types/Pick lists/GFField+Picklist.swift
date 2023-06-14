// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension GFField {

    /// Creates generic form single selection field with loading options status.
    /// If the number of items in the `items` array is more than the `maxNumberOfItems`, the selection is done in a different screen
    /// if it is equal or less, the selection is inline.
    /// - Parameters:
    ///   - maxNumberOfItems: The maximum number of items in the selection that will enable an inline pick list
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show
    ///   - items: The picklist options to show when tapping on the field
    ///   - validator: An optional validation to know whether the filed is valid
    ///   - editMode: The field edit mode
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: a `GFField` configured for an inline single selection.
    static func bestFitSingleSelection(maxNumberOfItems: Int = 4,
                                       title: String,
                                       placeHolder: String = "",
                                       items: [SelectionListItem],
                                       validator: Validation<SelectionListItem?>? = nil,
                                       editMode: GFFieldEditMode = .editable,
                                       keyPath: WritableKeyPath<Object, SelectionListItem?>) -> GFField {
        if items.count > maxNumberOfItems {
            return Self.singleSelection(title: title,
                                        placeHolder: placeHolder,
                                        items: .found(items),
                                        validator: validator,
                                        editMode: editMode,
                                        keyPath: keyPath)
        } else {
            return Self.inlineSingleSelection(title: title,
                                              placeHolder: placeHolder,
                                              items: .found(items),
                                              validator: validator,
                                              editMode: editMode,
                                              keyPath: keyPath)
        }
    }

    /// Creates generic form multiple selection field
    /// If the number of items in the `items` array is more than the `maxNumberOfItems`, the selection is done in a different screen
    /// if it is equal or less, the selection is inline.
    /// - Parameters:
    ///   - maxNumberOfItems: The maximum number of items in the selection that will enable an inline pick list
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show
    ///   - items: The picklist options to show when tapping on the field
    ///   - validator: An optional validation to know whether the filed is valid
    ///   - editMode: The field edit mode
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: Generic form field with the multiple selection configuration
    static func bestFitMultipleSelection(maxNumberOfItems: Int = 4,
                                         title: String,
                                         placeHolder: String = "",
                                         items: [SelectionListItem],
                                         validator: Validation<[SelectionListItem]>? = nil,
                                         editMode: GFFieldEditMode = .editable,
                                         keyPath: WritableKeyPath<Object, [SelectionListItem]>) -> GFField {
        if items.count > maxNumberOfItems {
            return Self.multipleSelection(title: title,
                                          placeHolder: placeHolder,
                                          items: .found(items),
                                          validator: validator,
                                          editMode: editMode,
                                          keyPath: keyPath)
        } else {
            return Self.inlineMultipleSelection(title: title,
                                                placeHolder: placeHolder,
                                                items: items,
                                                validator: validator,
                                                editMode: editMode,
                                                keyPath: keyPath)
        }
    }
}
