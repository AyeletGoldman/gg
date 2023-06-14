// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct GFBirthdayFieldView: View {

    private enum Labels {
        static let placeholder = MKLocalizedString("generic-form.field.birthday.placeholder",
                                                   comment: "The default placeholder for birthday field in generic form")
    }

    @Binding private var value: Birthday?
    private let config: GFFieldConfiguration
    @State private var isExpanded: Bool = false

    private var placeholder: String {
        self.config.placeholder.isEmpty ? Labels.placeholder : self.config.placeholder
    }

    init(value: Binding<Birthday?>, config: GFFieldConfiguration) {
        self._value = value
        self.config = config
    }

    var body: some View {
        if config.isEditable {
            self.buildBody()
        } else {
            GFTextFieldView(value: .constant(self.value?.toString() ?? ""), config: self.config)
        }
    }

    func buildBody() -> some View {
        VStack(alignment: .center, spacing: 3) {
            DateDisplayFieldView(config: self.config,
                                 displayValue: { birthday in return birthday?.toString() ?? self.placeholder },
                                 isExpanded: self.$isExpanded,
                                 value: self.$value)
            if self.isExpanded {
                self.buildExpandedContent()
            }
        }
        .wrapToGFField(variant: self.config.isEditable ? "date-time" : "date-time-blurred")
    }

    func buildExpandedContent() -> some View {
        BirthdayPicker(selection: self.$value.getRequired())
    }
}

extension Binding where Value == Birthday? {
    func getRequired() -> Binding<Birthday> {
        return Binding<Birthday> { () -> Birthday in
            return self.wrappedValue ?? Birthday()
        } set: { (newValue: Birthday) in
            self.wrappedValue = newValue
        }
    }
}
