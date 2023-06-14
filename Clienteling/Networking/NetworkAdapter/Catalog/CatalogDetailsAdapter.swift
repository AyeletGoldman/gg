// Copyright © 2020 LVMH. All rights reserved.

import MaisonKit
import Combine
import SwiftUI

extension NetworkAdapter: CatalogDetailsAdapter {

    func getProductStock(productId: String) -> AnyPublisher<Result<StockInformationDisplayable, ErrorDisplayable>, Error> {
        return self.networking.getProductsV1StocksProductId(productId: productId,
                                                            shopId: Self.currentStoreCode,
                                                            acceptLanguage: self.currentAcceptLanguageHeaderValue)
        .unwrapDefaultSuccessResponse()
        .mapToResultViewModel { stock in
            return StockInformationDisplayable(from: stock)
        }
    }

    func getProductDetails(productId: String, selectedAttributes: [ProductAttributeID: String]?) -> AnyPublisher<Result<ProductDetailsDisplayable, ErrorDisplayable>, Error> {
        self.networking.getProductsV1ProductsProductIdsOrUpcs(productIdsOrUpcs: [productId],
                                                              shopId: Self.currentStoreCode,
                                                              currencyCode: Self.currentCurrencyCode,
                                                              ignoreNotFoundErrors: false,
                                                              attributes: selectedAttributes,
                                                              acceptLanguage: self.currentAcceptLanguageHeaderValue)
        .unwrapDefaultSuccessResponse()
        .mapToResultViewModel { result in
            guard let product = result.products.first else {
                throw ErrorDisplayable.emptyResult
            }
            return ProductDetailsDisplayable(from: product)
        }
        .catch { _ in
            let displayable = ErrorDisplayable(localizedDescription: String(format: MKLocalizedString("product-not-found.description",
                                                                                                      comment: "The message for product not found"), productId),
                                               localizedTitle: MKLocalizedString("product-not-found.title",
                                                                                 comment: "The title for product not found"),
                                               image: ImageSource.styledImage(identifier: "icon-lrg-fail-results"))
            return Just(Result<ProductDetailsDisplayable, ErrorDisplayable>.failure(displayable)).setFailureType(to: Error.self)
        }.eraseToAnyPublisher()
    }
}


extension ProductDetailsDisplayable {
    init(from productDetails: ProductsDetailsResult.ProductsDetailsResultProducts) {
        let context: ProductDetailsContext
        switch productDetails {
        case .productDetails(let product):
            context = .product(.init(from: product))
        case .masterDetails(let master):
            context = .master(.init(from: master))
        }
        let actions: () -> ProductDetailsActions = {
            let navigationActions = ProductDetailsDisplayable.getNavigationActions(productDetails: productDetails, context: context)
            let verticalActions = ProductDetailsDisplayable.getVerticalItems(productDetails: productDetails, context: context)
            let horizontalActions = ProductDetailsDisplayable.getHorizontalItems(productDetails: productDetails, context: context)
            return ProductDetailsActions(
                navigationActions: navigationActions,
                pageVerticalActions: verticalActions,
                pageHorizontalActions: horizontalActions)
        }
        self.init(context: context, actions: actions)
    }
}

extension ProductDetailsDisplayable {
    static func getVerticalItems(productDetails: ProductsDetailsResult.ProductsDetailsResultProducts, context: ProductDetailsContext) -> [ButtonAction] {
        let checkStockDetailsAction = getCheckStockDetailsPrimaryAction(productDetails: productDetails)

        return [checkStockDetailsAction].compactMap { $0 }
    }

    static func getHorizontalItems(productDetails: ProductsDetailsResult.ProductsDetailsResultProducts, context: ProductDetailsContext) -> [ContextualAction] {
        return [].compactMap { $0 }
    }

    static func getNavigationActions(productDetails: ProductsDetailsResult.ProductsDetailsResultProducts, context: ProductDetailsContext) -> [MenuAction] {
        let productShareAction = getProductShareMenuAction(productDetails: productDetails)
        let checkStockDetailsAction = getCheckStockDetailsMenuAction(productDetails: productDetails)
        let stockAction = getStockDetailsPrivacyModeAction(context: context)

        return [checkStockDetailsAction,
                stockAction,
                productShareAction].compactMap { $0 }
    }
}

private func getStockDetailsPrivacyModeAction(context: ProductDetailsContext) -> MenuAction? {
    guard case .product = context else { return nil }

    return .stockDetailsPrivacyModeAction()
}

private func getProductShareMenuAction(productDetails: ProductsDetailsResult.ProductsDetailsResultProducts) -> MenuAction? {
    let imagesToShare: [URL] = productDetails.images.compactMap { URL(string: $0) }
    return .productShareMenuAction(productShareData: ProductShareData(productId: productDetails.reference,
                                                                  productImageURLs: imagesToShare))
}

