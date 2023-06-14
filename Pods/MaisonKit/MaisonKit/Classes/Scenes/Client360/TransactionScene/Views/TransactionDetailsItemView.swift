// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct TransactionDetailsItemView: View {

    private enum Labels {
        static let skuLabel = MKLocalizedString("transaction-details.item.properties.sku.label",
                                                comment: "The label for SKU (Stock Keeping Unit)")
    }

    private enum Constants {
        static let imageHeight: CGFloat = 110
        static let imageWidth: CGFloat = 110
    }

    let transactionDetails: TransactionDetailsDisplayable.Item
    public let imageSource: ImageSource?

    public init(transactionDetails: TransactionDetailsDisplayable.Item) {
        self.transactionDetails = transactionDetails
        self.imageSource = transactionDetails.imageURL.map { ImageSource.url($0) }
    }

    var body: some View {
        buildItem()
    }

    @ViewBuilder private func buildItem() -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "product", variant: "row")) {
            HStack(alignment: .top, spacing: 0) {
                Group {
                    if let imageSource = self.imageSource {
                        MaisonKitImage(source: imageSource)
                    } else {
                        Spacer()
                    }
                }
                .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                .style("image/background")
                .padding(.trailing, 15)
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        if let headline = self.transactionDetails.headline {
                            Text(verbatim: headline).style("subtitle")
                                .padding(.bottom, 3)
                        }
                        if let tag = self.transactionDetails.tag {
                            Spacer()
                            BadgeView(title: tag)
                                .badgeViewStyle(PrimaryBadgeViewStyle(verticalPadding: 4))
                                .padding(.bottom, 4)
                        }
                    }
                    if let title = self.transactionDetails.title {
                        Text(verbatim: title)
                            .style("title")
                            .padding(.bottom, 6)
                            .padding(.trailing)
                    }
                    self.buildSpecifications()
                }
            }
            .padding(10)
            .style("background")
        }
    }

    @ViewBuilder private func buildSpecifications() -> some View {
        StylableGroup("info") {
            LabeledValueView(values: self.transactionDetails.sku.map {
                self.transactionDetails.specifications + [LabeledValue(label: Labels.skuLabel, value: $0)]
            } ?? self.transactionDetails.specifications)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
