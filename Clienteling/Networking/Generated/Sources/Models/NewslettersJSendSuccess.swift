/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct NewslettersJSendSuccess: Codable, Equatable {

    let data: NewslettersJSendSuccessPluginResponse
    let status: String

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
    }

    init(data: NewslettersJSendSuccessPluginResponse, status: String) {
        self.data = data
        self.status = status
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.mkDecode(NewslettersJSendSuccessPluginResponse.self, forKey: .data)
        self.status = try container.mkDecode(String.self, forKey: .status)
    }
}