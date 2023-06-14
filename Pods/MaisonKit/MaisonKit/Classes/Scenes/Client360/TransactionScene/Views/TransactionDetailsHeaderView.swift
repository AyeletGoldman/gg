// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct TransactionDetailsHeaderView: View {

    private enum Labels {
        static let transactionItemsFormat = MKLocalizedString("client360.timeline.transaction.number-of-items.format",
                                                              comment: "The format to use for the number of items in a transaction. The placeholder is the number of items.")
        static let transactionIDCopiedMessage = MKLocalizedString("client360.timeline.transaction.id-copied.title",
                                                                  comment: "The label to show when the user taps the copy button")
    }

    let header: TransactionDetailsDisplayable.Header

    var body: some View {
        StylableGroup("transaction-details") {
            VStack(spacing: 0) {
                if let headline = self.header.headline {
                    TypedFieldView(typedField: headline)
                        .style("body")
                        .padding(.bottom, 4)
                }
                if let title = self.header.title {
                    TypedFieldView(typedField: title)
                        .style("title")
                        .padding(.bottom, 1)
                }
                self.buildStatusAndQuantityRowIfNeeded()
                if let transactionReference = self.header.transactionReference {
                    self.buildtransactionReference(transactionReference: transactionReference)
                }
                self.buildAdditionalInformation()
            }
            .padding(.top, 17)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity)
            .style("background")
        }
    }

    @ViewBuilder
    private func buildStatusAndQuantityRowIfNeeded() -> some View {
        if self.header.quantity != nil || self.header.status != nil {
            HStack(spacing: 12) {
                if let quantity = self.header.quantity {
                    self.infoView(title: String(format: Labels.transactionItemsFormat, quantity),
                                  icon: "icon-cart")
                }
                if let status = self.header.status {
                    BadgeView(title: status.text)
                        .badgeViewStyle(StockBadgeViewStyle(variant: AvailabilityVariant(status.variant!)))
                }
            }
            .padding(.bottom, 8)
        }
    }

    @ViewBuilder
    private func buildAdditionalInformation() -> some View {
        PairedInformationView(pairs: Array(self.header.additionalInformation.pairs))
            .pairedInformationViewStyle(.typedField)
    }

    @ViewBuilder
    private func buildtransactionReference(transactionReference: String) -> some View {
        TertiaryButton.copyableText(textToCopy: transactionReference, toastMessage: Labels.transactionIDCopiedMessage)
            .padding(.bottom, 8)
    }

    @ViewBuilder
    private func infoView(title: String, icon: StylistIdentifier) -> some View {
        StylableGroup("info") {
            TypedFieldView(typedField: TypedField(value: .text(lines: [title]),
                                                  icon: icon))
                .style("title")
        }
    }
}
