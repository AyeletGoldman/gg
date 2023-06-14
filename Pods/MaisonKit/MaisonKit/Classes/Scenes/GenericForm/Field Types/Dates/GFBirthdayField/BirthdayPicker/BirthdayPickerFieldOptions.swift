// Copyright © 2022 LVMH. All rights reserved.

import Foundation

struct BirthdayPickerFieldOptions {

    struct LabelValue {
        let label: String
        let value: Int
    }

    struct LabelOptionalValue {
        let label: String
        let value: Int?
    }

    private static let repeatItemsCount = 100

    static var middleDaysIndex: Int = {
        let daysCount = Calendar.gregorian.maximumRange(of: .day).map { $0.upperBound - 1 } ?? 31
        return (BirthdayPickerFieldOptions.repeatItemsCount * daysCount) / 2
    }()

    static var middleMonthsIndex: Int = {
        let monthsCount = Calendar.gregorian.maximumRange(of: .month).map { $0.upperBound - 1 } ?? 12
        return (BirthdayPickerFieldOptions.repeatItemsCount * monthsCount) / 2
    }()

    static let days: [LabelValue] = Array(1...31)
        .map { LabelValue(label: "\($0)", value: $0) }
        .repeated(count: BirthdayPickerFieldOptions.repeatItemsCount)

    static let months: [LabelValue] =  Array(1...12)
        .map { LabelValue(label: Calendar.gregorian.monthSymbols[$0 - 1], value: $0) }
        .repeated(count: BirthdayPickerFieldOptions.repeatItemsCount)

    static var years: [LabelOptionalValue] = {
        let currentYear = Calendar.gregorian.component(.year, from: Date())
        let initialYear = currentYear-120
        var arr = Array(initialYear...currentYear).map { LabelOptionalValue(label: "\($0)", value: $0) }
        arr.append(LabelOptionalValue(label: "----", value: nil))
        return arr
    }()
}

private extension Array {
    func repeated(count: Int) -> [Element] {
        assert(count > 0, "count must be greater than 0")
        return Array<[Element]>(repeating: self, count: count).flatMap { $0 }
    }
}
