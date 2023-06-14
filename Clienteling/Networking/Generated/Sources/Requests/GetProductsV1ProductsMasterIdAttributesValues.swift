/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary DEPRECATED - Get possible values for attributes of a product master or a bundle.
/// @description **DEPRECATED** This endpoint will be removed in a future release.
/// 
/// This endpoint can be used to get the possible values of attributes of a product master,
/// given values for a set of attributes.
/// 
/// When the given selection of attributes gives a single product, the product ID is returned.
/// 
/// For each attribute selected in the request, the list of possible values when this attribute is unselected are given. 
/// 
/// For example, it can be used to get all the possible sizes of products for a given master, with a *blue* color and a *gold* material.
/// 
/// ```
/// selectedAttributes={
///   ATTRIBUTE1:VALUE1,
///   ATTRIBUTE2:VALUE2
/// }
/// ```
struct GetProductsV1ProductsMasterIdAttributesValues: TargetType {
    ///master or bundle id
    let masterId: String
    ///the ID of the shop from which the call is made. This ID is used to retrieve stock availability for this given shop.
    let shopId: String
    ///Values of attributes already selected for this master.
    /// 
    /// This parameter is an object and its style is `form` (by default), the data will be serialized before being sent to the backend.
    /// 
    /// More on data serialization: https://swagger.io/docs/specification/serialization/
    /// 
    /// This example data will be serialized as `color=blue&material=gold`
    let selectedAttributes: [String: String]?
    ///The returned content's expected language. 
    /// The format is defined by RFC-4646: https://tools.ietf.org/html/rfc4646
    /// If the server is unable to honour this language it will return the content in the default language.
    let acceptLanguage: String?

    init(masterId: String, shopId: String, selectedAttributes: [String: String]?, acceptLanguage: String?) {
        self.masterId = masterId
        self.shopId = shopId
        self.selectedAttributes = selectedAttributes
        self.acceptLanguage = acceptLanguage
    }

    var headers: [String: String]? {
        return [
            "Accept-Language": self.acceptLanguage
        ].compactMapValues { $0 }
    }

    var path: String {
        var path = "/products/v1/products/{masterId}/attributes_values"
        let formatter = PathFormatter()
        let masterIdSafe = formatter.format(value: self.masterId)
        path = path.replacingOccurrences(of: "{masterId}", with: masterIdSafe)
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
        queryEncoder.encode(self.selectedAttributes,
                            forKey: "selectedAttributes",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Get/products/v1/products/{masterId}/attributesValues").url
    }
}

extension GetProductsV1ProductsMasterIdAttributesValues: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

