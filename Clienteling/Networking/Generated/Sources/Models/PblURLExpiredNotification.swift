/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct PblURLExpiredNotification: Codable, Equatable {

    enum PblURLExpiredNotificationType: String, Codable, Equatable, CaseIterable {
        case pblURLExpired = "pblURLExpired"
    }

    struct PblURLExpiredNotificationPayload: Codable, Equatable {

        /// ID of the Pay-by-Link interaction
        let interactionId: String

        enum CodingKeys: String, CodingKey {
            case interactionId = "interactionId"
        }

        init(interactionId: String) {
            self.interactionId = interactionId
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.interactionId = try container.mkDecode(String.self, forKey: .interactionId)
        }
    }

    let payload: PblURLExpiredNotificationPayload
    let type: PblURLExpiredNotificationType

    enum CodingKeys: String, CodingKey {
        case payload = "payload"
        case type = "type"
    }

    init(payload: PblURLExpiredNotificationPayload, type: PblURLExpiredNotificationType) {
        self.payload = payload
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.payload = try container.mkDecode(PblURLExpiredNotificationPayload.self, forKey: .payload)
        self.type = try container.mkDecode(PblURLExpiredNotificationType.self, forKey: .type)
    }
}
