// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

struct PBLAttributeSelectionView: View {

    @ObservedObject var viewModel: PBLAttributeSelectionViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ResultStateViewBuilder(result: self.viewModel.products)
                    .setLoadingView { product in
                        self.buildProductInfoView(displayable: PBLProductInformationDisplayable.loading)
                        if let value = product?.attributes {
                            self.buildAttributesView(attributes: value)
                                .unredacted()
                        } else {
                            self.buildAttributesView(attributes: ProductAttributes.loading)
                        }
                    }
                    .buildContent { displayable in
                        self.buildProductInfoView(displayable: displayable)
                        if let attributes = displayable.attributes {
                            self.buildAttributesView(attributes: attributes)
                        }
                    }
                ResultStateViewBuilder(result: self.viewModel.stock)
                    .setWaitingView {
                        ProductStockInformationView(viewType: .master,
                                                    stockDetails: .loading(nil),
                                                    privacyMode: .constant(.detail),
                                                    refreshStockFunc: { })
                    }
                    .setLoadingView {
                        self.buildStockView(displayable: .loadingDisplayable)
                    }.buildContent { stockDisplayable in
                        self.buildStockView(displayable: stockDisplayable)
                    }
                Spacer()
            }
        }
    }

    @ViewBuilder
    private func buildAttributesView(attributes: ProductAttributes) -> some View {
        ProductAttributesView(attributes: attributes.attributes,
                              attributeRows: attributes.attributes.reduce([:], { acc, next in
            var acc = acc
            acc[next.id] = next.row
            return acc
        }),
                              isLoading: self.viewModel.products.isLoading,
                              selectedAttributesValues: self.$viewModel.selectedAttributes,
                              presentAttributeItemsSelection: self.viewModel.presentAttributeItemsSelection)
    }

    @ViewBuilder
    private func buildStockView(displayable: StockInformationDisplayable) -> some View {
        Spacer().frame(height: 16)
        ProductStockInformationView(viewType: .product,
                                    stockDetails: .found(displayable),
                                    privacyMode: self.$viewModel.privacyMode,
                                    refreshStockFunc: { })
    }

    @ViewBuilder
    private func buildProductInfoView(displayable: PBLProductInformationDisplayable) -> some View {
        ProductInfoView(title: displayable.productName,
                        subtitle: nil,
                        price: displayable.price,
                        productId: nil)
    }
}
