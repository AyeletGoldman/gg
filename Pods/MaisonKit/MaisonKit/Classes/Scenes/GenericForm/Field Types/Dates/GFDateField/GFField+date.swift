// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

public extension GFField {

    /// Creates generic form date field
    /// - Parameters:
    ///   - title: The field title
    ///   - validator: An optional validation to know whether the filed is valid
    ///   - formatter: Optional. The date formatter to define the string format and the date picker timezone. by default will be the default UTC formatter ("December 31, 1999").
    ///   - editMode: The field edit mode
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: A `GFField` instance configured for displaying and selecting dates
    static func date(title: String,
                     validator: Validation<Date?>? = nil,
                     formatter: DateFormatter = .defaultUTC,
                     editMode: GFFieldEditMode = .editable,
                     keyPath: WritableKeyPath<Object, Date?>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { object, isReadOnly in
            return GFDateFieldView(value: object[dynamicMember: keyPath],
                                   pickerComponent: .date,
                                   formatter: formatter,
                                   config: GFFieldConfiguration(title: title,
                                                                showRequiredSymbol: validator?.showIndicator ?? false,
                                                                editMode: editMode,
                                                                isReadOnly: isReadOnly))
        }
    }

    /// Creates generic form time field
    /// - Parameters:
    ///   - title: The field title
    ///   - validator: An optional validation to know whether the filed is valid
    ///   - formatter: Optional. The date formatter to define the string format and the date picker timezone. by default will be the default UTC formatter ("December 31, 1999").
    ///   - editMode: The field edit mode
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: A `GFField` instance configured for displaying and selecting dates
    static func time(title: String,
                     validator: Validation<Date?>? = nil,
                     formatter: DateFormatter = .timeOnlyFormatter,
                     editMode: GFFieldEditMode = .editable,
                     keyPath: WritableKeyPath<Object, Date?>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { object, isReadOnly in
            return GFDateFieldView(value: object[dynamicMember: keyPath],
                                   pickerComponent: .hourAndMinute,
                                   formatter: formatter,
                                   config: GFFieldConfiguration(title: title,
                                                                showRequiredSymbol: validator?.showIndicator ?? false,
                                                                editMode: editMode,
                                                                isReadOnly: isReadOnly))
        }
    }
}

public extension Validation where T == Date? {
    /// Date field required validation
    static let required = Validation(closure: { $0 != nil }, showIndicator: true)
}
