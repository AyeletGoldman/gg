/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Add multiple products to a given curation.
struct CurationControllerAddProduct: TargetType {
    ///Curation ID to add products on
    let curationId: String
    let addProductsBody: AddProductsBody

    init(curationId: String, addProductsBody: AddProductsBody) {
        self.curationId = curationId
        self.addProductsBody = addProductsBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/curations/v1/curations/{curationId}/products"
        let formatter = PathFormatter()
        let curationIdSafe = formatter.format(value: self.curationId)
        path = path.replacingOccurrences(of: "{curationId}", with: curationIdSafe)
        return path
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.addProductsBody, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("CurationControllerAddProduct").url
    }
}

extension CurationControllerAddProduct: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

