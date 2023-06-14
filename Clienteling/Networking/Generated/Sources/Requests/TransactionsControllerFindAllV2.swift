/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get a list of transactions.
/// @description Get a list of transactions.
struct TransactionsControllerFindAllV2: TargetType {
    ///Comma separated list of transaction ids
    let transactionIds: String?
    ///Comma separated list of transaction payment ids
    let paymentIds: String?

    init(transactionIds: String?, paymentIds: String?) {
        self.transactionIds = transactionIds
        self.paymentIds = paymentIds
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/transactions/v2/transactions"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        // Formatting request parameters is tricky business because Moya (or Alamofire?) doesn't have the ability to format
        // each parameter individually. So we always format the value beforehand and then pass it into the url encoder
        let queryEncoder = URLQueryEncoder()
        queryEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        queryEncoder.encode(self.transactionIds,
                            forKey: "transactionIds",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.paymentIds,
                            forKey: "paymentIds",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("TransactionsControllerFindAllV2").url
    }
}

extension TransactionsControllerFindAllV2: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

