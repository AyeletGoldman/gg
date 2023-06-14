// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

public extension GFField {

    /// Creates generic form text field
    /// - Parameters:
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show
    ///   - validator: An optional validation to know whether the field is valid
    ///   - editMode: The field edit mode
    ///   - keyboardType: The keyboard type of the field
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: a `GFField` configured for free-text entry
    static func text(title: String,
                     placeHolder: String = "",
                     validator: Validation<String>? = nil,
                     editMode: GFFieldEditMode = .editable,
                     keyboardType: UIKeyboardType = .default,
                     keyPath: WritableKeyPath<Object, String>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { object, isReadOnly in
            return GFTextFieldView(value: object[dynamicMember: keyPath],
                                   config: GFFieldConfiguration(title: title,
                                                                placeholder: placeHolder,
                                                                showRequiredSymbol: validator?.showIndicator ?? false,
                                                                editMode: editMode,
                                                                isReadOnly: isReadOnly),
                                   keyboardType: keyboardType)
        }
    }
}

public extension Validation where T == String {
    /// Text field required validation
    static let required = Validation(closure: { text in return !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty },
                                     showIndicator: true)

    /// Text field minimum characters validation. Use this to create a validation rule that requires `numberOfCharacters` to consider a value valid.
    /// - Parameter numberOfCharacters: the number of characters to use as a minimum for considering a value valid.
    /// - Returns: a `Validation` object configured with the minimum number of characters validation
    static func minimumCharacters(_ numberOfCharacters: Int) -> Validation<String> {
        return Validation(closure: { string in return string.count >= numberOfCharacters },
                          showIndicator: true)
    }

    /// Text field maximum characters validation. Use this to create a validation rule that requires `numberOfCharacters` to consider a value valid.
    /// - Parameter numberOfCharacters: the number of characters to use as a maximum for considering a value valid.
    /// - Parameter required: whether the value could be empty or not.
    /// - Returns: a `Validation` object configured with the maximum number of characters validation
    static func maximumCharacters(_ numberOfCharacters: Int, required: Bool) -> Validation<String> {
        return Validation(closure: { string in return string.isEmpty ? !required : string.count <= numberOfCharacters },
                          showIndicator: required)
    }
}
