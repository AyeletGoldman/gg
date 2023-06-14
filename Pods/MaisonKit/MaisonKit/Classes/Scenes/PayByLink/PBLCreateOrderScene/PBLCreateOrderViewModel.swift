// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

/// A view model to manage PBLCreateOrderScene
public class PBLCreateOrderViewModel: ObservableObject {

    private enum Labels {
        static let selectedClientMissingError = MKLocalizedString("pay-by-link.create-order.error.selected-client.title",
                                                                  comment: "An error to show when in pay by link, the user hasn't selected a client")
        static let selectedDeliveryMethodMissingError = MKLocalizedString("pay-by-link.create-order.error.selected-delivery-method.title",
                                                                          comment: "An error to show when in pay by link, the user hasn't selected a delivery method")
        static let missingProductAttributes = MKLocalizedString("pay-by-link.create-order.error.missing-attributes.title",
                                                                comment: "An error to show when in pay by link, the user hasn't selected all required attributes")
    }

    let title: String
    let onClose: (() -> Void)?
    private let router: PBLCreateOrderRouter

    @Inject private var payByLinkAdapter: PayByLinkAdapter
    private var cancellables = Set<AnyCancellable>()

    @Published private(set) var selectedDeliveryMethod: SelectionListItem?
    @Published private(set) var selectedClient: SelectedClient?
    private var isValidOrder: Bool = false
    @Published var orderCreating: Bool = false
    @Published var payByLinkData: PayByLinkData

    public init(payByLinkData: PayByLinkData, title: String, onClose: (() -> Void)?, router: PBLCreateOrderRouter) {
        self.payByLinkData = payByLinkData
        self.title = title
        self.onClose = onClose
        self.router = router
        self.selectedDeliveryMethod = self.payByLinkData.deliveryMethods.selectedMethod

        self.setupValidationSubscription()
    }

    func presentDeliveryMethods() {
        self.router.presentDeliveryMethods(
            deliveryMethods: self.payByLinkData.deliveryMethods.availableMethods,
            selectedDeliveryMethodId: self.selectedDeliveryMethod?.id,
            onDone: { [weak self] selectedDeliveryMethodId in
                self?.selectedDeliveryMethod = self?.payByLinkData.deliveryMethods.availableMethods.first {
                    $0.id == selectedDeliveryMethodId
                }
            })
    }

    func presentClientSearch() {
        self.router.presentClientSearch { [weak self] selectedClient in
            self?.selectedClient = selectedClient
        }
    }

    private func setupValidationSubscription() {
        Publishers.CombineLatest3(self.$selectedClient, self.$selectedDeliveryMethod, self.$payByLinkData)
            .map {
                let isValidAttributeSelection = $2.products.filter { product in
                    return product.hasAllAttributesSelected
                }.isEmpty
                return $0 != nil && $1 != nil && isValidAttributeSelection }
            .sink { [weak self] isValid in
                self?.isValidOrder = isValid
            }.store(in: &self.cancellables)
    }

    func didTapCreateOrder() {
        guard self.isValidOrder else {
            self.handleInvalidOrderTap()
            return
        }
        guard let clientId = self.selectedClient?.id, let deliveryMethodId = self.selectedDeliveryMethod?.id else {
            return
        }
        self.orderCreating = true
        let products = self.payByLinkData.products.map { OrderCreationItem(productId: $0.id,
                                                                           quantity: $0.quantity) }
        self.payByLinkAdapter.createOrder(products: products,
                                          clientId: clientId, deliveryMethodId: deliveryMethodId)
            .catch { error in
                return Just(.failure(ErrorDisplayable(error)))
            }
            .sink(receiveValue: { [weak self] result in
                self?.orderCreating = false
                switch result {
                case .failure(let error):
                    ToastView.show(text: error.localizedDescription, style: .error)
                case .success(let orderId):
                    self?.presentOrderDetailsPage(orderId: orderId)
                }
            })
            .store(in: &self.cancellables)
    }

    private func handleInvalidOrderTap() {
        if self.selectedClient == nil {
            return ToastView.show(text: Labels.selectedClientMissingError, style: .error)
        }
        if self.selectedDeliveryMethod == nil {
            return ToastView.show(text: Labels.selectedDeliveryMethodMissingError, style: .error)
        }
        let allAttributesSelected = self.payByLinkData.products.filter { product in
            return product.hasAllAttributesSelected
        }.isEmpty
        if !allAttributesSelected {
            return ToastView.show(text: Labels.missingProductAttributes, style: .error)
        }
    }

    func didTapEditProductDetails(for product: PayByLinkData.ProductDetails, at index: Int) {
        guard let masterId = product.productMasterId else { return }
        self.router.presentAttributeSelection(for: masterId,
                                              initiallySelectedAttributes: product.attributes.selectedAttributes ?? [:],
                                              onDone: { [weak self] newProductId in
            self?.handleAttributeSelection(newProductId: newProductId, at: index)
        })
    }

    func didTapDeleteProduct(at index: Int) {
        var newProducts = self.payByLinkData.products
        newProducts.remove(at: index)
        self.payByLinkData = PayByLinkData(products: newProducts, deliveryMethods: self.payByLinkData.deliveryMethods)
    }

    private func handleAttributeSelection(newProductId: String, at index: Int) {
        var productIds = self.payByLinkData.products.map { $0.id }
        productIds[index] = newProductId
        self.payByLinkAdapter.getPayByLinkProductData(for: productIds)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    ToastView.show(text: error.localizedDescription, style: .error)
                case .finished:
                    break
                }
            } receiveValue: { result in
                switch result {
                case .failure(let error):
                    ToastView.show(text: error.localizedDescription, style: .error)
                case .success(let newData):
                    self.payByLinkData = newData
                }
            }.store(in: &self.cancellables)
    }

    private func presentOrderDetailsPage(orderId: String) {
        self.router.presentOrderDetailsPage(orderId: orderId, onClose: self.onClose)
    }
}

private extension PayByLinkData.ProductDetails {
    var hasAllAttributesSelected: Bool {
        // If there are no attributes to select, we don't need any attributes selected
        if self.attributes.attributes.isEmpty { return false }
        // If there are attributes to select, we have to make sure that they are selected
        return self.attributes.attributes.count != self.attributes.selectedAttributes?.count
    }
}
