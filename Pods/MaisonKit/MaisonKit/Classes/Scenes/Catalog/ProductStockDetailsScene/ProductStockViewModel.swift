// Copyright © 2020 LVMH. All rights reserved.

import Combine

public final class ProductStockViewModel: ObservableObject {

    private enum Labels {
        static let pageTitle = MKLocalizedString("product-stock.navigation-bar.title",
                                                 comment: "The title of the Product stock string, in the navigation bar")
    }

    /// Holds a ResultState for the StockInformationDisplayable
    @Published var stockDetails: ResultState<StockInformationDisplayable, ErrorDisplayable> = .waiting
    @Published var productAttributes: ResultState<[ProductAttributes.Attribute]?, ErrorDisplayable> = .waiting
    @Published var attributeRows = ResultState<ProductAttributeRows, ErrorDisplayable>.waiting
    @Published var selectedAttributes: SelectedProductAttributes = [:]

    private let context: ProductDetailsInitialisationContext
    private weak var datasource: ProductStockDatasource?
    private let router: ProductStockRouter
    private var cancellables = Set<AnyCancellable>()

    let onDismiss: () -> Void
    /// Holds the page title
    var title: String { Labels.pageTitle }

    /// Creates a new `ProductStockViewModel`
    /// - Parameters:
    ///   - context: The context of the product we are wanting to check stock for. This is either a product or a product master.
    ///   - datasource: The source for the information in the stock view
    ///   - router: A router instance to be able to present the product attributes detail views
    ///   - onDismiss: A closure to invoke when the user has finished viewing details stock information
    public init(context: ProductDetailsInitialisationContext,
                datasource: ProductStockDatasource,
                router: ProductStockRouter,
                onDismiss: @escaping () -> Void) {
        self.context = context
        self.datasource = datasource
        self.router = router
        self.onDismiss = onDismiss

        datasource.stockDetailsSourcePublisher.assign(to: &self.$stockDetails)
        datasource.selectedAttributes.removeDuplicates().assign(to: &self.$selectedAttributes)
        datasource.productAttributeRows.assign(to: &self.$attributeRows)
        datasource.productAttributes.assign(to: &self.$productAttributes)

        // When selected attributes changes, inform the datasource and refresh
        self.$selectedAttributes.dropFirst().sink { [weak self] newAttributes in
            self?.datasource?.updateSelectedAttributes(newSelectedAttributes: newAttributes)
            self?.onRefresh()
        }.store(in: &self.cancellables)
    }

    func onRefresh() {
        self.datasource?.onRefresh()
    }

    func presentSelectedFilter(attribute: ProductAttributes.Attribute) {
        guard let productMasterID = self.context.masterId else { return }
        self.router.presentProductAttributes(masterId: productMasterID,
                                             attribute: attribute,
                                             otherSelectedAttributes: self.selectedAttributes,
                                             initiallySelectedItemID: self.selectedAttributes[attribute.id]?.id,
                                             onDone: { [weak self] newSelectedAttribute in
            guard let self = self else { return }
            if let newId = newSelectedAttribute {
                guard let title = self.attributeRows.value?[attribute.id]?.items.first(where: { $0.id == newId })?.title else {
                    return
                }
                self.selectedAttributes[attribute.id] = ProductAttributes.AttributeValue(id: newId,
                                                                                         title: title)
            }
        })
    }
}
