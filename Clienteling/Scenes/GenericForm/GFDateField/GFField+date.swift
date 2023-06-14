// Zenith Clienteling
// 23/01/2022

import SwiftUI
import MaisonKit
import Combine

public extension GFField {
    static func dateCalendar(title: String,
                             placeHolder: String = "",
                             shouldDisableDate: ((Date) -> Bool)? = nil,
                             validator: Validation<Date?>? = nil,
                             editMode: GFFieldEditMode = .editable,
                             keyPath: WritableKeyPath<Object, Date?>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { object, isReadOnly in
            return GFDateFieldView(selectedDate: object[dynamicMember: keyPath],
                                   config: GFFieldConfiguration(title: title,
                                                                placeholder: placeHolder,
                                                                showRequiredSymbol: validator?.showIndicator ?? false,
                                                                editMode: editMode,
                                                                isReadOnly: isReadOnly),
                                   shouldDisableDate: shouldDisableDate)
        }
    }
}

public extension Validation where T == Date? {
    /// date field required validation
    static let required = Validation(closure: { item in return item != nil },
                                     showIndicator: true)
}
