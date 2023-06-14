/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get an transaction by id
struct TransactionsControllerFindOneV2: TargetType {
    ///Transaction id (= order id)
    let transactionId: String

    init(transactionId: String) {
        self.transactionId = transactionId
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/transactions/v2/transactions/{transactionId}"
        let formatter = PathFormatter()
        let transactionIdSafe = formatter.format(value: self.transactionId)
        path = path.replacingOccurrences(of: "{transactionId}", with: transactionIdSafe)
        return path
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("TransactionsControllerFindOneV2").url
    }
}

extension TransactionsControllerFindOneV2: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

