// Copyright © 2020 LVMH. All rights reserved.

import MaisonKit
import Combine

extension NetworkAdapter: CatalogAdapter {

    func getProductCategories(categoryId: String?) -> AnyPublisher<Result<ProductCategoriesScreenDisplayable, ErrorDisplayable>, Error> {
        return self.networking.getProductsV1Categories(categoryId: categoryId,
                                                       acceptLanguage: self.currentAcceptLanguageHeaderValue)
        .unwrapDefaultSuccessResponse()
        .mapToResultViewModel { response in
            return .init(from: response)
        }
    }

    func getProductsByCategory(categoryId: String?,
                               filters: MaisonKit.SelectedFilters?,
                               sortBy: SelectedSortValue?,
                               searchText: String?,
                               pageIndex: Int) -> AnyPublisher<Result<ProductsScreenDisplayable, ErrorDisplayable>, Error> {
        return self.getProducts(categoryId: categoryId,
                                similarProductId: nil,
                                filters: filters,
                                sortBy: sortBy,
                                searchText: searchText,
                                pageIndex: pageIndex)
    }

    func getSimilarProducts(to productId: String,
                            filters: MaisonKit.SelectedFilters?,
                            sortBy: SelectedSortValue?,
                            searchText: String?,
                            pageIndex: Int) -> AnyPublisher<Result<ProductsScreenDisplayable, ErrorDisplayable>, Error> {
        return self.getProducts(categoryId: nil,
                                similarProductId: productId,
                                filters: filters,
                                sortBy: sortBy,
                                searchText: searchText,
                                pageIndex: pageIndex)
    }

    func searchProducts(searchText: String,
                        filters: MaisonKit.SelectedFilters?,
                        sortBy: SelectedSortValue?,
                        pageIndex: Int) -> AnyPublisher<Result<ProductsScreenDisplayable, ErrorDisplayable>, Error> {
        return self.getProducts(categoryId: nil,
                                similarProductId: nil,
                                filters: filters,
                                sortBy: sortBy,
                                searchText: searchText,
                                pageIndex: pageIndex)
    }

    // swiftlint:disable:next function_parameter_count
    private func getProducts(categoryId: String?,
                             similarProductId: String?,
                             filters: MaisonKit.SelectedFilters?,
                             sortBy: SelectedSortValue?,
                             searchText: String?,
                             pageIndex: Int) -> AnyPublisher<Result<ProductsScreenDisplayable, ErrorDisplayable>, Error> {
        let apiFilters: [String: ProductFilterRequestConstraint]? = filters?.mapValues {
            .init(_operator: $0.count > 1 ? ._in : .eq, value: $0)
        }
        guard let storeCode = NetworkAdapter.currentStoreCode, let currencyCode = NetworkAdapter.currentCurrencyCode else {
            return Fail(error: ErrorDisplayable(localizedDescription: "No store or currency selected. Please log out and back in.")).eraseToAnyPublisher()
        }
        return self.networking.getProductsV1Products(shopId: storeCode,
                                                     currencyCode: currencyCode,
                                                     query: searchText,
                                                     categoryId: categoryId,
                                                     fetchSubcategories: true,
                                                     similarTo: similarProductId,
                                                     filters: apiFilters,
                                                     sortKey: sortBy, pageSize: nil,
                                                     pageIndex: pageIndex,
                                                     acceptLanguage: self.currentAcceptLanguageHeaderValue)
        .unwrapDefaultSuccessResponse()
        .handleEvents(receiveOutput: { output in
            // Any products we receive from the API we store in the Search Index. This makes them available to Core Spotlight.
            let items = output.products.map { product -> SearchableItem in
                switch product {
                case .productSummary(let product):
                    return SearchableProduct(context: .product(productId: product.sku, masterId: product.masterId),
                                             localizedName: product.name,
                                             localizedDescription: product.shortDescription ?? product.category.name,
                                             thumbnailURL: product.image)
                case .masterSummary(let master):
                    return SearchableProduct(context: .master(masterId: master.id),
                                             localizedName: master.name,
                                             localizedDescription: master.shortDescription ?? master.category.name,
                                             thumbnailURL: master.image)
                }
            }
            SearchIndex.default.add(items: items, onDone: nil)
        }).eraseToAnyPublisher()
            .mapToResultViewModel { response in
                return ProductsScreenDisplayable(from: response)
            }
    }

