// Copyright © 2023 LVMH. All rights reserved.

import Foundation

enum BirthdayPickerField {
    case day
    case month
    case year
}

extension BirthdayPickerField {
    static let fields = getFieldsOrder()

    private static func getFieldsOrder() -> [BirthdayPickerField] {
        guard let format = DateFormatter.dateFormat(fromTemplate: "ddMMYYYY", options: 0, locale: Locale.current) else { return [] }

        guard let yearIndex = format.range(of: "YYYY")?.lowerBound,
              let monthIndex = format.range(of: "MM")?.lowerBound,
              let dayIndex = format.range(of: "dd")?.lowerBound else {
            return []
        }
        let fields = [(index: dayIndex, field: BirthdayPickerField.day),
                      (index: monthIndex, field: BirthdayPickerField.month),
                      (index: yearIndex, field: BirthdayPickerField.year)]
            .sorted { $0.index < $1.index }
            .map(\.field)
        return fields
    }
}

extension BirthdayPickerField {
    func getLabelOptions() -> [String] {
        switch self {
        case .day:
            return BirthdayPickerFieldOptions.days.map { $0.label }
        case .month:
            return BirthdayPickerFieldOptions.months.map { $0.label }
        case .year:
            return BirthdayPickerFieldOptions.years.map { $0.label }
        }
    }

    func getPickerIndex(birthday: Birthday) -> Int {
        switch self {
        case .day:
            return (birthday.day - 1) + BirthdayPickerFieldOptions.middleDaysIndex
        case .month:
            return (birthday.month - 1) + BirthdayPickerFieldOptions.middleMonthsIndex
        case .year:
            let selectedYearIndex = BirthdayPickerFieldOptions.years.enumerated()
                .first { $1.value == birthday.year }
                .map(\.offset)
            return selectedYearIndex ?? (BirthdayPickerFieldOptions.years.count - 1)
        }
    }

    func getFieldValue(birthday: Birthday) -> Int? {
        switch self {
        case .day:
            return birthday.day
        case .month:
            return birthday.month
        case .year:
            return birthday.year
        }
    }

    func getFieldValue(pickerIndex: Int) -> Int? {
        switch self {
        case .day:
            return BirthdayPickerFieldOptions.days[pickerIndex].value
        case .month:
            return BirthdayPickerFieldOptions.months[pickerIndex].value
        case .year:
            return BirthdayPickerFieldOptions.years[pickerIndex].value
        }
    }

    func getFieldIndex() -> Int {
        Self.fields.enumerated().first { $1 == self }.map(\.offset) ?? 0
    }
}
