//
//  GFField+text.swift
//  Zenith Clienteling
//

import SwiftUI
import MaisonKit

public extension GFField {
    
    static func textWithCopy(title: String,
                             placeHolder: String = "",
                             validator: Validation<String>? = nil,
                             editMode: GFFieldEditMode = .editable,
                             isCopyable: Bool,
                             keyPath: WritableKeyPath<Object, String>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { object, isReadOnly in
            return GFTextWithCopyFieldView(value: object[dynamicMember: keyPath],
                                           config: GFFieldConfiguration(title: title,
                                                                        placeholder: placeHolder,
                                                                        showRequiredSymbol: validator?.showIndicator ?? false,
                                                                        editMode: editMode,
                                                                        isReadOnly: isReadOnly),
                                           isCopyable: isCopyable)
        }
    }
    
    static func textAreaWithCopy(title: String,
                                 placeHolder: String = "",
                                 validator: Validation<String>? = nil,
                                 editMode: GFFieldEditMode = .editable,
                                 isCopyable: Bool,
                                 keyPath: WritableKeyPath<Object, String>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { object, isReadOnly in
            GFTextAreaFieldWithCopyView(value: object[dynamicMember: keyPath],
                                        config: GFFieldConfiguration(title: title,
                                                                     placeholder: placeHolder,
                                                                     showRequiredSymbol: validator?.showIndicator ?? false,
                                                                     editMode: editMode,
                                                                     isReadOnly: isReadOnly),
                                        isCopyable: isCopyable)
        }
    }
}
