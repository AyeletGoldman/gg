/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientTimelineV1JSendSuccessPluginResponse: Codable, Equatable {

    let actionId: String
    let result: ClientTimelineV1
    let source: String

    enum CodingKeys: String, CodingKey {
        case actionId = "actionId"
        case result = "result"
        case source = "source"
    }

    init(actionId: String, result: ClientTimelineV1, source: String) {
        self.actionId = actionId
        self.result = result
        self.source = source
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actionId = try container.mkDecode(String.self, forKey: .actionId)
        self.result = try container.mkDecode(ClientTimelineV1.self, forKey: .result)
        self.source = try container.mkDecode(String.self, forKey: .source)
    }
}
