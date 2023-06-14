//  Copyright © 2021 LVMH. All rights reserved.

import Combine
import Biodag

final class ProductCuratorViewModel: ObservableObject {

    private enum Labels {
        static let clearAlertTitle = MKLocalizedString("product-curator.alert.clear.title",
                                                       comment: "Title for alert asking user if they want to clear the curator")
        static let clearAlertMessage = MKLocalizedString("product-curator.alert.clear.message",
                                                         comment: "Message for alert asking user if they want to clear the curator")
        static let clearAlertCancelButtonTitle = MKLocalizedString("product-curator.alert.clear.button.cancel.title",
                                                                   comment: "Title for Cancel button in alert asking user if they want to clear the curator")
        static let clearAlertClearButtonTitle = MKLocalizedString("product-curator.alert.clear.button.clear.title",
                                                                  comment: "Title for 'Clear' button in alert asking user if they want to clear the curator")

        static let removeItemErrorTitle = MKLocalizedString("product-curator.remove-item.toast.error.title",
                                                            comment: "The message to show in the toast view when an error occurs removing an item from the curator")
        static let clearAllItemsErrorTitle = MKLocalizedString("product-curator.clear.toast.error.title",
                                                               comment: "The message to show in the toast view when an error occurs clearing the curator")
    }

    private let onClose: () -> Void
    private let router: ProductCuratorRouter

    private var cancellables = Set<AnyCancellable>()

    @Published private(set) var products: ResultState<[CuratedProductDisplayable], ErrorDisplayable> = .waiting
    @Published private(set) var actions: ResultState<[ButtonAction], ErrorDisplayable> = .waiting
    @Published var alertContext: AlertContext?

    @Inject private var adapter: ProductCuratorAdapter

    init(router: ProductCuratorRouter, onClose: @escaping () -> Void) {
        self.onClose = onClose
        self.router = router
    }

    func didTapClose() {
        self.onClose()
    }

    func didTapClear() {
        self.alertContext = AlertContext(title: Labels.clearAlertTitle,
                                         message: Labels.clearAlertMessage,
                                         primaryButton: AlertContext.Button(title: Labels.clearAlertCancelButtonTitle,
                                                                            style: .default(action: { })),
                                         secondaryButton: AlertContext.Button(title: Labels.clearAlertClearButtonTitle,
                                                                              style: .destructive(action: { [weak self] in
            self?.clearCurator()
        })))
    }

    func listenToProductChanges() {
        self.adapter.getProductsPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.fetchProductsAndActions()
            }).store(in: &self.cancellables)
    }

    private func fetchProductsAndActions() {
        if self.products.value == nil {
            self.products = .loading(nil)
        }
        self.actions = .loading(self.actions.value)

        // Fetching products
        let productsPublisher = self.adapter.getProductDisplayables()
            .map(ResultState.fromResult)
            .catch {
                return Just(.failed(ErrorDisplayable($0)))
            }

        // Fetching available actions
        let actionsPublisher = self.adapter.fetchProductCuratorActions()
            .map(ResultState.fromResult)
            .catch { Just(.failed(ErrorDisplayable($0))) }

        // Fetch both at the same time
        let publisher = Publishers.CombineLatest(productsPublisher, actionsPublisher)

        ProductCuratorQueue.shared.addOperation(publisher) { [weak self] (productsResult, actionsResult) in
            self?.products = productsResult
            self?.actions = actionsResult
        }
    }

    private func clearCurator() {
        let publisher = self.adapter.clear()
            .catch { error in
                return Just(.failure(ErrorDisplayable(error)))
            }

        ProductCuratorQueue.shared.addOperation(publisher,
                                                receiveValue: { result in
            switch result {
            case .success: break
            case .failure:
                ToastView.show(text: Labels.clearAllItemsErrorTitle, style: .error)
            }
        })
    }

    func didTapDeleteButton(for productId: String) {
        if case .found(let items) = self.products {
            // So we get an animation for swipe-to-delete
            self.products = .found(items.filter { $0.id != productId })
        }

        let publisher = self.adapter.removeProduct(reference: productId)
            .catch {
                return Just(.failure(ErrorDisplayable($0)))
            }

        ProductCuratorQueue.shared.addOperation(publisher,
                                                receiveValue: { result in
            switch result {
            case .success: break
            case .failure:
                ToastView.show(text: Labels.removeItemErrorTitle, style: .error)
            }
        })
    }

    func presentChoosePhotos(for productId: String) {
        self.router.presentChoosePhotos(
            getAssetsClosure: {
                return self.adapter.getProductAssets(reference: productId)
            }, saveSelectedAssetsClosure: { selectedIds, personalAssets in
                return self.adapter.updateSelectedProductAssets(reference: productId, assetIds: selectedIds, personalAssets: personalAssets)
            })
    }
}

extension ProductCuratorViewModel: ActionHandlerViewModel {
    var actionHandlingRouter: ActionScenePresenterRouter { self.router }
}
