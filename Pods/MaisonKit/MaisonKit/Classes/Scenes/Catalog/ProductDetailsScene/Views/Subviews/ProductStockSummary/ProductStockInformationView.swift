// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct ProductStockInformationView: View {

    private enum Labels {
        static let stockMissingAttributes = MKLocalizedString("product-details.stock-information.caption.missing-attributes",
                                                              comment: "The caption shown if attributes (size, coulour, material) are missing to check the stock")
        static let stockDetailsButtonTitle = MKLocalizedString("product-details.stock-information.details-button.title",
                                                              comment: "The title to show on the stock details button")
    }

    enum ViewType {
        case product
        case master
    }

    let viewType: ViewType
    let stockDetails: ResultState<StockInformationDisplayable, ErrorDisplayable>
    @Binding var privacyMode: PrivacyMode
    let refreshStockFunc: () -> Void

    var body: some View {
        Group {
            if self.viewType == .master {
                Text(verbatim: Labels.stockMissingAttributes)
                    .style("body")
            } else {
                self.buildStockSummaryResultStateView()
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    }

    @ViewBuilder
    private func buildStockSummaryResultStateView() -> some View {
        ResultStateViewBuilder(result: self.stockDetails)
            .setErroredAction(ButtonData(label: GeneralErrorLabel.retryButtonTitle,
                                         icon: "icon-retry",
                                         action: self.refreshStockFunc))
            .setLoadingView {
                self.buildStockSummaryView(displayable: StockInformationDisplayable.loadingDisplayable)
            }
            .buildContent { stockInformationDisplayable in
                self.buildStockSummaryView(displayable: stockInformationDisplayable)
            }
    }

    @ViewBuilder
    private func buildStockSummaryView(displayable: StockInformationDisplayable) -> some View {
        ProductStockSummaryView(stockSummary: displayable.stockSummary, privacyMode: self.$privacyMode)
    }
}
