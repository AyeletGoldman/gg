/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get the details of a product, a product master or a bundle
/// @description This endpoint allows you to get the full details about a product, a master or a bundle.
/// 
/// ## Attributes
/// 
/// Attributes are the values configurable for a product.
/// 
/// For a master, the attributes are given without specifying their values.
/// 
/// For a bundle, the attributes are grouped by elements of the bundle.
/// 
/// ## Properties
/// 
/// Properties are values not configurable, like descriptions.
/// ```
struct GetProductsV1ProductsProductIdsOrUpcs: TargetType {
    ///An array or a single value of a product, master or bundle code or upc.
    let productIdsOrUpcs: [String]
    ///The ID of the shop from which the call is made. This ID is used to retrieve stock availability for this given shop. If no shop ID will be given, the response won't include availability & pricing details.
    let shopId: String?
    ///The currency to return the product prices in. If no currency code will be given, the response won't include pricing details.
    let currencyCode: CurrencyCode?
    ///Specify whether you want to still get data in the response if some of the provided product ids are not existing in the product catalog.
    let ignoreNotFoundErrors: Bool?
    ///An object defining the selected attributes and their corresponding values.
    /// ````
    ///   attributes= {
    ///     "size": "12",
    ///     "color": "red"
    ///   }
    /// ```
    /// Each key of this object is an attribute of the current master product, which should help to display in the FE, a list of relevant products.
    /// Each key of this attributes query parameter can only receive one value, not an array. In case more than one value is provided, a BadRequestError will be thrown.
    /// Another thing to know is that, you can't populate these attributes with more than one product id. If you do that, a BadRequestError will be thrown.
    let attributes: [String: String]?
    ///The returned content's expected language. 
    /// The format is defined by RFC-4646: https://tools.ietf.org/html/rfc4646
    /// If the server is unable to honour this language it will return the content in the default language.
    let acceptLanguage: String?

    init(productIdsOrUpcs: [String], shopId: String?, currencyCode: CurrencyCode?, ignoreNotFoundErrors: Bool?, attributes: [String: String]?, acceptLanguage: String?) {
        self.productIdsOrUpcs = productIdsOrUpcs
        self.shopId = shopId
        self.currencyCode = currencyCode
        self.ignoreNotFoundErrors = ignoreNotFoundErrors
        self.attributes = attributes
        self.acceptLanguage = acceptLanguage
    }

    var headers: [String: String]? {
        return [
            "Accept-Language": self.acceptLanguage
        ].compactMapValues { $0 }
    }

    var path: String {
        var path = "/products/v1/products/{productIdsOrUpcs}"
        let formatter = PathFormatter()
        let productIdsOrUpcsSafe = formatter.format(value: self.productIdsOrUpcs)
        path = path.replacingOccurrences(of: "{productIdsOrUpcs}", with: productIdsOrUpcsSafe)
        return path
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
        queryEncoder.encode(self.ignoreNotFoundErrors,
                            forKey: "ignoreNotFoundErrors",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.attributes,
                            forKey: "attributes",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Get/products/v1/products/{productIdsOrUpcs}").url
    }
}

extension GetProductsV1ProductsProductIdsOrUpcs: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

