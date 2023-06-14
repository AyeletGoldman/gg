/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get list of products
/// @description This endpoint allows you to get a list of products. Free text search, filter by category and filter by attributes can be combined.
struct GetProductsV1Products: TargetType {
    ///the ID of the shop from which the call is made. This ID is used to retrieve stock availability for this given shop.
    let shopId: String
    ///the currency to return the product prices in
    let currencyCode: CurrencyCode
    ///Free text search
    let query: String?
    ///Select products belonging to this category only
    let categoryId: String?
    ///Set to true if you want to fetch the products from the subcategories.
    let fetchSubcategories: Bool?
    ///Used to search products similar to a given product. `similarTo` indicates the `id` of the product for which to search similar products.
    let similarTo: String?
    ///```
    /// filters={
    ///   ATTRIBUTE1 : { "operator" : OPERATOR1, "value" : VALUE1 },
    ///   ATTRIBUTE2 : { "operator" : OPERATOR2, "value" : VALUE2 }
    /// }
    /// ```
    /// 
    /// `OPERATOR` can be `eq` or `in`.
    /// 
    /// `VALUE` can be a single value with `eq` operator or an array of values with `in` operator.
    /// 
    /// The `filters` parameter is an object and its style is `form` (by default), the data will be serialized before being sent to the backend.
    /// 
    /// More on data serialization: https://swagger.io/docs/specification/serialization/
    /// 
    /// > This example data will be serialized as:
    /// 
    /// > ```
    /// > color[operator]=eq&
    /// > color[value]=blue&
    /// > material[operator]=in&
    /// > material[value]=yellow gold&
    /// > material[value]=pink gold
    /// > ```
    /// 
    /// When the operator is "eq", any request that includes more than one value is treated as a bad request.
    let filters: ProductFilterRequestQueryParameter?
    ///The key identifying which sort option to apply to the results (e.g. name_asc, price_desc, etc.)
    let sortKey: String?
    ///The amount of result to receive in one query
    let pageSize: Int?
    ///The index of the page to query. Counting starts from 0
    let pageIndex: Int?
    ///The returned content's expected language. 
    /// The format is defined by RFC-4646: https://tools.ietf.org/html/rfc4646
    /// If the server is unable to honour this language it will return the content in the default language.
    let acceptLanguage: String?

    init(shopId: String, currencyCode: CurrencyCode, query: String?, categoryId: String?, fetchSubcategories: Bool?, similarTo: String?, filters: ProductFilterRequestQueryParameter?, sortKey: String?, pageSize: Int?, pageIndex: Int?, acceptLanguage: String?) {
        self.shopId = shopId
        self.currencyCode = currencyCode
        self.query = query
        self.categoryId = categoryId
        self.fetchSubcategories = fetchSubcategories
        self.similarTo = similarTo
        self.filters = filters
        self.sortKey = sortKey
        self.pageSize = pageSize
        self.pageIndex = pageIndex
        self.acceptLanguage = acceptLanguage
    }

    var headers: [String: String]? {
        return [
            "Accept-Language": self.acceptLanguage
        ].compactMapValues { $0 }
    }

    var path: String {
        return "/products/v1/products"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        // Formatting request parameters is tricky business because Moya (or Alamofire?) doesn't have the ability to format
        // each parameter individually. So we always format the value beforehand and then pass it into the url encoder
        let queryEncoder = URLQueryEncoder()
        queryEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        queryEncoder.encode(self.shopId,
                            forKey: "shopId",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.currencyCode,
                            forKey: "currencyCode",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.query,
                            forKey: "query",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.categoryId,
                            forKey: "categoryId",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.fetchSubcategories,
                            forKey: "fetchSubcategories",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.similarTo,
                            forKey: "similarTo",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.filters,
                            forKey: "filters",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.sortKey,
                            forKey: "sortKey",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.pageSize,
                            forKey: "pageSize",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.pageIndex,
                            forKey: "pageIndex",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Get/products/v1/products").url
    }
}

extension GetProductsV1Products: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

