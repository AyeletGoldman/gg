// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

public extension GFField {

    /// Creates generic form date and slot selection field with loading options status
    /// - Parameters:
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show. Defaults to an empty string (`""`).
    ///   - availableSlotsStatus: The available slots with result status
    ///   - validator: An optional validation to know whether the filed is valid. Defaults to `nil`.
    ///   - editMode: The field edit mode. Defaults to `.editable`.
    ///   - dateFormatter: A date formatter to format the date for display when it is selected. Defaults to an instance of `DateAndSlotFormatter`.
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: A `GFField` configured to show a date and time-slot user interface. Useful for selecting appointments.
    static func dateAndSlot(title: String,
                            placeHolder: String = "",
                            availableSlotsStatus: AvailableSlotsStatus,
                            validator: Validation<DateAndSlot?>? = nil,
                            editMode: GFFieldEditMode = .editable,
                            dateFormatter: Formatter = DateAndSlotFormatter(),
                            keyPath: WritableKeyPath<Object, DateAndSlot?>) -> GFField {
        let validationClosure = Self.buildValidationClosure(for: validator, keyPath: keyPath)
        return GFField(validationClosure: validationClosure) { (object, isReadOnly, onPresentScene: @escaping ((CalendarAndSlotsScene) -> Void)) -> GFDateAndSlotsFieldView in
            return GFDateAndSlotsFieldView(
                config: GFFieldConfiguration(title: title,
                                             placeholder: placeHolder,
                                             showRequiredSymbol: validator?.showIndicator ?? false,
                                             editMode: editMode,
                                             isReadOnly: isReadOnly),
                value: object.wrappedValue[keyPath: keyPath],
                formatter: dateFormatter,
                availableSlotsStatus: availableSlotsStatus,
                presentCalendarAndSlots: {
                    if case .found(let availableSlotsData) = availableSlotsStatus {
                        let scene = Self.getCalendarAndSlotsScene(title: title,
                                                                  selectedDateAndSlot: object[dynamicMember: keyPath],
                                                                  availableSlotsClosure: availableSlotsData.availableSlotsClosure,
                                                                  shouldDisableDate: availableSlotsData.shouldDisableDate)
                        onPresentScene(scene)
                    }
                })
        }
    }

    /// Creates generic form date and slot selection field
    /// - Parameters:
    ///   - title: The field title
    ///   - placeHolder: The placeholder to show. Defaults to an empty string (`""`).
    ///   - availableSlotsClosure: A closure to define the available slots by the selected date
    ///   - shouldDisableDate: An optional closure to define the dates to disable. Defaults to `nil`.
    ///   - validator: An optional validation to know whether the filed is valid. Defaults to `nil`.
    ///   - editMode: The field edit mode. Defaults to `.editable`.
    ///   - dateFormatter: A date formatter to format the date for display when it is selected. Defaults to an instance of `DateAndSlotFormatter`.
    ///   - keyPath: The data object key path the field value should be taken from
    /// - Returns: A `GFField` configured to show a date and time-slot user interface. Useful for selecting appointments.
    static func dateAndSlot(title: String,
                            placeHolder: String = "",
                            availableSlotsClosure: @escaping (Date) -> [CalendarSlot],
                            shouldDisableDate: ((Date) -> Bool)? = nil,
                            validator: Validation<DateAndSlot?>? = nil,
                            editMode: GFFieldEditMode = .editable,
                            dateFormatter: Formatter = DateAndSlotFormatter(),
                            keyPath: WritableKeyPath<Object, DateAndSlot?>) -> GFField {
        return Self.dateAndSlot(title: title,
                                placeHolder: placeHolder,
                                availableSlotsStatus: .found(AvailableSlotsData(availableSlotsClosure: availableSlotsClosure,
                                                                                 shouldDisableDate: shouldDisableDate)),
                                validator: validator,
                                editMode: editMode,
                                dateFormatter: dateFormatter,
                                keyPath: keyPath)
    }

    private static func getCalendarAndSlotsScene(title: String,
                                                 selectedDateAndSlot: Binding<DateAndSlot?>,
                                                 availableSlotsClosure: @escaping (Date) -> [CalendarSlot],
                                                 shouldDisableDate: ((Date) -> Bool)?) -> CalendarAndSlotsScene {
        return CalendarAndSlotsScene(
            selectedDateAndSlot: selectedDateAndSlot.wrappedValue,
            pageTitle: title,
            getAvailableSlots: availableSlotsClosure,
            shouldDisableDate: shouldDisableDate,
            onDismiss: { controllerToDismiss in
                controllerToDismiss.dismiss(animated: true, completion: nil)
            },
            onDone: { selection, controllerToDismiss in
                selectedDateAndSlot.wrappedValue = selection
                controllerToDismiss.dismiss(animated: true, completion: nil)
            })
    }
}

public extension Validation where T == DateAndSlot? {
    /// Date and slot selection field required validation
    static let required = Validation(closure: { item in return item != nil },
                                     showIndicator: true)
}