    func getProductSummaries(productIds: [String]) -> AnyPublisher<Result<[ProductListCellDisplayable], ErrorDisplayable>, Error> {
        return self.networking.getProductsV1ProductsProductIdsOrUpcs(productIdsOrUpcs: productIds,
                                                                     shopId: Self.currentStoreCode,
                                                                     currencyCode: Self.currentCurrencyCode,
                                                                     ignoreNotFoundErrors: false,
                                                                     attributes: nil,
                                                                     acceptLanguage: self.currentAcceptLanguageHeaderValue)
        .unwrapDefaultSuccessResponse()
        .mapToResultViewModel { result in
            result.products.compactMap {
                return ProductListCellDisplayable(from: $0)
            }
        }
    }
}

extension ProductsScreenDisplayable {
    init(from result: ProductsSearchResult) {
        let sortItems = result.sort?.availableSorts.map { SortItem(id: $0.key, title: $0.display) }
        self.init(items: result.products.map { .init(from: $0) },
                  filters: result.filters.availableFilters.map { FilterData(from: $0) },
                  selectedFilters: .init(from: result.filters),
                  sortItems: sortItems ?? [],
                  selectedSortValue: result.sort?.selectedSortKey,
                  pageInformation: PageInformation(pageNumber: result.pagination.actualPageIndex,
                                                   numberOfPages: result.pagination.totalPageCount,
                                                   totalAmountOfElements: result.pagination.totalCount)
        )
    }
}

extension MaisonKit.SelectedFilters {
    init(from filters: Filters) {
        self = filters.selectedFilters.reduce(into: [:]) {
            $0[$1.name] = $1.value.map { $0.value }
        }
    }
}

extension FilterData {
    init(from filter: AvailableFilters) {
        switch filter {
        case .filterText(let textFilter):
            self.init(from: textFilter)
        case .filterImage(let imagesFilter):
            self.init(from: imagesFilter)
        }
    }
}

extension FilterData {
    init(from textFilter: FilterText) {
        self.init(title: textFilter.displayName,
                  pluralTitleFormat: MKLocalizedString("Several filters selected",
                                                       comment: "The title to display when there are several filters selected"),
                  viewBuilder: .textFilter(
                    .init(id: textFilter.name,
                          filterItems: textFilter.value.map { .init(displayName: $0.displayName, value: $0.value) },
                          selectionMode: textFilter.isMultiSelect ? .multiple : .single,
                          required: textFilter.isRequired)))
    }
}

extension FilterData {
    init(from imagesFilter: FilterImage) {
        self.init(title: imagesFilter.displayName,
                  pluralTitleFormat: MKLocalizedString("Several filters selected",
                                                       comment: "The title to display when there are several filters selected"),
                  viewBuilder: .imageFilter(
                    .init(id: imagesFilter.name,
                          filterItems: imagesFilter.value.map {
                              .init(id: $0.value, title: $0.displayName, content: .image(buildImageSource($0.imageURL))) },
                          displayType: .rows,
                          selectionMode: imagesFilter.isMultiSelect ? .multiple : .single,
                          required: imagesFilter.isRequired)))
    }
}

extension ProductListCellDisplayable {
    init(from cell: ProductsSearchResult.ProductsSearchResultProducts) {
        switch cell {
        case .productSummary(let product):
            self = .product(.init(from: product))
        case .masterSummary(let master):
            self = .master(.init(from: master))
        }
    }
}

extension ProductSummaryDisplayable {
    init(from product: ProductSummary) {
        let price: String? = PriceType.getPrice(price: product.price)
        let salePrice: String? = PriceType.getPrice(price: product.price, withDiscount: true)
        self.init(productId: product.id,
                  masterId: product.masterId,
                  sku: product.sku,
                  image: buildImageSource(product.image),
                  properties: product.attributes?.map { .init(label: $0.displayName, value: $0.displayValue) } ?? [],
                  subtitle: product.category.name,
                  price: price,
                  salePrice: salePrice,
                  title: product.name,
                  availability: product.availability.map { ProductAvailability($0) },
                  availableColors: getColors(from: product.colorAttribute))
    }
}

