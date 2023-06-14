// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI
import MaisonKit

let productIdStr = "productId"
let masterIdStr = "masterId"

func buildProductCellDisplayable(searchText: String? = nil, index: Int) -> ProductListCellDisplayable {
    if index % 4 == 0 {
        return buildSummaryDisplayable(searchText: searchText)
    } else if index % 4 == 1 {
        return buildMasterRangeDisplayable(searchText: searchText)
    } else if index % 4 == 2 {
        return buildSummaryStringDisplayable(searchText: searchText)
    } else {
        return buildSummaryCurrencyDisplayable(searchText: searchText)
    }
}

private func buildSummaryDisplayable(searchText: String? = nil) -> ProductListCellDisplayable {
    return .product(ProductSummaryDisplayable(productId: productIdStr + UUID().uuidString,
                                              masterId: masterIdStr + UUID().uuidString,
                                              sku: UUID().uuidString,
                                              image: .url(URL(string: "https://picsum.photos/120/165")!),
                                              properties: buildProductCellProperties(),
                                              subtitle: "CATEGORY",
                                              price: .price(CurrencyConvertable(fractionalUnitAmount: 10000,
                                                                                numberOfFractionalUnitsInMonetaryUnit: 100,
                                                                                currencyCode: "EUR")),
                                              title: searchText?.isEmpty ?? true ? "Product name" : "Product search item",
                                              availability: ProductAvailability(displayName: "Available",
                                                                                stockLevelVariant: .inStock)))
}

private func buildMasterRangeDisplayable(searchText: String? = nil) -> ProductListCellDisplayable {
    return .master(ProductMasterSummaryDisplayable(id: masterIdStr + UUID().uuidString,
                                                   image: .url(URL(string: "https://picsum.photos/120/165")!),
                                                   properties: buildProductCellProperties(),
                                                   subtitle: "CATEGORY",
                                                   price: .priceRange(low: CurrencyConvertable(fractionalUnitAmount: 10000,
                                                                                               numberOfFractionalUnitsInMonetaryUnit: 100,
                                                                                               currencyCode: "EUR"),
                                                                      high: CurrencyConvertable(fractionalUnitAmount: 20000,
                                                                                                numberOfFractionalUnitsInMonetaryUnit: 100,
                                                                                                currencyCode: "EUR")),
                                                   title: searchText?.isEmpty ?? true ? "Product master" : "Product search master"))
}

private func buildSummaryStringDisplayable(searchText: String? = nil) -> ProductListCellDisplayable {
    return .product(ProductSummaryDisplayable(productId: productIdStr + UUID().uuidString,
                                              masterId: masterIdStr + UUID().uuidString,
                                              sku: UUID().uuidString,
                                              image: .url(URL(string: "https://picsum.photos/120/165")!),
                                              properties: buildProductCellProperties(),
                                              subtitle: "CATEGORY",
                                              price: "P.O.D.",
                                              title: searchText?.isEmpty ?? true ? "Product name" : "Product search item",
                                              availability: ProductAvailability(displayName: "Available",
                                                                                stockLevelVariant: .inStock)))
}

private func buildSummaryCurrencyDisplayable(searchText: String? = nil) -> ProductListCellDisplayable {
    return .product(ProductSummaryDisplayable(productId: productIdStr + UUID().uuidString,
                                              masterId: masterIdStr + UUID().uuidString,
                                              sku: UUID().uuidString,
                                              image: .url(URL(string: "https://picsum.photos/120/165")!),
                                              properties: buildProductCellProperties(),
                                              subtitle: "CATEGORY",
                                              price: NumberFormatter.wholeUnitCurrencyFormatter(locale: .autoupdatingCurrent,
                                                                                                currencyCode: "EUR")
                                                .string(for: CurrencyConvertable(fractionalUnitAmount: 100000,
                                                                                 numberOfFractionalUnitsInMonetaryUnit: 100,
                                                                                 currencyCode: "EUR")),
                                              title: searchText?.isEmpty ?? true ? "Custom Price Product" : "Custom Price Product search item",
                                              availability: ProductAvailability(displayName: "Available",
                                                                                stockLevelVariant: .inStock)))
}

// swiftlint:disable line_length
func buildProductCellDisplayable2() -> [ProductListCellDisplayable] {
    return [
        .product(ProductSummaryDisplayable(productId: "productId",
                                           masterId: "masterId",
                                           sku: UUID().uuidString,
                                           image: .url(URL(string: "https://www.fred.com/on/demandware.static/-/Sites-fred-master-catalog/default/dw51ec6f31/product_images/6J0201-A.png")!),
                                           properties: buildProductCellProperties(),
                                           subtitle: "EARRINGS",
                                           price: .price(CurrencyConvertable(fractionalUnitAmount: 10000,
                                                                             numberOfFractionalUnitsInMonetaryUnit: 100,
                                                                             currencyCode: "EUR")),
                                           title: "Product name",
                                           availability: ProductAvailability(displayName: "Available",
                                                                             stockLevelVariant: .inStock))),
        .product(ProductSummaryDisplayable(productId: "productId2",
                                           masterId: "masterId",
                                           sku: UUID().uuidString,
                                           image: .url(URL(string: "https://www.fred.com/dw/image/v2/BDKC_PRD/on/demandware.static/-/Sites-fred-master-catalog/default/dw146d14ac/product_images/7J0279-A.png?sw=241&sh=241&q=85")!),
                                           properties: buildProductCellProperties(),
                                           subtitle: "EARRINGS",
                                           price: .price(CurrencyConvertable(fractionalUnitAmount: 10000,
                                                                             numberOfFractionalUnitsInMonetaryUnit: 100,
                                                                             currencyCode: "EUR")),
                                           title: "Product name",
                                           availability: ProductAvailability(displayName: "Available",
                                                                             stockLevelVariant: .inStock))),
        .master(ProductMasterSummaryDisplayable(id: "masterId",
                                                image: .url(URL(string: "https://www.fred.com/on/demandware.static/-/Sites-fred-master-catalog/default/dw2758a89b/product_images/7J0287-A.png")!),
                                                properties: buildProductCellProperties(),
                                                subtitle: "BRACELETES",
                                                price: .priceRange(low: CurrencyConvertable(fractionalUnitAmount: 10000,
                                                                                            numberOfFractionalUnitsInMonetaryUnit: 100,
                                                                                            currencyCode: "EUR"),
                                                                   high: CurrencyConvertable(fractionalUnitAmount: 20000,
                                                                                             numberOfFractionalUnitsInMonetaryUnit: 100,
                                                                                             currencyCode: "EUR")),
                                                title: "Product name master"))
    ]
}
// swiftlint:enable line_length

func buildProductCellProperties() -> [ProductSummaryProperty] {
    return [
        ProductSummaryProperty(label: "Label:", value: "Value"),
        ProductSummaryProperty(label: "Label:", value: "Value"),
        ProductSummaryProperty(label: "Label:", value: "Value"),
        ProductSummaryProperty(label: "Label:", value: "Value"),
        ProductSummaryProperty(label: "Label:", value: "Value")
    ].prefix(upTo: Int.random(in: 2...5))
    .asArray
}

private extension ArraySlice {
    var asArray: [Element] {
        return Array(self)
    }
}
