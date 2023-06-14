/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get the stock details for a product
/// @description This endpoint allows you to get the full details about stocks for a product.
/// ```
struct GetProductsV1StocksProductId: TargetType {
    ///product code
    let productId: String
    ///the ID of the shop from which the call is made. This ID is used to retrieve stocks for this given shop.
    let shopId: String?
    ///The returned content's expected language. 
    /// The format is defined by RFC-4646: https://tools.ietf.org/html/rfc4646
    /// If the server is unable to honour this language it will return the content in the default language.
    let acceptLanguage: String?

    init(productId: String, shopId: String?, acceptLanguage: String?) {
        self.productId = productId
        self.shopId = shopId
        self.acceptLanguage = acceptLanguage
    }

    var headers: [String: String]? {
        return [
            "Accept-Language": self.acceptLanguage
        ].compactMapValues { $0 }
    }

    var path: String {
        var path = "/products/v1/stocks/{productId}"
        let formatter = PathFormatter()
        let productIdSafe = formatter.format(value: self.productId)
        path = path.replacingOccurrences(of: "{productId}", with: productIdSafe)
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
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Get/products/v1/stocks/{productId}").url
    }
}

extension GetProductsV1StocksProductId: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

