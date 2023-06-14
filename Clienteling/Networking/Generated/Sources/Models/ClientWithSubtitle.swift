/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientWithSubtitle: Codable, Equatable {

    let advisorId: String?
    let clientId: String
    let clientName: String?
    /// Additional fields depending on search.
    let detailsFields: [TypedValue]?
    let segments: [String]
    /// This field will be the first entry in detailsFields.
    let subtitle: TypedValue?

    enum CodingKeys: String, CodingKey {
        case advisorId = "advisorId"
        case clientId = "clientId"
        case clientName = "clientName"
        case detailsFields = "detailsFields"
        case segments = "segments"
        case subtitle = "subtitle"
    }

    init(advisorId: String? = nil, clientId: String, clientName: String? = nil, detailsFields: [TypedValue]? = nil, segments: [String], subtitle: TypedValue? = nil) {
        self.advisorId = advisorId
        self.clientId = clientId
        self.clientName = clientName
        self.detailsFields = detailsFields
        self.segments = segments
        self.subtitle = subtitle
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisorId = try container.mkDecodeIfPresent(String.self, forKey: .advisorId)
        self.clientId = try container.mkDecode(String.self, forKey: .clientId)
        self.clientName = try container.mkDecodeIfPresent(String.self, forKey: .clientName)
        self.detailsFields = try container.mkDecodeIfPresent([TypedValue].self, forKey: .detailsFields)
        self.segments = try container.mkDecode([String].self, forKey: .segments)
        self.subtitle = try container.mkDecodeIfPresent(TypedValue.self, forKey: .subtitle)
    }
}
