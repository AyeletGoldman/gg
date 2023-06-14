// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension GFField {

    /// Creates generic form text area
    /// - Parameters:
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show
    ///   - validator: An optional validation to know whether the filed is valid
    ///   - editMode: The field edit mode
    ///   - minimumHeight: A value to set for minimum height of the text area. Defaults to `0`.
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: A new `GFField` configured to show a multi-line text area.
    static func textArea(title: String,
                         placeHolder: String = "",
                         validator: Validation<String>? = nil,
                         editMode: GFFieldEditMode = .editable,
                         minimumHeight: Double = 0,
                         keyPath: WritableKeyPath<Object, String>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { object, isReadOnly in
            return GFTextAreaFieldView(value: object[dynamicMember: keyPath],
                                       config: GFFieldConfiguration(title: title,
                                                                    placeholder: placeHolder,
                                                                    showRequiredSymbol: validator?.showIndicator ?? false,
                                                                    editMode: editMode,
                                                                    isReadOnly: isReadOnly),
                                       minimumHeight: minimumHeight)
        }
    }

    /// Creates generic form text area
    /// - Parameters:
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show
    ///   - required: Whether the field value could be empty or not.
    ///   - editMode: The field edit mode
    ///   - minimumHeight: A value to set for minimum height of the text area. Defaults to `0`.
    ///   - maximumCharacters: Optional. Limit the length of the text in this field by this value.
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: A new `GFField` configured to show a multi-line text area.
    static func textArea(title: String,
                         placeHolder: String = "",
                         required: Bool = false,
                         editMode: GFFieldEditMode = .editable,
                         minimumHeight: Double = 0,
                         maximumCharacters: Int? = nil,
                         keyPath: WritableKeyPath<Object, String>) -> GFField {
        let validator: Validation<String>? = maximumCharacters.map { .maximumCharacters($0, required: required) }
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { object, isReadOnly in
            return GFTextAreaFieldView(value: object[dynamicMember: keyPath],
                                       config: GFFieldConfiguration(title: title,
                                                                    placeholder: placeHolder,
                                                                    showRequiredSymbol: required,
                                                                    editMode: editMode,
                                                                    isReadOnly: isReadOnly),
                                       minimumHeight: minimumHeight,
                                       maximumCharacters: maximumCharacters)
        }
    }
}
