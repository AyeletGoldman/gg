//
//  OrderSectionFieldExtension.swift
//  Kenzo Clienteling
//
//  Created by ba-link on 06/03/2023.
//

import Foundation
import SwiftUI
import StylableSwiftUI
import MaisonKit


extension OrderSectionField {
    init(date: String? ,title: String = "", tag: String?, onTap: (() -> Void)? = nil, customPaymentInformation: CustomTransactionPaymentInformation){
        self.init(title: title,
                  subtitle: date,
                  tag: tag,
                  footer: { CustomTransactionPaymentInformationView(data: customPaymentInformation) })
    }

}
public struct CustomTransactionPaymentInformation {
    public let refundMethod: String
    public let invoiceReference: String
}

struct CustomTransactionPaymentInformationView: View {

    private enum Labels {
        static let paymentMethode = MKLocalizedString("client360.timeline.transactions.paymentMethode",
                                                   comment: "The title of the line item that displays the payment refundMethod")
        static let invoiceReferenceTitle = MKLocalizedString("client360.timeline.transactions.invoiceReference",
                                                      comment: "The title of the line item that displays the invoiceReference")
    }

    let data: CustomTransactionPaymentInformation

    var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "info", variant: "label")) {
            VStack(alignment: .leading, spacing: 4) {
                buildLine(label: Labels.invoiceReferenceTitle, value: self.data.invoiceReference)
                buildLine(label: Labels.paymentMethode, value: self.data.refundMethod)
            }
        }
    }
    
    @ViewBuilder func buildLine (label: String, value: String) -> some View {
        HStack(alignment: .top) {
            Text(verbatim:  label)
                .style("subtitle")
            Spacer()
            Text(verbatim: value).padding(.trailing, 7)
                .style("title")
        }
    }
}

