/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Delete a single product in a given curation.
struct CurationControllerRemoveProduct: TargetType {
    ///Curation ID in which we remove a product
    let curationId: String
    ///Product ID to remove in the given curation
    let productId: String

    init(curationId: String, productId: String) {
        self.curationId = curationId
        self.productId = productId
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/curations/v1/curations/{curationId}/products/{productId}"
        let formatter = PathFormatter()
        let curationIdSafe = formatter.format(value: self.curationId)
        path = path.replacingOccurrences(of: "{curationId}", with: curationIdSafe)
        let productIdSafe = formatter.format(value: self.productId)
        path = path.replacingOccurrences(of: "{productId}", with: productIdSafe)
        return path
    }

    var method: Moya.Method {
        return .delete
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("CurationControllerRemoveProduct").url
    }
}

extension CurationControllerRemoveProduct: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

