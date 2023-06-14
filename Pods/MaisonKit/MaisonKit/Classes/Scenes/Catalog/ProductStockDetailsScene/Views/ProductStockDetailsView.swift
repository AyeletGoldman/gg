// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct ProductStockDetailsView: View {

    private enum Labels {
        static let lastUpdatedTitle = MKLocalizedString("product-stock.last-updated.title",
                                                        comment: "The product stock last updated title")
        static let emptyViewTitle = MKLocalizedString("product-stock.empty-view.title",
                                                      comment: "The title of the product stock empty view")
        static let emptyViewSubtitle = MKLocalizedString("product-stock.empty-view.subtitle",
                                                         comment: "The subtitle of the product stock empty view")
    }

    private let stockDetails: ResultState<StockInformationDisplayable, ErrorDisplayable>
    private let selectedTabIndex: Int

    init(stockDetails: ResultState<StockInformationDisplayable, ErrorDisplayable>, selectedTabIndex: Int) {
        self.stockDetails = stockDetails
        self.selectedTabIndex = selectedTabIndex
    }

    var body: some View {
        ResultStateViewBuilder(result: self.stockDetails)
            .setLoadingView {
                self.buildContent(objects: self.stockDetails.value?.items ??
                                  StockInformationDisplayable.loadingDisplayable.items ?? [])
            }
            .buildContent { details in
                self.buildContent(objects: details.items ?? [])
            }
            .style("background")
    }

    @ViewBuilder
    private func buildContent(objects: [StockInformationObject]) -> some View {
        VStack(spacing: 0) {
            if let selectedTabObject = objects[safe: self.selectedTabIndex] {
                self.buildTabContent(items: selectedTabObject.stockInformationItems,
                                     lastUpdated: selectedTabObject.lastUpdatedString)
            }
            Spacer()
        }
    }

    @ViewBuilder
    private func buildTabContent(items: [StockInformationItem], lastUpdated: String?) -> some View {
        if items.isEmpty {
            AuxiliaryView(viewModel: .init(imageSource: .styledImage(identifier: "icon-fail-out-of-stock"),
                                           title: Labels.emptyViewTitle,
                                           subtitle: Labels.emptyViewSubtitle))
        } else {
            let identifiableItems = items.map { WrappedIdentifiable(wrapped: $0) }
            MKList {
                if let lastUpdated = lastUpdated {
                    TypedFieldView(typedField: .init(title: Labels.lastUpdatedTitle, value: .text(lines: [lastUpdated])))
                        .style("body")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                } else {
                    Color.clear.padding(.top)
                }
                ForEach(identifiableItems) { item in
                    ProductStockDetailsItemView(item: item.wrapped)
                }
                .padding(.bottom, 10)
                .padding(.horizontal)
            }
        }
    }
}
