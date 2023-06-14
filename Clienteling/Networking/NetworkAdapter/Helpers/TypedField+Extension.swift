// Copyright © 2022 LVMH. All rights reserved.

import MaisonKit
import StylableSwiftUI

struct CurrencyFormatterFactory {
    let factory: ((String) -> NumberFormatter)
}

extension CurrencyFormatterFactory {
    static let short: CurrencyFormatterFactory = {
        return CurrencyFormatterFactory(factory: {
            return NumberFormatter.shortCurrencyFormatter(locale: .autoupdatingCurrent, currencyCode: $0)
        })
    }()
}

extension CurrencyFormatterFactory {
    static func short(withPercision percision: UInt8? = nil) -> CurrencyFormatterFactory {
        if let percision {
            return CurrencyFormatterFactory {
                ShortCurrencyNumberFormatterCustom(currencyCode: $0, locale: .autoupdatingCurrent, maxPrecision: percision)
            }
        }
        return .short
    }
}

extension CurrencyFormatterFactory {
    static let `default`: CurrencyFormatterFactory = {
        return CurrencyFormatterFactory(factory: {
            return NumberFormatter.currencyFormatter(locale: .autoupdatingCurrent, currencyCode: $0)
        })
    }()
}

// MARK: - TypedField
extension TypedField {
    init(from typedValue: TypedValue, dateFormatter: DateFormatter? = nil, currencyFormatter: CurrencyFormatterFactory? = nil, icon: StylistIdentifier? = nil) {
        let valueParser = MaisonKit.TypedValue(from: typedValue, dateFormatter: dateFormatter, currencyFormatter: currencyFormatter)
        self = .init(id: typedValue.apiName,
                     title: MKLocalizedString(typedValue.translationKey ?? "", comment: "The translation for this typed field's title"),
                     value: valueParser,
                     isCopyable: typedValue.isCopyable,
                     icon: icon)
    }
}

// MARK: - TypedValue
extension MaisonKit.TypedValue {
    init(from typedValue: TypedValue, dateFormatter: DateFormatter? = nil, currencyFormatter: CurrencyFormatterFactory? = nil) {
        switch typedValue {
        case .typedValueBoolean(let val):
            self = .text(lines: [val.value.map { "\($0)" } ?? ""])
        case .typedValueCurrency(let val):
            self = Self.parseCurrency(from: val, currencyFormatter: currencyFormatter)
        case .typedValueDatetime(let val):
            guard let date = val.value else {
                self = .text(lines: [""])
                return
            }
            self = .datetime(date.value, dateFormatter ?? .default)
        case .typedValueMultiPicklist(let val):
            var value = val.value
            value = value?.replacingOccurrences(of: "field.emptyValue", with: "")
            self = .text(lines: [value ?? ""])
        case .typedValueMultiText(let val):
            self = .text(lines: [""])
            if var multiValue = val.value?.filter({ !$0.isEmpty }), !multiValue.isEmpty {
                multiValue = multiValue.map { $0.replacingOccurrences(of: "field.emptyValue", with: "") }
                self = .text(lines: multiValue)
            }
        case .typedValueNumber(let val):
            self = .text(lines: [val.value.map(\.string) ?? ""])
        case .typedValuePicklist(let val):
            var value = val.value
            value = value?.replacingOccurrences(of: "field.emptyValue", with: "")
            self = .text(lines: [value ?? ""])
        case .typedValueText(let val):
            var value = val.value
            value = value?.replacingOccurrences(of: "field.emptyValue", with: "")
            self = .text(lines: [value ?? ""])
        case .typedValueDate(let val):
            guard let date = val.value else {
                self = .text(lines: [""])
                return
            }
            self = .datetime(date.value, dateFormatter ?? .default)
        }
    }

    private static func parseCurrency(from val: TypedValueCurrency, currencyFormatter: CurrencyFormatterFactory? = nil) -> MaisonKit.TypedValue {
        guard let amount = val.value else {
            return .text(lines: [""])
        }
        let currencyCode = val.currencyCode ?? "EUR"
        let divisor = val.currencyDivisor
        return .currency(CurrencyConvertable(fractionalUnitAmount: amount,
                                             numberOfFractionalUnitsInMonetaryUnit: divisor.map { Int($0) } ?? 1,
                                             currencyCode: currencyCode), currencyFormatter?.factory(currencyCode))
    }

    private static func parseMultiValueText(from val: TypedValueMultiText) -> MaisonKit.TypedValue {
        if var multiValue = val.value?.filter({ !$0.isEmpty }), !multiValue.isEmpty {
            multiValue = multiValue.map { $0.replacingOccurrences(of: "field.emptyValue", with: "") }
            return .text(lines: multiValue)
        } else {
            return .text(lines: [""])
        }
    }
}

extension FloatingPoint {
    var string: String {
        let result = "\(self)"
        return result.hasSuffix(".0") ? String(result.dropLast(2)) : result
    }
}

import nmbr_icu

private class ShortCurrencyNumberFormatterCustom: NumberFormatter {
    private let formatter: NMBRFormatter

    init(currencyCode: String, locale: Locale, maxPrecision: UInt8 = 2) {
        self.formatter = NMBRFormatter(locale: locale,
                                        maxPrecision: maxPrecision,
                                        currencyCode: currencyCode)
        super.init()
    }

    required init?(coder: NSCoder) {
        self.formatter = NMBRFormatter()
        super.init(coder: coder)
    }

    override func string(from number: NSNumber) -> String? {
        return self.formatter.string(from: number.doubleValue)
    }

    override func string(for obj: Any?) -> String? {
        guard let obj = obj else { return nil }

        guard let number = obj as? NSNumber else { return nil }

        return self.string(from: number)
    }
}
