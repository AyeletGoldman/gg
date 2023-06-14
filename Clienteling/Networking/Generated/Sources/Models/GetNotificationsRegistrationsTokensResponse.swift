/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// The response contains all of the Notification Token objects that are attached to the user who's making the request.
/// * The tokens in the list might be expired.

struct GetNotificationsRegistrationsTokensResponse: Codable, Equatable {

    /// The response contains all of the Notification Token objects that are attached to the user who's making the request.
    /// * The tokens in the list might be expired.

    struct GetNotificationsRegistrationsTokensResponseTokens: Codable, Equatable {

        let createdDate: ISO8601DateTimeString?
        let lastUpdatedDate: ISO8601DateTimeString?
        let token: Token?

        enum CodingKeys: String, CodingKey {
            case createdDate = "createdDate"
            case lastUpdatedDate = "lastUpdatedDate"
            case token = "token"
        }

        init(createdDate: ISO8601DateTimeString? = nil, lastUpdatedDate: ISO8601DateTimeString? = nil, token: Token? = nil) {
            self.createdDate = createdDate
            self.lastUpdatedDate = lastUpdatedDate
            self.token = token
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.createdDate = try container.mkDecodeIfPresent(ISO8601DateTimeString.self, forKey: .createdDate)
            self.lastUpdatedDate = try container.mkDecodeIfPresent(ISO8601DateTimeString.self, forKey: .lastUpdatedDate)
            self.token = try container.mkDecodeIfPresent(Token.self, forKey: .token)
        }
    }

    let tokens: [GetNotificationsRegistrationsTokensResponseTokens]?

    enum CodingKeys: String, CodingKey {
        case tokens = "tokens"
    }

    init(tokens: [GetNotificationsRegistrationsTokensResponseTokens]? = nil) {
        self.tokens = tokens
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tokens = try container.mkDecodeIfPresent([GetNotificationsRegistrationsTokensResponseTokens].self, forKey: .tokens)
    }
}
