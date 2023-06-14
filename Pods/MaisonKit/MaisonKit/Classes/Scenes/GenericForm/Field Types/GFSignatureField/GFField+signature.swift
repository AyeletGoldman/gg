// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

public extension GFField {

    /// Creates generic form signature field
    /// - Parameters:
    ///   - title: The field title
    ///   - validator: An optional validation to know whether the field is valid
    ///   - editMode: The field edit mode
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: a `GFField` configured for free-text entry
    static func signature(title: String = MKLocalizedString("form.signature.title", comment: "The title of the signature form"),
                          validator: Validation<UIImage?>? = nil,
                          editMode: GFFieldEditMode = .editable,
                          keyPath: WritableKeyPath<Object, UIImage?>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure, makeBody: { object, isReadOnly in
            let config = GFFieldConfiguration(title: title, editMode: editMode, isReadOnly: isReadOnly)
            return GFSignatureFieldView(config: config, signatureImage: object[dynamicMember: keyPath])
        })
    }
}

public extension Validation where T == UIImage? {
    /// UIImage field required validation
    static let required = Validation(closure: { $0 != nil }, showIndicator: true)
}
