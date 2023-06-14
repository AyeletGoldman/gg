// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct TransactionDetailsView: View {

    @ObservedObject private var viewModel: TransactionDetailsViewModel

    public init(viewModel: TransactionDetailsViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ResultStateViewBuilder(result: self.viewModel.transactionDetails)
            .setLoadingView {
                self.buildMainView(transactionDetails: .loadingData)
            }
            .buildContent(self.buildMainView)
    }

    private func buildMainView(transactionDetails: TransactionDetailsDisplayable) -> some View {
        ScrollView {
            VStack(spacing: 0) {
                TransactionDetailsHeaderView(header: transactionDetails.header)
                self.buildItems(items: transactionDetails.items)
                if !transactionDetails.sectionFields.isEmpty {
                    OrderOptionsView(title: nil, sectionFields: transactionDetails.sectionFields)
                }
                if let pricingDataView = transactionDetails.pricingDataView {
                    pricingDataView()
                        .eraseToAnyView()
                }
                ForEach(0..<transactionDetails.additionalDetails.count, id: \.self) { index in
                    if !transactionDetails.additionalDetails[index].fields.isEmpty {
                        OrderOptionsView(title: transactionDetails.additionalDetails[index].title,
                                         sectionFields: transactionDetails.additionalDetails[index].fields)
                    }
                }
                Spacer(minLength: 40)
            }.padding(.horizontal)
        }.style("background")
    }

    @ViewBuilder private func buildItems(items: [TransactionDetailsDisplayable.Item]) -> some View {
        VStack(spacing: 16) {
            ForEach(items, id: \.id) { item in
                TransactionDetailsItemView(transactionDetails: item)
            }
        }
    }
}

private extension TransactionDetailsDisplayable {
    static var loadingData: TransactionDetailsDisplayable {
        return TransactionDetailsDisplayable(header: Header(date: Date(),
                                                            totalPrice: CurrencyConvertable(fractionalUnitAmount: 300,
                                                                                            numberOfFractionalUnitsInMonetaryUnit: 1,
                                                                                            currencyCode: "EUR"),
                                                            location: "Some location somewhere",
                                                            advisorName: "Advisor example",
                                                            quantity: 2,
                                                            status: .unknown),
                                             items: (1...3).map {
            return TransactionDetailsDisplayable.Item(
                id: "\($0)",
                headline: "BRACELETS",
                title: "Chance infinie cuff by Annelise Michelson",
                tag: CurrencyConvertable(fractionalUnitAmount: 300,
                                         numberOfFractionalUnitsInMonetaryUnit: 1,
                                         currencyCode: "EUR").toString(),
                specifications: [
                    LabeledValue(label: "Material", value: "18k yellow gold"),
                    LabeledValue(label: "Size", value: "4")
                ],
                sku: "6J0201")
        })
    }
}
