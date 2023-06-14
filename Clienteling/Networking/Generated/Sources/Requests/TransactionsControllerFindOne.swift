/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get a transaction by id.
struct TransactionsControllerFindOne: TargetType {
    ///Transcation ID to get details of
    let transactionId: String
    ///Determines if the images of the items in the result will be the ones from the response, or should they be fetched from an external site.
    let externalImages: Bool?

    init(transactionId: String, externalImages: Bool?) {
        self.transactionId = transactionId
        self.externalImages = externalImages
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/transactions/v1/transactions/{transactionId}"
        let formatter = PathFormatter()
        let transactionIdSafe = formatter.format(value: self.transactionId)
        path = path.replacingOccurrences(of: "{transactionId}", with: transactionIdSafe)
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
        queryEncoder.encode(self.externalImages,
                            forKey: "externalImages",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("TransactionsControllerFindOne").url
    }
}

extension TransactionsControllerFindOne: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