private func getProductShareSecondaryAction(productDetails: ProductsDetailsResult.ProductsDetailsResultProducts) -> ContextualAction? {
    let imagesToShare: [URL] = productDetails.images.compactMap { URL(string: $0) }
    return .secondaryProductShareAction(productShareData: ProductShareData(productId: productDetails.reference,
                                                                           productImageURLs: imagesToShare))
}


private func getCheckStockDetailsMenuAction(productDetails: ProductsDetailsResult.ProductsDetailsResultProducts) -> MenuAction {
    return .checkStockDetailsMenuAction(isProduct: productDetails.isProduct)
}

private func getCheckStockDetailsPrimaryAction(productDetails: ProductsDetailsResult.ProductsDetailsResultProducts) -> ButtonAction {
    return .primaryStockDetailsAction(isProduct: productDetails.isProduct)
}

private func getSimilarProductsMenuAction(productDetails: ProductsDetailsResult.ProductsDetailsResultProducts) -> MenuAction? {
    switch productDetails {
    case .productDetails(let product) where product.hasSimilarProducts == true:
        return .findSimilarProductsMenuAction(productId: product.id)
    case .masterDetails(let master) where master.hasSimilarProducts == true:
        return .findSimilarProductsMenuAction(productId: master.id)
    default:
        return nil
    }
}

extension ProductsDetailsResult.ProductsDetailsResultProducts {
    var isProduct: Bool {
        switch self {
        case .masterDetails:
            return false
        case .productDetails:
            return true
        }
    }
}



extension StockInformationDisplayable {

    private enum Constants {
        static let lastUpdatedDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar.autoupdatingCurrent
            formatter.locale = Locale.autoupdatingCurrent
            formatter.setLocalizedDateFormatFromTemplate("MMM dd, HH:mm")
            return formatter
        }()
    }

    private enum Labels {
        static let singularUnitsSubtitle = MKLocalizedString("stock-details.check-stock.row.subtitle",
                                                             comment: "The subtitle for the number of units in stock in a particular store in plural")
        static let available = MKLocalizedString("stock-details.my-store.description.available", comment: "Stock details item available description")
        static let unavailable = MKLocalizedString("stock-details.my-store.description.not-available", comment: "Stock details item not available description")
        static let myStoreTitle = MKLocalizedString("stock-details.my-store.title", comment: "Stock view my store title")
    }

    init(from result: ProductStockResult) {
        let currentStore = result.stocks.currentStore
        var data = Array(result.stocks.regions)
        data.insert(PrivacyAwareProductStockSummary.Data(area: Labels.myStoreTitle,
                                                         amount: currentStore.quantityLabel,
                                                         isInStock: currentStore.isAvailable), at: 0)

        var items = result.stocks.regions?.map { stockItem in
            return StockInformationObject(title: stockItem.quantityLabel,
                                          subtitle: stockItem.name,
                                          stockInformationItems: stockItem.shops.map { shop in
                let subtitle = String(format: Labels.singularUnitsSubtitle, shop.quantity)
                return StockInformationItem(amountTitle: "\(shop.quantity)",
                                            amountSubtitle: subtitle,
                                            inStock: shop.quantity > 0,
                                            title: shop.name,
                                            subtitle: shop.address)
            },
                                          lastUpdated: stockItem.lastUpdated.map { Constants.lastUpdatedDateFormatter.string(from: $0.value) })
        } ?? []
        let currentStoreStockAvailablityLabel = currentStore.isAvailable ? Labels.available : Labels.unavailable
        items.insert(StockInformationObject(
            title: currentStore.quantityLabel,
            subtitle: Labels.myStoreTitle,
            stockInformationItems: [
                StockInformationItem(
                    amountTitle: currentStore.quantityLabel,
                    amountSubtitle: String(format: Labels.singularUnitsSubtitle, currentStore.quantity),
                    inStock: currentStore.isAvailable,
                    title: currentStoreStockAvailablityLabel)
            ],
            lastUpdated: currentStore.lastUpdated.map { Constants.lastUpdatedDateFormatter.string(from: $0.value) }),
                     at: 0)

        self.init(items: items, stockSummary: PrivacyAwareProductStockSummary(stockInfo: data))
    }
}

private extension Array where Element == PrivacyAwareProductStockSummary.Data {
    init(_ regions: [ProductStockDetailsRegions]?) {
        guard let regions else { self = []; return }
        self = regions.map { return PrivacyAwareProductStockSummary.Data(area: $0.name,
                                                                         amount: $0.quantityLabel,
                                                                         isInStock: $0.isAvailable)
        }
    }
}

