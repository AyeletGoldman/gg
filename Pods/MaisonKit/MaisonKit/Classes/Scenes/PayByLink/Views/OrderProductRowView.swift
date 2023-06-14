// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct OrderProductRowView: View {

    private enum Labels {
        static let editLabel = MKLocalizedString("pay-by-link.create-order.product-row.edit-criteria.title",
                                                 comment: "Text to show on a label that allows the user to edit the product in pay by link")
        static let requiredLabel = MKLocalizedString("pay-by-link.create-order.product-row.required-attribute.title",
                                                     comment: "The text to show when an attribute is required but has not been selected")
    }

    public let product: PayByLinkData.ProductDetails
    private let didTapEditButton: ((PayByLinkData.ProductDetails) -> Void)?

    public init(product: PayByLinkData.ProductDetails, didTapEditButton: ((PayByLinkData.ProductDetails) -> Void)? = nil) {
        self.product = product
        self.didTapEditButton = didTapEditButton
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 10) {
            self.buildImageSection()
            VStack(alignment: .leading, spacing: 6) {
                Group {
                    Text(verbatim: self.product.category)
                        .style("subtitle")
                    Text(verbatim: self.product.name)
                        .style("title")
                    self.buildInfoTableSection()
                    if self.product.productMasterId != nil {
                        TertiaryButton(buttonData: ButtonData(label: Labels.editLabel,
                                                              icon: "icon-edit",
                                                              badge: nil,
                                                              isEnabled: true,
                                                              action: {
                            self.didTapEditButton?(self.product)
                        }))
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
        }.padding(10)
        .style("background")
    }

    @ViewBuilder
    private func buildImageSection() -> some View {
        VStack {
            MaisonKitImage(source: self.product.image)
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 110)
                .unredacted()
                .style("image/background")
            Spacer()
        }
        .frame(maxHeight: .infinity)
    }

    @ViewBuilder
    private func buildInfoTableSection() -> some View {
        VStack(alignment: .leading, spacing: 2) {
            ForEach(self.product.displayableAttributes) { property in
                StylableGroup(StylistIdentifier.buildFullIdentifier(for: "info", variant: property.value == nil ? "label-error" : nil)) {
                    HStack(alignment: .top) {
                        Text(verbatim: property.name)
                            .style("subtitle")
                        Text(verbatim: property.value ?? Labels.requiredLabel)
                            .style("title")
                    }
                }
            }
        }
    }
}

extension PayByLinkData.ProductDetails {
    struct DisplayableAttribute: Identifiable {
        let id: ProductAttributes.Attribute.ID
        let name: String
        let value: String?
    }

    var displayableAttributes: [DisplayableAttribute] {
        let attributes = self.attributes.attributes
        return attributes.map {
            let value = self.attributes.selectedAttributes?[$0.id]
            return DisplayableAttribute(id: $0.id, name: $0.title, value: value?.title)
        }
    }
}
