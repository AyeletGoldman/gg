// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct OrderOptionsView: View {

    private let title: String?
    private let sectionFields: [OrderSectionField]

    public init(title: String?, sectionFields: [OrderSectionField]) {
        self.title = title
        self.sectionFields = sectionFields
    }

    public var body: some View {
        VStack(spacing: 0) {
            if let title = self.title {
                SectionHeaderView(title: title)
                    .addStyledRowDivider()
            }
            ForEach(0..<self.sectionFields.count, id: \.self) { index in
                self.buildSectionField(self.sectionFields[index])
            }
        }
        .padding(.top)
        .style("background")
    }

    @ViewBuilder
    private func buildSectionField(_ sectionField: OrderSectionField) -> some View {
        StylableGroup("input") {
            self.buildButtonIfNecessary(for: sectionField)
                .styleInputContent()
                .addStyledRowDivider()
                .style("background")
        }
    }

    @ViewBuilder
    private func buildButtonIfNecessary(for sectionField: OrderSectionField) -> some View {
        if let onTap = sectionField.onTap {
            Button(action: {
                onTap()
            }, label: {
                self.buildButtonLabel(for: sectionField)
            })
        } else {
            self.buildButtonLabel(for: sectionField)
        }
    }

    @ViewBuilder
    private func buildButtonLabel(for sectionField: OrderSectionField) -> some View {
        VStack(alignment: .leading) {
            FormFieldView(subtitle: sectionField.subtitle, tag: sectionField.tag) {
                Text(verbatim: sectionField.title)
            }.stackWithAccessory(if: sectionField.onTap != nil)
            if let footer = sectionField.footer {
                footer.padding(.top, 2)
            }
        }
    }
}
