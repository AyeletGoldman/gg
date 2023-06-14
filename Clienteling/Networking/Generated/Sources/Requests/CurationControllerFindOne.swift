/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get a curation by Curation or User id.
struct CurationControllerFindOne: TargetType {
    ///Curation ID to get curation details
    let curationId: String
    ///The ID of the shop from which the call is made. This ID is used to retrieve stock availability for this given shop. If no shop ID will be given, the response won't include availability & pricing details.
    let shopId: String?
    ///the currency to return the product prices in
    let currencyCode: CurrencyCode?
    ///The returned content's expected language. 
    /// The format is defined by RFC-4646: https://tools.ietf.org/html/rfc4646
    /// If the server is unable to honour this language it will return the content in the default language.
    let acceptLanguage: String?

    init(curationId: String, shopId: String?, currencyCode: CurrencyCode?, acceptLanguage: String?) {
        self.curationId = curationId
        self.shopId = shopId
        self.currencyCode = currencyCode
        self.acceptLanguage = acceptLanguage
    }

    var headers: [String: String]? {
        return [
            "Accept-Language": self.acceptLanguage
        ].compactMapValues { $0 }
    }

    var path: String {
        var path = "/curations/v1/curations/{curationId}"
        let formatter = PathFormatter()
        let curationIdSafe = formatter.format(value: self.curationId)
        path = path.replacingOccurrences(of: "{curationId}", with: curationIdSafe)
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
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("CurationControllerFindOne").url
    }
}

extension CurationControllerFindOne: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

