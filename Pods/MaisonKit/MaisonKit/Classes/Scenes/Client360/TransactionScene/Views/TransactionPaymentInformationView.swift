// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

struct TransactionPaymentInformationView: View {

    private enum Labels {
        static let statusTitle = MKLocalizedString("client360.transactions.sections.pay-by-link.status.title",
                                                   comment: "The title of the line item that displays the payment status")
        static let paymentIdTitle = MKLocalizedString("client360.transactions.sections.pay-by-link.paymentId.title",
                                                      comment: "The title of the line item that displays the payment ID")
    }

    let data: TransactionPaymentInformation

    var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "info", variant: "label")) {
            VStack(alignment: .leading, spacing: 2) {
                LabeledValueView(values: [
                    LabeledValue(label: Labels.statusTitle, value: self.data.status),
                    LabeledValue(label: Labels.paymentIdTitle, value: self.data.paymentId)
                ])
                TypedFieldView(typedField: TypedField(value: .text(lines: [self.data.paymentLink.absoluteString]), isCopyable: true))
                    .style("title")
            }
        }
    }
}
