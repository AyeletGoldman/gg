// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct GFDateFieldView: View {

    private enum Labels {
        static let datePlaceholder = MKLocalizedString("generic-form.field.date.placeholder",
                                                   comment: "The default placeholder for date field in generic form")
        static let timePlaceholder = MKLocalizedString("generic-form.field.time.placeholder",
                                                   comment: "The default placeholder for time field in generic form")
    }

    @Binding private var value: Date?
    private let pickerComponent: DatePickerComponents
    private let formatter: DateFormatter
    private let config: GFFieldConfiguration
    @State private var isExpanded: Bool = false

    init(value: Binding<Date?>,
         pickerComponent: DatePickerComponents,
         formatter: DateFormatter,
         config: GFFieldConfiguration) {
        self._value = value
        self.pickerComponent = pickerComponent
        self.formatter = formatter
        self.config = config
    }

    var placeholder: String {
        self.pickerComponent == .date ? Labels.datePlaceholder : Labels.timePlaceholder
    }

    var body: some View {
        if config.isEditable {
            self.buildBody()
        } else {
            GFTextFieldView(value: .constant(self.value?.toString(with: self.formatter) ?? ""), config: self.config)
        }
    }

    func buildBody() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            DateDisplayFieldView(config: self.config,
                                 displayValue: { date in date?.toString(with: self.formatter) ?? self.placeholder },
                                 isExpanded: self.$isExpanded,
                                 value: self.$value)
            if self.isExpanded {
                self.buildExpandedContent()
            }
        }
        .wrapToGFField(variant: self.config.isEditable ? "date-time" : "date-time-blurred")
    }

    func buildExpandedContent() -> some View {
        DatePicker("", selection: self.$value.getRequired(), displayedComponents: self.pickerComponent)
            .environment(\.timeZone, self.formatter.timeZone)
            .datePickerStyle(.wheel)
            .labelsHidden()
    }
}

extension Binding where Value == Date? {
    func getRequired() -> Binding<Date> {
        return Binding<Date> { () -> Date in
            return self.wrappedValue ?? Date()
        } set: { (newValue: Date) in
            self.wrappedValue = newValue
        }
    }
}
