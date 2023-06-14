// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct ProductStockDetailsSceneView: View {

    @ObservedObject private var viewModel: ProductStockViewModel
    @State private var selectedTabIndex = 0

    @Environment(\.isModalPresentationStyle) private var isPresentedModally

    public init(viewModel: ProductStockViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(spacing: 0) {
            StylableGroup(StylistIdentifier.buildFullIdentifier(for: "toolbar", variant: "tabs")) {
                VStack(spacing: 10) {
                    ResultStateViewBuilder(result: self.viewModel.productAttributes)
                        .buildContent { productAttributes in
                            ProductAttributesView(attributes: productAttributes ?? [],
                                                  attributeRows: self.viewModel.attributeRows.value ?? [:],
                                                  isLoading: self.viewModel.attributeRows.isLoading,
                                                  isCollapsable: true,
                                                  allowsDeselection: false,
                                                  selectedAttributesValues: self.$viewModel.selectedAttributes,
                                                  presentAttributeItemsSelection: self.viewModel.presentSelectedFilter(attribute:))

                        }.fixedSize(horizontal: false, vertical: true)
                    ResultStateViewBuilder(result: self.viewModel.stockDetails)
                        .setLoadingView {
                            let items = self.viewModel.stockDetails.value?.items ?? StockInformationDisplayable.loadingDisplayable.items ?? []
                            self.buildToolbar(items: items)
                        }.buildContent { stock in
                            self.buildToolbar(items: stock.items ?? [])
                        }
                }.style("background")
            }
            ProductStockDetailsView(stockDetails: self.viewModel.stockDetails, selectedTabIndex: self.selectedTabIndex)
        }
        .edgesIgnoringSafeArea(.bottom, if: self.isPresentedModally)
    }

    @ViewBuilder
    private func buildToolbar(items: [StockInformationObject]) -> some View {
        TabbedToolbar(tabs: items.map { Tab(id: UUID().uuidString,
                                            title: $0.title, badge: $0.subtitle)},
                      selectedTabIndex: self.$selectedTabIndex)

    }
}
