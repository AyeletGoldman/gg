//  Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct PBLConfirmOrderView: View {

    private enum Labels {
        static let sendPaymentLinkButtonTitle = MKLocalizedString("pay-by-link.confirm-order.send-payment-button.title",
                                                                  comment: "Title of the send payment link button")
        static let productsSectionTitle = MKLocalizedString("pay-by-link.confirm-order.product-section.title",
                                                            comment: "Title of the products section")
        static let formFieldsSectionTitle = MKLocalizedString("pay-by-link.confirm-order.order-options.title", comment: "Title of the share button")
    }

    @Environment(\.isModalPresentationStyle) private var isPresentedModally
    @ObservedObject private var viewModel: PBLConfirmOrderViewModel

    init(viewModel: PBLConfirmOrderViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 0) {
            ResultStateViewBuilder(result: self.viewModel.data)
                .setLoadingView {
                    self.buildMain(displayable: ConfirmOrderDisplayable.loadingData)
                }.buildContent { displayable in
                    self.buildMain(displayable: displayable)
                }
        }.padding(.horizontal)
            .withFloatingActionView(fabVariant: "single") {
                self.buildSendPaymentLinkButton()
                    .padding()
            }.alert(alertContext: self.$viewModel.alertContext)
            .padding(.bottom, if: self.isPresentedModally)
            .edgesIgnoringSafeArea(.bottom, if: self.isPresentedModally)
    }

    @ViewBuilder
    private func buildMain(displayable: ConfirmOrderDisplayable) -> some View {
        OrderProductsView(title: Labels.productsSectionTitle, productData: displayable.productsData)
        OrderOptionsView(title: Labels.formFieldsSectionTitle, sectionFields: displayable.sectionFields)
        PricingBreakdownView(items: displayable.pricingData)
    }

    @ViewBuilder
    private func buildSendPaymentLinkButton() -> some View {
        PrimaryButton(buttonData: ButtonData(label: Labels.sendPaymentLinkButtonTitle,
                                             action: self.viewModel.didTapSendPaymentLinkButton),
                      isLoading: self.viewModel.isButtonLoading)
    }
}

private extension ConfirmOrderDisplayable {
    static var loadingData: ConfirmOrderDisplayable {
        return ConfirmOrderDisplayable(
            clientId: UUID().uuidString,
            productsData: [
                PayByLinkData.ProductDetails(
                    id: UUID().uuidString,
                    productMasterId: UUID().uuidString,
                    name: "Product 1",
                    image: .styledImage(identifier: "placeholder"),
                    category: "Category",
                    attributes: ProductAttributes(attributes: [], selectedAttributes: nil),
                    quantity: 1,
                    price: "1234")
            ],
            sectionFields: Array(repeating: OrderSectionField(title: "Title 1", subtitle: "Subtitle 1", onTap: nil),
                                 count: 2),
            pricingData: Array(repeating: PricingItem(title: "Subtotal", subtitle: "123", isHighlighted: false),
                               count: 3)
        )
    }
}
