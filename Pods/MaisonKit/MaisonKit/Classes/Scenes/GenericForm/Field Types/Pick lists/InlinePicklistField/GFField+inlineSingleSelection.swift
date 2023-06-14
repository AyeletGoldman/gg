// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

public extension GFField {

    /// Creates generic form inline single selection field with loading options status
    /// - Parameters:
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show
    ///   - items: The picklist options to show when tapping on the field
    ///   - validator: An optional validation to know whether the filed is valid
    ///   - editMode: The field edit mode
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: a `GFField` configured for an inline single selection.
    static func inlineSingleSelection(title: String,
                                      placeHolder: String = "",
                                      items: PicklistOptionsStatus,
                                      validator: Validation<SelectionListItem?>? = nil,
                                      editMode: GFFieldEditMode = .editable,
                                      keyPath: WritableKeyPath<Object, SelectionListItem?>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { (object, isReadOnly) -> GFInlinePicklistFieldView in
            return GFInlinePicklistFieldView(config: GFFieldConfiguration(title: title,
                                                                          placeholder: placeHolder,
                                                                          showRequiredSymbol: validator?.showIndicator ?? false,
                                                                          editMode: items.getFieldEditMode(editMode: editMode),
                                                                          isReadOnly: isReadOnly),
                                             value: object[dynamicMember: keyPath],
                                             items: items)
        }
    }

    /// Creates generic form inline single selection field
    /// - Parameters:
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show
    ///   - items: The picklist options to show when tapping on the field
    ///   - validator: An optional validation to know whether the filed is valid
    ///   - editMode: The field edit mode
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: a `GFField` configured for an inline single selection.
    static func inlineSingleSelection(title: String,
                                      placeHolder: String = "",
                                      items: [SelectionListItem],
                                      validator: Validation<SelectionListItem?>? = nil,
                                      editMode: GFFieldEditMode = .editable,
                                      keyPath: WritableKeyPath<Object, SelectionListItem?>) -> GFField {
        return Self.inlineSingleSelection(title: title,
                                          placeHolder: placeHolder,
                                          items: .found(items),
                                          validator: validator,
                                          editMode: editMode,
                                          keyPath: keyPath)
    }
}
