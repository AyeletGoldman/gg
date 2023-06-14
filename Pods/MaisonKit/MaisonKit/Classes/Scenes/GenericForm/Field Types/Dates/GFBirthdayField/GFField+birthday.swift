// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

public extension GFField {
    /// Creates generic form birthday field. The birthday picker support only the Gregorian calendar.
    /// - Parameters:
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show
    ///   - validator: An optional validation to know whether the filed is valid
    ///   - editMode: The field edit mode
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: a `GFField` configured for display and editing of a birthday field.
    static func birthday(title: String,
                         placeHolder: String = "",
                         validator: Validation<Birthday?>? = nil,
                         editMode: GFFieldEditMode = .editable,
                         keyPath: WritableKeyPath<Object, Birthday?>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { object, isReadOnly in
            return GFBirthdayFieldView(value: object[dynamicMember: keyPath],
                                       config: GFFieldConfiguration(title: title,
                                                                    placeholder: placeHolder,
                                                                    showRequiredSymbol: validator?.showIndicator ?? false,
                                                                    editMode: editMode,
                                                                    isReadOnly: isReadOnly))
        }
    }
}

public extension Validation where T == Birthday? {
    /// Birthday field required validation
    static let required = Validation(closure: { $0 != nil }, showIndicator: true)
}
