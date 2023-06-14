// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

private struct BaseOrderProductsView<Label: View>: View {

    private let title: String?
    private let productData: [PayByLinkData.ProductDetails]
    private let contentRow: (Int, PayByLinkData.ProductDetails) -> Label

    init(title: String?, productData: [PayByLinkData.ProductDetails], contentRow: @escaping (Int, PayByLinkData.ProductDetails) -> Label) {
        self.title = title
        self.productData = productData
        self.contentRow = contentRow
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let title = self.title {
                SectionHeaderView(title: title)
                    .addStyledRowDivider()
                    .padding(.bottom)
            }

            ForEach(Array(zip(self.productData.indices, self.productData)), id: \.1) { index, product in
                self.contentRow(index, product)
            }
        }
        .padding(.top)
        .style("background")
    }
}

struct OrderProductsView: View {

    private enum Labels {
        static let quantityLabel = MKLocalizedString("pay-by-link.confirm-order.product.quantity.title",
                                                     comment: "The label for the quantity in each of the items in the curator")
    }

    private let title: String
    private let productData: [PayByLinkData.ProductDetails]

    init(title: String, productData: [PayByLinkData.ProductDetails]) {
        self.title = title
        self.productData = productData
    }

    var body: some View {
        BaseOrderProductsView(title: self.title, productData: self.productData, contentRow: { index, data in
            VStack(spacing: 0) {
                OrderProductRowView(product: data)
                    .addStyledRowDivider()
                StylableGroup("product[quantity]") {
                    HStack {
                        Spacer()
                        StylableGroup("info") {
                            Text(Labels.quantityLabel).style("subtitle")
                            Text("\(self.productData[index].quantity)").style("title")
                        }
                        if let price = self.productData[index].price {
                            BadgeView(title: price)
                                .badgeViewStyle(PrimaryBadgeViewStyle(verticalPadding: 4))
                        }
                    }
                    .padding(10)
                    .style("background")
                }
            }
        })
    }
}

struct EditableOrderProductsView: View {

    private enum Labels {
        static let quantityLabel = MKLocalizedString("pay-by-link.create-order.product.quantity.title",
                                                     comment: "The label for the quantity in each of the items in the curator")
    }

    private let title: String?
    @Binding private var productData: [PayByLinkData.ProductDetails]
    private let didTapEditProduct: ((PayByLinkData.ProductDetails, Int) -> Void)?
    private let didTapDeleteProduct: ((Int) -> Void)?

    init(title: String? = nil,
         productData: Binding<[PayByLinkData.ProductDetails]>,
         didTapEditProduct: ((PayByLinkData.ProductDetails, Int) -> Void)? = nil,
         didTapDeleteProduct: ((Int) -> Void)? = nil) {
        self.title = title
        self._productData = productData
        self.didTapEditProduct = didTapEditProduct
        self.didTapDeleteProduct = didTapDeleteProduct
    }

    var body: some View {
        BaseOrderProductsView(title: self.title, productData: self.productData, contentRow: { index, data in
            VStack(spacing: 0) {
                StylableGroup(StylistIdentifier.buildFullIdentifier(for: "product", variant: "row")) {
                    OrderProductRowView(product: data, didTapEditButton: { data in
                        self.didTapEditProduct?(data, index)
                    })
                        .addSwipeToDelete(if: self.didTapDeleteProduct != nil, standardSwipe: false) {
                            withAnimation {
                                self.didTapDeleteProduct?(index)
                            }
                        }
                }
                SafeBinding(self.$productData, index: index) { binding in
                    StylableGroup("product[quantity]") {
                        HStack {
                            MKStepper(value: binding.quantity, range: 1...Int.max)
                            Spacer()
                            StylableGroup("info") {
                                Text(Labels.quantityLabel).style("subtitle")
                                Text("\(binding.wrappedValue.quantity)").style("title")
                            }
                        }
                        .padding(10)
                        .padding(.bottom, 16) // extra padding between rows
                        .style("background")
                    }
                }
            }
        })
    }
}
