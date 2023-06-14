/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Event: Codable, Equatable {

    /// Define which type of event it is
    enum EventType: String, Codable, Equatable, CaseIterable {
        case appointment = "Appointment"
    }

    struct EventUser: Codable, Equatable {

        let id: String
        let name: String

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
        }

        init(id: String, name: String) {
            self.id = id
            self.name = name
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.mkDecode(String.self, forKey: .id)
            self.name = try container.mkDecode(String.self, forKey: .name)
        }
    }

    let client: Client
    let endTime: ISO8601DateTimeString
    let id: String
    /// The id of the corresponding resource describe in the event type
    let resourceId: String
    let startTime: ISO8601DateTimeString
    let subject: String
    /// Define which type of event it is
    let type: EventType
    let user: EventUser

    enum CodingKeys: String, CodingKey {
        case client = "client"
        case endTime = "endTime"
        case id = "id"
        case resourceId = "resourceId"
        case startTime = "startTime"
        case subject = "subject"
        case type = "type"
        case user = "user"
    }

    init(client: Client, endTime: ISO8601DateTimeString, id: String, resourceId: String, startTime: ISO8601DateTimeString, subject: String, type: EventType, user: EventUser) {
        self.client = client
        self.endTime = endTime
        self.id = id
        self.resourceId = resourceId
        self.startTime = startTime
        self.subject = subject
        self.type = type
        self.user = user
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.client = try container.mkDecode(Client.self, forKey: .client)
        self.endTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .endTime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.resourceId = try container.mkDecode(String.self, forKey: .resourceId)
        self.startTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .startTime)
        self.subject = try container.mkDecode(String.self, forKey: .subject)
        self.type = try container.mkDecode(EventType.self, forKey: .type)
        self.user = try container.mkDecode(EventUser.self, forKey: .user)
    }
}