extension ProductMasterSummaryDisplayable {
    init(from master: MasterSummary) {
        let price: String? = PriceType.getPrice(priceRange: master.priceRange)
        
        var salePrice: String? = PriceType.getPrice(priceRange: master.priceRange, withDiscount: true)
        
        self.init(id: master.id,
                  image: buildImageSource(master.image),
                  properties: master.attributes.map { .init(label: $0.displayName, value: getAttributeDisplayValue(values: $0.displayValues)) },
                  subtitle: master.category.name,
                  price: price,
                  salePrice: salePrice,
                  title: master.name,
                  availability: master.availability.map { ProductAvailability($0) },
                  availableColors: getColors(from: master.colorAttribute))
    }
}

private func getColors(from: ColorAttribute?) -> [ProductColorDisplay] {
    guard let from else { return [] }
    return from.map {
        switch $0 {
        case .colorAttributeHexCode(let hex):
            return .color(hex: hex.hexCode)
        case .colorAttributeImageUrl(let url):
            return .image(source: .url(url.imageUrl))
        }
    }
}

private func getAttributeDisplayValue(values: [String]) -> String {
    let attributeValue = values.prefix(3).joined(separator: ", ")
    if values.count > 3 {
        return String(format: MKLocalizedString("more display values", comment: "The text to show in a product cell in case there is too many display values for an attribute"),
                      attributeValue,
                      values.count-3)
    }
    return attributeValue
}

extension ProductCategoriesScreenDisplayable {
    init(from result: CategoriesReduceResult) {
        let listType: ListType
        switch result.items {
        case .textItems(let items):
            listType = .text(items.list.map {
                TextOnlyProductCategory(id: $0.categoryId, title: $0.categoryName, nextScreen: .init(from: $0.next))
            })
        case .cardItems(let items):
            listType = .custom(getCardsRows(items: items.list))
        }
        self.init(listType: listType)
    }
}

private func getCardsRows(items: [CardItem]) -> [ProductCategoryCardsRow] {
    var rows = [ProductCategoryCardsRow]()
    var index = 0
    while index < items.count {
        if items[index].size == .large {
            rows.append(.init(rowType: .large(.init(from: items[index]))))
            index += 1
        } else if items[index].size == .small && items[safe: index + 1]?.size == .medium {
            let item1: ProductCategoryCardsRow.Item = .init(from: items[index])
            let item2: ProductCategoryCardsRow.Item = .init(from: items[index + 1])
            rows.append(.init(rowType: .smallMedium(item1, item2)))
            index += 2
        } else if items[index].size == .small {
            let item1: ProductCategoryCardsRow.Item = .init(from: items[index])
            var item2: ProductCategoryCardsRow.Item?
            var item3: ProductCategoryCardsRow.Item?
            var skipCount = 1
            if items[safe: index + 1]?.size == .small {
                item2 = .init(from: items[index + 1])
                skipCount = 2
                if items[safe: index + 2]?.size == .small {
                    item3 = .init(from: items[index + 1])
                    skipCount = 3
                }
            }
            rows.append(.init(rowType: .threeSmall(item1, item2, item3)))
            index += skipCount
        } else { // items[index].size == .medium
            let item1: ProductCategoryCardsRow.Item = .init(from: items[index])
            var item2: ProductCategoryCardsRow.Item?
            var skipCount = 1
            if items[safe: index + 1]?.size == .small {
                item2 = .init(from: items[index + 1])
                skipCount = 2
            }
            rows.append(.init(rowType: .mediumSmall(item1, item2)))
            index += skipCount
        }
    }
    return rows
}

extension ProductCategoryCardsRow.Item {
    init(from item: CardItem) {
        self.init(id: item.categoryId, title: item.categoryName, imageURL: item.image, nextScreen: .init(from: item.next))
    }
}

extension CatalogScreenType {
    init(from next: ProductCategoryNextItemType) {
        switch next {
        case .category:
            self = .categories
        case .product:
            self = .products
        }
    }
}

private func buildImageSource(_ imageUrl: URL) -> ImageSource {
    if var components = URLComponents(url: imageUrl, resolvingAgainstBaseURL: true) {
        var queryItems = components.queryItems ?? []
        queryItems.append(URLQueryItem(name: "sw", value: "200"))
        components.queryItems = queryItems
        do {
            return .url(try components.asURL())
        } catch {
            return .styledImage(identifier: "logo")
        }
    } else {
        return .styledImage(identifier: "logo")
    }
}

extension ProductAvailability {
    init(_ availabilityTag: ProductAvailabilityTag) {
        self.init(displayName: availabilityTag.title, stockLevelVariant: AvailabilityVariant(availabilityTag.colorHexValue))
    }
}
