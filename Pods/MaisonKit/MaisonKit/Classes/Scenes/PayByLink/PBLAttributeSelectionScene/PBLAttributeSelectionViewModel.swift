// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Biodag
import Combine

final class PBLAttributeSelectionViewModel: ObservableObject {

    private let productMasterID: String
    private let onDone: (String) -> Void
    private let onCancel: () -> Void
    private let router: PBLAttributeSelectionRouter

    @Inject private var adapter: PayByLinkAdapter
    @Inject private var productAdapter: CatalogDetailsAdapter

    @Published private(set) var products: ResultState<PBLProductInformationDisplayable, ErrorDisplayable> = .waiting
    @Published private(set) var stock: ResultState<StockInformationDisplayable, ErrorDisplayable> = .waiting

    @Published var privacyMode: PrivacyMode = UserDefaults.standard.privacyMode
    @Published var selectedAttributes: SelectedProductAttributes

    @Published var isValidSelection: Bool = false

    private var cancellables = Set<AnyCancellable>()

    init(productMasterID: String,
         initialSelectedAttributes: SelectedProductAttributes,
         router: PBLAttributeSelectionRouter,
         onDone: @escaping (String) -> Void,
         onCancel: @escaping () -> Void) {
        self.productMasterID = productMasterID
        self.selectedAttributes = initialSelectedAttributes
        self.onDone = onDone
        self.onCancel = onCancel
        self.router = router

        Publishers.Zip(self.$products.compactMap { $0.value?.attributes }, self.$selectedAttributes).map { attributes, selectedAttributes in
            attributes.attributes.count == selectedAttributes.count
        }
        .weakAssign(to: \.isValidSelection, on: self)
        .store(in: &self.cancellables)

        self.$selectedAttributes
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.fetchProductData()
            }.store(in: &self.cancellables)
    }

    func didTapDone() {
        guard let productId = self.products.value?.productId else { return }
        self.onDone(productId)
    }

    func didTapCancel() {
        self.onCancel()
    }

    func presentAttributeItemsSelection(_ attribute: ProductAttributes.Attribute) {
        var selectedAttributes = self.selectedAttributes
        let selectedAttribute = selectedAttributes.removeValue(forKey: attribute.id)?.id
        self.router.presentProductAttributes(masterId: self.productMasterID,
                                             attribute: attribute,
                                             otherSelectedAttributes: selectedAttributes,
                                             initiallySelectedItemID: selectedAttribute,
                                             onUpdate: { [weak self] newAttributeId in
            self?.handleUpdatedAttribute(attribute: attribute, newValueID: newAttributeId)
        }, onSelectedAttributeRemoved: { [weak self] attributeToRemove in
            self?.selectedAttributes.removeValue(forKey: attributeToRemove)
        })
    }

    private func handleUpdatedAttribute(attribute: ProductAttributes.Attribute, newValueID: ProductAttributeItem.ID?) {
        if let newId = newValueID {
            guard let att = attribute.row.items.first(where: { $0.id == newId }) else { return }
            self.selectedAttributes[attribute.id] = ProductAttributes.AttributeValue(id: newId, title: att.title)
        } else {
            self.selectedAttributes.removeValue(forKey: attribute.id)
        }
    }

    func fetchProductData(for productOrMasterID: String? = nil) {
        let productId = productOrMasterID ?? self.productMasterID
        let attributes = self.selectedAttributes.mapValues(\.id)
        self.adapter.getPBLProductInformation(for: productId, attributes: attributes)
            .handleEvents(receiveSubscription: { _ in
                self.products = .loading(self.products.value)
            })
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.products = .failed(ErrorDisplayable(error))
                }
            } receiveValue: { [weak self] productDetails in
                switch productDetails {
                case .failure(let error):
                    self?.products = .failed(error)
                case .success(let displayable):
                    self?.products = .found(displayable)
                    if let productId = displayable.productId {
                        self?.fetchStockDetails(for: productId)
                    }
                }
            }.store(in: &self.cancellables)
    }

    private func fetchStockDetails(for productId: String) {
        self.productAdapter.getProductStock(productId: productId)
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.stock = .loading(nil)
            })
            .map(ResultState.fromResult)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.stock = .failed(ErrorDisplayable(error))
                }
            }
            receiveValue: { [weak self] stockDetails in
                self?.stock = stockDetails
            }.store(in: &self.cancellables)
    }
}
