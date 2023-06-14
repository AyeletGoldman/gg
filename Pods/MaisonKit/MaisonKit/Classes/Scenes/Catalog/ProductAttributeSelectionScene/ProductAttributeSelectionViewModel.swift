// Copyright © 2021 LVMH. All rights reserved.

import Combine
import SwiftUI
import Biodag

typealias SelectedAttributePair = (ProductAttributes.Attribute, ProductAttributes.AttributeValue)

final class ProductAttributeSelectionViewModel: ObservableObject {

    private let masterId: String
    private let attribute: ProductAttributes.Attribute

    var title: String {
        self.attribute.title
    }

    var shouldShowExternalAttributeRemoval: Bool {
        return self.onSelectedAttributeRemoved != nil
    }

    @Published private(set) var options: ResultState<[ProductAttributeItem], ErrorDisplayable> = .waiting
    @Published private(set) var otherSelectedAttributes: ResultState<[SelectedAttributePair], ErrorDisplayable> = .waiting
    @Published var selectedAttributeItemId: String?
    let shouldShowToolbar: Bool

    private var cancellables = Set<AnyCancellable>()

    private let onSelectedAttributeRemoved: ((ProductAttributes.Attribute.ID) -> Void)?
    let onDone: ((ProductAttributeItem.ID?) -> Void)?
    let onCancel: (() -> Void)?

    @Inject private var adapter: CatalogDetailsAdapter

    init(masterId: String,
         attribute: ProductAttributes.Attribute,
         otherSelectedAttributes: SelectedProductAttributes,
         initiallySelectedItemID: String? = nil,
         shouldShowToolbar: Bool = true,
         onCancel: (() -> Void)? = nil,
         onSelectedAttributeRemoved: ((ProductAttributes.Attribute.ID) -> Void)? = nil,
         onDone: ((ProductAttributeItem.ID?) -> Void)? = nil,
         onUpdate: ((ProductAttributeItem.ID?) -> Void)? = nil) {
        self.masterId = masterId
        self.attribute = attribute
        self.selectedAttributeItemId = initiallySelectedItemID
        self.shouldShowToolbar = shouldShowToolbar
        self.onSelectedAttributeRemoved = onSelectedAttributeRemoved
        self.onCancel = onCancel
        self.onDone = onDone

        if let onUpdate = onUpdate {
            self.$selectedAttributeItemId
                .removeDuplicates()
                .dropFirst()
                .sink { newId in
                    onUpdate(newId)
                }.store(in: &self.cancellables)
        }

        self.fetchProductDetails(otherAttributes: otherSelectedAttributes)

        self.options = .found(attribute.row.items)
    }

    private func fetchProductDetails(otherAttributes: SelectedProductAttributes) {
        self.adapter.getProductDetails(productId: self.masterId, selectedAttributes: otherAttributes.mapValues(\.id))
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.updateOtherSelectedAttributesIfNeeded(.loading(nil))
                self?.options = .loading(nil)
            })
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.updateOtherSelectedAttributesIfNeeded(.failed(ErrorDisplayable(error)))
                case .finished:
                    break
                }
            } receiveValue: { [weak self, attribute] productDetails in
                // We have fetched the product details, so we update the options and the other selected attributes
                let otherSelectedAttributes = ResultState.fromResult(result: productDetails.map { detailsDisplayable -> [SelectedAttributePair] in
                    return detailsDisplayable.context.attributes?.attributes.compactMap {
                        // From the attribute we get back, we are interested only in the ones that are selected
                        guard let value = otherAttributes[$0.id] else { return nil }
                        // We are also not interested in the _current_ attribute we are editing
                        guard $0.id != attribute.id else { return nil }
                        // Return a pair of (attribute, value)
                        return ($0, value)
                    } ?? []
                })
                self?.updateOtherSelectedAttributesIfNeeded(otherSelectedAttributes)
                // To update the options we get the attribute from the list of attributes returned
                let currentAttribute = productDetails.value?.context.attributes?.attributes.first(where: { $0.id == attribute.id })
                let attributeItems = currentAttribute.map { $0.row.items } ?? []
                self?.options = .found(attributeItems)
            }.store(in: &self.cancellables)
    }

    private func updateOtherSelectedAttributesIfNeeded(_ newValue: ResultState<[SelectedAttributePair], ErrorDisplayable>) {
        guard self.shouldShowExternalAttributeRemoval else {
            self.otherSelectedAttributes = .found([])
            return
        }
        self.otherSelectedAttributes = newValue
    }

    func removeOtherAttribute(attribute: ProductAttributes.Attribute) {
        // Filter out the local copy of other attributes
        self.otherSelectedAttributes = self.otherSelectedAttributes.map {
            return $0.filter { (attr, _) in
                attribute.id != attr.id
            }
        }
        // Transform the array into a dictionary
        let currentSelectedAttributes = self.otherSelectedAttributes.value?.reduce(SelectedProductAttributes()) { acc, next in
            var acc = acc
            acc[next.0.id] = next.1
            return acc
        } ?? [:]
        // Ask for updated displayables
        self.fetchProductDetails(otherAttributes: currentSelectedAttributes)
        // Inform the listener
        self.onSelectedAttributeRemoved?(attribute.id)
    }
}
