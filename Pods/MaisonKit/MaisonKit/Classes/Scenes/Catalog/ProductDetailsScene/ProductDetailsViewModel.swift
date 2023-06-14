// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

/// The view model used in the product details screen.
/// This view model Is responsible for retrieving the product details
final class ProductDetailsViewModel: ObservableObject {

    @Published private(set) var title: String?
    @Published private(set) var detailsDisplayable = ResultState<ProductDetailsDisplayable, ErrorDisplayable>.waiting
    // Actions to display on the product details screen
    @Published private(set) var availableActions: ProductDetailsActions = ProductDetailsActions()
    // Controls the accordion opened items
    @Published var openedInformationItems: [Bool] = []
    // Controls whether we show the details of stock or not
    @Published var privacyMode: PrivacyMode = UserDefaults.standard.privacyMode

    // Attribute selection properties
    @Published var selectedAttributesValues: SelectedProductAttributes = [:]
    @Published private(set) var isLoadingAttributes = false

    // Holds the retrieved stock information
    @Published private(set) var stockDetails: ResultState<StockInformationDisplayable, ErrorDisplayable> = .waiting
    private var productInformationItems: [ProductInformationItem]?

    @Inject private var adapter: CatalogDetailsAdapter
    @Inject private var curatorAdaper: ProductCuratorAdapter
    private var cancellables = Set<AnyCancellable>()
    private var context: ProductDetailsInitialisationContext

    private let router: ProductDetailsRouter

    fileprivate init(context: ProductDetailsInitialisationContext, router: ProductDetailsRouter) {
        self.context = context
        self.router = router

        UserDefaults.standard.publisher(for: \.privacyMode)
            .sink { [weak self] newMode in
            self?.privacyMode = newMode
            self?.availableActions = self?.detailsDisplayable.value?.actions() ?? ProductDetailsActions()
        }.store(in: &self.cancellables)

        NotificationCenter.default.publisher(for: .presentStockNotification).sink { [weak self] _ in
            guard let self = self else { return }
            self.router.presentStockDetails(context: self.context, datasource: self)
        }.store(in: &self.cancellables)

        self.$selectedAttributesValues
            .removeDuplicates()
            .sink { [weak self] newAttributes in
                self?.fetchProductDetails(attributes: newAttributes)
            }.store(in: &self.cancellables)

        self.curatorAdaper.getProductsPublisher()
            .receive(on: DispatchQueue.main)
            .compactMap { [weak self] _ in return self?.detailsDisplayable.value?.actions() }
            .assign(to: &self.$availableActions)

        self.$detailsDisplayable
            .compactMap { $0.value?.actions() }
            .assign(to: &self.$availableActions)
    }

    func fetchProductDetails(attributes: SelectedProductAttributes? = nil) {
        if attributes == nil {
            self.detailsDisplayable = .loading(nil)
        }
        self.isLoadingAttributes = true
        self.adapter.getProductDetails(productId: self.context.masterId ?? self.context.id,
                                       selectedAttributes: attributes?.mapValues(\.id)).handleEvents(receiveOutput: { [weak self] result in
            self?.isLoadingAttributes = false
            guard let context = result.value?.context else { return }
            self?.context = context.isProduct ? .product(productId: context.id, masterId: context.masterId) : .master(masterId: context.id)
        })
            .map(ResultState.fromResult)
            .catch { return Just(.failed(ErrorDisplayable($0))) }
            .sink(receiveValue: { [weak self] state in
                guard let self = self else { return }
                self.detailsDisplayable = state
                if let displayable = state.value {
                    self.initFoundResult(displayable: displayable)
                }
                self.title = state.value?.context.title
                self.fetchProductStockIfNeeded()
            })
            .store(in: &self.cancellables)
    }

    /// Retrieves stock information.
    func fetchProductStockIfNeeded() {
        guard case .product = self.context else {
            return
        }
        self.stockDetails = .loading(self.stockDetails.value)
        self.adapter.getProductStock(productId: self.context.id)
            .map(ResultState.fromResult)
            .catch { return Just(.failed(ErrorDisplayable($0))) }
            .weakAssign(to: \.stockDetails, on: self)
            .store(in: &self.cancellables)
    }

    private func initFoundResult(displayable: ProductDetailsDisplayable) {
        self.productInformationItems = nil
        self.openedInformationItems = Array(repeating: false, count: displayable.context.informationItems.count)
        if !displayable.context.informationItems.isEmpty {
            self.openedInformationItems[0] = true
        }

        if let selectedAttributesDisplayable = displayable.context.attributes?.selectedAttributes,
            self.selectedAttributesValues != selectedAttributesDisplayable {
            self.selectedAttributesValues = selectedAttributesDisplayable
        }
    }

    func presentAttributeItemsSelection(_ attribute: ProductAttributes.Attribute) {
        self.presentProductAttributes(for: attribute)
    }
}

extension ProductDetailsViewModel: ActionHandlerViewModel {
    var actionHandlingRouter: ActionScenePresenterRouter { return self.router }
}

// MARK: - Routing
extension ProductDetailsViewModel {
    func presentSimilarProducts() {
        if let productId = self.detailsDisplayable.value?.context.id {
            self.router.presentSimilarProducts(productId)
        }
    }

