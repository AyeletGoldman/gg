// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct PBLCreateOrderView: View {

    private enum Labels {
        static let orderOptionsSectionTitle = MKLocalizedString("pay-by-link.create-order.order-options.title",
                                                                comment: "The title appears on the order options section on pay by link create order screen")
        static let createOrderButtonTitle = MKLocalizedString("pay-by-link.create-order.doneButton.title",
                                                              comment: "The done button title for creating an order on pay by link create order screen")
        static let createOrderLoadingButtonTitle = MKLocalizedString("pay-by-link.create-order.doneButton.loading.title",
                                                                     comment: "The done button title for creating an order (while loading) on pay by link create order screen")
        static let deliveryFieldTitle = MKLocalizedString("pay-by-link.create-order.delivery-field.title",
                                                          comment: "The title for choosing delivery method field on pay by link create order screen")
        static let deliveryFieldPlaceholder = MKLocalizedString("pay-by-link.create-order.delivery-field.placeholder",
                                                                comment: "The placeholder for choosing delivery method field on pay by link create order screen")
        static let clientFieldTitle = MKLocalizedString("pay-by-link.create-order.client-field.title",
                                                        comment: "The title for choosing a client field on pay by link create order screen")
        static let clientFieldPlaceholder = MKLocalizedString("pay-by-link.create-order.client-field.placeholder",
                                                              comment: "The placeholder for choosing a client field on pay by link create order screen")
    }

    @Environment(\.isModalPresentationStyle) private var isPresentedModally
    @ObservedObject private var viewModel: PBLCreateOrderViewModel

    public init(viewModel: PBLCreateOrderViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(spacing: 0) {
            EditableOrderProductsView(productData: self.$viewModel.payByLinkData.products,
                                      didTapEditProduct: { product, index in
                self.viewModel.didTapEditProductDetails(for: product, at: index)
            },
                                      didTapDeleteProduct: { index in
                self.viewModel.didTapDeleteProduct(at: index)
            })
            self.buildOrderOptions()
        }
        .padding(.horizontal)
        .withFloatingActionView(fabVariant: "single") {
            self.buildDoneButton()
                .padding()
        }
        .padding(.bottom, if: self.isPresentedModally)
        .style("background")
        .edgesIgnoringSafeArea(.bottom, if: self.isPresentedModally)
    }

    @ViewBuilder
    private func buildOrderOptions() -> some View {
        OrderOptionsView(
            title: Labels.orderOptionsSectionTitle,
            sectionFields: [
                OrderSectionField(title: self.viewModel.selectedDeliveryMethod?.title ?? Labels.deliveryFieldPlaceholder,
                                  subtitle: Labels.deliveryFieldTitle,
                                  onTap: self.viewModel.presentDeliveryMethods),
                OrderSectionField(title: self.viewModel.selectedClient?.name ?? Labels.clientFieldPlaceholder,
                                  subtitle: Labels.clientFieldTitle,
                                  onTap: self.viewModel.presentClientSearch)
            ])
    }

    @ViewBuilder
    private func buildDoneButton() -> some View {
        PrimaryButton(buttonData: ButtonData(
            label: self.viewModel.orderCreating ? Labels.createOrderLoadingButtonTitle : Labels.createOrderButtonTitle,
            action: self.viewModel.didTapCreateOrder),
                      isLoading: self.viewModel.orderCreating)
    }
}
