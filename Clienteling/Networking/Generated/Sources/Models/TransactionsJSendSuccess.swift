/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TransactionsJSendSuccess: Codable, Equatable {

    let data: TransactionsJSendSuccessPluginResponse
    let status: String

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
    }

    init(data: TransactionsJSendSuccessPluginResponse, status: String) {
        self.data = data
        self.status = status
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.mkDecode(TransactionsJSendSuccessPluginResponse.self, forKey: .data)
        self.status = try container.mkDecode(String.self, forKey: .status)
    }
}