    func presentCurator() {
        self.router.presentCurator()
    }

    func presentProductAttributes(for attribute: ProductAttributes.Attribute) {
        guard let masterId = self.context.masterId else { return }
        self.router.presentProductAttributes(masterId: masterId,
                                             attribute: attribute,
                                             otherSelectedAttributes: self.selectedAttributesValues,
                                             initiallySelectedItemID: self.selectedAttributesValues[attribute.id]?.id, onDone: { [weak self] newSelectedAttribute in
            guard let self = self else { return }
            if let newId = newSelectedAttribute {
                guard let title = attribute.row.items.first(where: { $0.id == newId })?.title else { return }

                self.selectedAttributesValues[attribute.id] = ProductAttributes.AttributeValue(id: newId,
                                                                                               title: title)
            } else {
                self.selectedAttributesValues.removeValue(forKey: attribute.id)
            }
        }, onSelectedAttributeRemoved: { [weak self] removedAttributeId in
            guard let self = self else { return }
            self.selectedAttributesValues.removeValue(forKey: removedAttributeId)
        })
    }
}

// MARK: - Analytics
extension ProductDetailsViewModel {
    func logViewAnalytics() {
        Analytics.log(ProductDetailsViewedEvent(productId: self.context.id))
    }
}

extension ProductDetailsViewModel {

    /// A convenience initializer to create a `ProductDetailsViewModel` with a "master" product (e.g. a product with no selected sizes).
    /// - Parameters:
    ///   - productMasterId: the identifier for the product.
    ///   This is usually a product reference or something else that uniquely identifies a product without specifying things like sizing.
    ///   - router: the router for this view model. Handles navigation away from the scene this view model represents.
    convenience init(productMasterId: String, router: ProductDetailsRouter) {
        self.init(context: .master(masterId: productMasterId), router: router)
    }

    /// A convenience initializer to create a `ProductDetailsViewModel` with a "master" product (e.g. a product with no selected sizes) ID and a product ID (usually a SKU)
    /// - Parameters:
    ///   - productId: the ID of the product.
    ///   This usually identifies the product uniquely, including information like sizing. Sometimes referred to as SKU.
    ///   - productMasterId: the identifier for the product.
    ///   This is usually a product reference or something else that uniquely identifies a product without specifying things like sizing.
    ///   - router: the router for this view model. Handles navigation away from the scene this view model represents.
    convenience init(productId: String, productMasterId: String?, router: ProductDetailsRouter) {
        self.init(context: .product(productId: productId, masterId: productMasterId), router: router)
    }
}

extension ProductDetailsViewModel: ProductStockDatasource {

    // MARK: Stock
    func onRefresh() {
        self.fetchProductStockIfNeeded()
    }

    var stockDetailsSourcePublisher: AnyPublisher<ResultState<StockInformationDisplayable, ErrorDisplayable>, Never> {
        return self.$stockDetails.share().eraseToAnyPublisher()
    }

    // MARK: Attributes
    var productAttributes: AnyPublisher<ResultState<[ProductAttributes.Attribute]?, ErrorDisplayable>, Never> {
        return self.$detailsDisplayable.compactMap { $0.map { $0.context.attributes?.attributes } }
            .eraseToAnyPublisher()
    }

    var selectedAttributes: AnyPublisher<SelectedProductAttributes, Never> {
        return self.$selectedAttributesValues.eraseToAnyPublisher()
    }

    var productAttributeRows: AnyPublisher<ResultState<ProductAttributeRows, ErrorDisplayable>, Never> {
        return self.$detailsDisplayable.map { resultState in
            return resultState.map { value in
                return value.context.attributes?.attributes.reduce([:], { acc, next in
                    var acc = acc
                    acc[next.id] = next.row
                    return acc
                }) ?? [:]
            }
        }.eraseToAnyPublisher()
    }

    func updateSelectedAttributes(newSelectedAttributes: SelectedProductAttributes) {
        self.selectedAttributesValues = newSelectedAttributes
    }
}

// MARK: - Adding themed css/html
extension ProductDetailsViewModel {

    func injectCssIfNeeded(into items: [ProductInformationItem], cssString: CSSString?) -> [ProductInformationItem] {
        // Building the html few times overloads the CPU (specially when using French accents, for example "é")
        // The suspicion is that comparing the text to find if it needs redrawn takes a long time for very very long
        // strings. The HTML may be very long, also because it includes the CSS and the CSS usually has the fonts
        // embedded as base64 strings.
        // Here we rebuild the the array only when needed
        if let productInformationItems = self.productInformationItems {
            return productInformationItems
        }
        let htmlBuilder = HTMLBuilder(cssString: cssString)
        let newItems: [ProductInformationItem] = items.map { item in
            let content: ProductInformationItem.ContentType = {
                switch item.content {
                case .text(let text):
                    return .text(text)
                case .html(let html):
                    return .html(htmlBuilder.build(content: html))
                }
            }()
            return ProductInformationItem(id: item.id, title: item.title, content: content)
        }
        self.productInformationItems = newItems
        return newItems
    }
}
