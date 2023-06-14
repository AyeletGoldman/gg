// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

struct AttributeCloudView: View {

    enum Labels {
        static let attributeItemsModalDescription = MKLocalizedString("product-details.attributes.selection.description",
                                                                      comment: "The description to show in product details attribute selection screen")
        // swiftlint:disable line_length
        static let attributeLabelFormat = MKLocalizedString("product-details.attributes.selection.remove-attribute.format",
                                                                      comment: "The format to use to display a selected attribute. First placeholder is the attribute title and second is the selected attribute value")
        // swiftlint:enable line_length
    }

    let attributePairs: [(attribute: ProductAttributes.Attribute, value: ProductAttributes.AttributeValue)]
    let onSelect: ((attribute: ProductAttributes.Attribute, value: ProductAttributes.AttributeValue)) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(verbatim: Labels.attributeItemsModalDescription)
                .style("body")
                .padding(.horizontal)
            TagCloud(items: self.attributePairs.map { attributePair in
                TertiaryButton(buttonData: .init(
                    label: String(format: Labels.attributeLabelFormat, attributePair.0.title, attributePair.1.title),
                    icon: "icon-close",
                    action: {
                        self.onSelect(attributePair)
                    }))
            }, horizontalSpacing: 10, verticalSpacing: 10)
                .padding(.horizontal)
                .padding(.bottom, 5)
        }

    }
}
