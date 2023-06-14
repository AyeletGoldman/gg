/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct GetConnectLinkByExternalId: Codable, Equatable {

    /// Indicates at what time the users can connect to the consultation link
    let activeTime: ISO8601DateTimeString
    /// URL for agent to start one to one in a browser
    let agentLink: URL
    /// URL for client to connect to one to one in a browser
    let clientLink: URL
    /// Connect link id
    let connectLinkId: String
    let endTime: ISO8601DateTimeString
    /// Related id for which this link has been created.
    let externalId: String
    let startTime: ISO8601DateTimeString
    /// Meeting title
    let title: String?

    enum CodingKeys: String, CodingKey {
        case activeTime = "activeTime"
        case agentLink = "agentLink"
        case clientLink = "clientLink"
        case connectLinkId = "connectLinkId"
        case endTime = "endTime"
        case externalId = "externalId"
        case startTime = "startTime"
        case title = "title"
    }

    init(activeTime: ISO8601DateTimeString, agentLink: URL, clientLink: URL, connectLinkId: String, endTime: ISO8601DateTimeString, externalId: String, startTime: ISO8601DateTimeString, title: String? = nil) {
        self.activeTime = activeTime
        self.agentLink = agentLink
        self.clientLink = clientLink
        self.connectLinkId = connectLinkId
        self.endTime = endTime
        self.externalId = externalId
        self.startTime = startTime
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.activeTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .activeTime)
        self.agentLink = try container.mkDecode(URL.self, forKey: .agentLink)
        self.clientLink = try container.mkDecode(URL.self, forKey: .clientLink)
        self.connectLinkId = try container.mkDecode(String.self, forKey: .connectLinkId)
        self.endTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .endTime)
        self.externalId = try container.mkDecode(String.self, forKey: .externalId)
        self.startTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .startTime)
        self.title = try container.mkDecodeIfPresent(String.self, forKey: .title)
    }
}