extension ProductDetailsData {
    init(from product: ProductDetails) {
        // Temporary hack to show a video in the last carousel cell
        var mediaItems = product.images.compactMap { MediaType(imageStringURL: $0) }
        if let video = product.video {
            let videoThumbnail = video.thumbnail.map { ImageSource.url($0) }
            mediaItems.append(.video(
                source: .url(video.url),
                preview: videoThumbnail))
        }

        let price: String? = PriceType.getPrice(price: product.price)
        let salePrice: String? = PriceType.getPrice(price: product.price, withDiscount: true)
        
        let subtitle = (product.limitedEdition != nil) ? "\(product.category.name)    /     \(MKLocalizedString("product.limited-edition", comment: "")  )" : product.category.name

        self.init(productId: product.id,
                  productMasterId: product.masterId,
                  title: product.name,
                  subtitle: subtitle,
                  sku: product.sku,
                  price: price,
                  salePrice: salePrice,
                  informationItems: product.information.map {
            let content: ProductInformationItem.ContentType = $0.isText ? .text($0.value) : .html($0.value)
            return ProductInformationItem(title: $0.name, content: content)
        },
                  mediaItems: .init(heroImageIndex: 0,
                                    carouselItems: mediaItems),
                  stockInformationType: .summaryAndDetails,
                  availability: product.availability.map { ProductAvailability($0) },
                  attributes: product.attributeValues.map { ProductAttributes(from: $0) }
        )
    }
}

extension Information {
    var isText: Bool {
        return self.type == "text"
    }
}

extension ProductMasterDetailsData {
    init(from master: MasterDetails) {
        // Temporary hack to show a video in the last carousel cell
        var mediaItems = master.images.compactMap { MediaType(imageStringURL: $0) }
        if let video = master.video {
            let videoThumbnail = video.thumbnail.map { ImageSource.url($0) }
            mediaItems.append(.video(
                source: .url(video.url),
                preview: videoThumbnail))
        }

        let priceRangeObj = master.priceRange.map { MasterSummary.MasterSummaryPriceRange(max: $0.max, min: $0.min) }
        let price: String? = PriceType.getPrice(priceRange: priceRangeObj)
        let salePrice: String? = PriceType.getPrice(priceRange: priceRangeObj, withDiscount: true)

        self.init(id: master.id,
                  title: master.name,
                  subtitle: master.category.name,
                  price: price,
                  salePrice: salePrice,
                  informationItems: master.information.map {
            let content: ProductInformationItem.ContentType = $0.isText ? .text($0.value) : .html($0.value)

            return ProductInformationItem(title: $0.name, content: content)
        },
                  mediaItems: .init(heroImageIndex: 0,
                                    carouselItems: mediaItems),
                  stockInformationType: .summaryAndDetails,
                  attributes: ProductAttributes(from: master)
        )
    }
}

extension MediaType {
    init?(imageStringURL: String?) {
        guard let imageSource = ImageSource(imageStringURL: imageStringURL) else { return nil }
        self = .image(source: imageSource)
    }
}

extension ProductAttributes {
    private enum Constants {
        static let numberOfCharactersToMakeNestedList = 8
    }

    init(from productMaster: MasterDetails) {
        if let attributeValues = productMaster.attributeValues {
            self.init(from: attributeValues)
        } else {
            self.init(attributes: [])
        }
    }

    init(from attributeValues: AttributeValues) {
        let selectedAttributes: SelectedProductAttributes = attributeValues.reduce(SelectedProductAttributes()) { partialResult, attributeValue in
            var res = partialResult
            res[attributeValue.name] = ProductAttributes.AttributeValue(from: attributeValue)
            return res
        }

        // The logic for our example is:
        // *CORE implementation*
        //   - Size: in-line
        //   - Colour (hex-code): in-line
        //   - Colour (name): nested
        //   - Other attributes: nested
        //  Additional rules
        //   - Default (for unknown attributes) should be nested
        //   - If number of attribute options are over a configurable threshold, the attribute should be shown as nested
        let attributes = attributeValues.map { value in
            let row: ProductAttributeRow = {
                if value.name == "size" && value.allOptionTitlesAreShorter(than: Constants.numberOfCharactersToMakeNestedList) {
                    return .carousel(items: value.items.map { ProductAttributeCarouselItem($0) }, isShownInCollapsedMode: value.shouldDisplayInStockView)
                }
                if value.name == "color_hexa" && value.isFirstItemHexCode && value.allOptionTitlesAreShorter(than: Constants.numberOfCharactersToMakeNestedList) {
                    return .carousel(items: value.items.map { ProductAttributeCarouselItem($0) }, isShownInCollapsedMode: value.shouldDisplayInStockView)
                } else {
                    return .nestedList(items: value.items.map {
                        ProductAttributeItem(id: $0.identifier, title: $0.title, availability: ProductAvailability($0.availability))
                    }, isShownInCollapsedMode: value.shouldDisplayInStockView)
                }
            }()

            return ProductAttributes.Attribute(id: value.name,
                                               title: MKLocalizedString(value.translationKey, comment: "The attribute display value"),
                                               row: row)
        }
        self.init(attributes: attributes,
                  selectedAttributes: selectedAttributes)
    }
}

extension AttributeValue {
    func allOptionTitlesAreShorter(than numberOfCharacters: Int) -> Bool {
        return self.items.allSatisfy { item in
            item.title.count < numberOfCharacters
        }
    }
}

extension AttributeValue {
    var isFirstItemHexCode: Bool {
        switch self.items.first {
        case .attributeValueItemHexColor:
            return true
        default:
            return false
        }
    }
}

extension ProductAttributes.AttributeValue {
    init?(from attributeValue: AttributeValue) {
        let vals = attributeValue.items.compactMap { valueItem -> ProductAttributes.AttributeValue? in
            guard valueItem.isSelected else { return nil }
            switch valueItem {
            case .attributeValueItemHexColor(let hex):
                return ProductAttributes.AttributeValue(id: hex.name, title: hex.name)
            case .attributeValueItemImageUrl(let image):
                return ProductAttributes.AttributeValue(id: image.name, title: image.name)
            case .attributeValueItemStringValue(let value):
                return ProductAttributes.AttributeValue(id: value.name, title: value.value)
            }
        }
        guard let first = vals.first else { return nil }
        self = first
    }
}

private extension AttributeValueItem {
    var isSelected: Bool {
        switch self {
        case .attributeValueItemHexColor(let attributeValueItemHexColor):
            return attributeValueItemHexColor.isSelected
        case .attributeValueItemImageUrl(let attributeValueItemImageUrl):
            return attributeValueItemImageUrl.isSelected
        case .attributeValueItemStringValue(let attributeValueItemStringValue):
            return attributeValueItemStringValue.isSelected
        }
    }

    var identifier: String {
        switch self {
        case .attributeValueItemHexColor(let attributeValueItemHexColor):
            return attributeValueItemHexColor.name
        case .attributeValueItemImageUrl(let attributeValueItemImageUrl):
            return attributeValueItemImageUrl.name
        case .attributeValueItemStringValue(let attributeValueItemStringValue):
            return attributeValueItemStringValue.name
        }
    }

    var title: String {
        switch self {
        case .attributeValueItemHexColor(let attributeValueItemHexColor):
            return attributeValueItemHexColor.name
        case .attributeValueItemImageUrl(let attributeValueItemImageUrl):
            return attributeValueItemImageUrl.name
        case .attributeValueItemStringValue(let attributeValueItemStringValue):
            return attributeValueItemStringValue.value
        }
    }

    var availability: ProductAvailabilityTag {
        switch self {
        case .attributeValueItemHexColor(let attributeValueItemHexColor):
            return attributeValueItemHexColor.availability
        case .attributeValueItemImageUrl(let attributeValueItemImageUrl):
            return attributeValueItemImageUrl.availability
        case .attributeValueItemStringValue(let attributeValueItemStringValue):
            return attributeValueItemStringValue.availability
        }
    }
}

extension ProductAttributeCarouselItem {
    init(_ attributeValueItem: AttributeValueItem) {
        switch attributeValueItem {
        case .attributeValueItemStringValue(let string):
            self = ProductAttributeCarouselItem(id: string.name,
                                                title: string.value,
                                                availabilityIndicatorContent: .color(Color(hex: string.availability.colorHexValue)))
        case .attributeValueItemImageUrl(let imageURL):
            self = ProductAttributeCarouselItem(id: imageURL.name,
                                                image: .url(imageURL.value),
                                                title: imageURL.value.absoluteString,
                                                availabilityIndicatorContent: .color(Color(hex: imageURL.availability.colorHexValue)))
        case .attributeValueItemHexColor(let hex):
            self = ProductAttributeCarouselItem(id: hex.name,
                                                color: Color(hex: hex.value),
                                                title: hex.value,
                                                availabilityIndicatorContent: .color(Color(hex: hex.availability.colorHexValue)))
        }
    }
}

extension ImageSource {
    init?(imageStringURL: String?) {
        if let imageStringURL, let imageUrl = URL(string: imageStringURL) {
            self = .url(imageUrl)
        } else {
            return nil
        }
    }
}

public extension Color {

    /// Initializes a new `Color` with a hex string e.g. `#123456`
    /// - Parameter hex: the string to parse into a color
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            .trimmingCharacters(in: .init(charactersIn: "#"))
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        // swiftlint:disable:next identifier_name
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
