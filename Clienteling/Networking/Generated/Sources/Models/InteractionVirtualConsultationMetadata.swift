/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionVirtualConsultationMetadata: Codable, Equatable {

    enum InteractionVirtualConsultationMetadataContext: String, Codable, Equatable, CaseIterable {
        case virtualConsultation = "virtualConsultation"
    }

    enum InteractionVirtualConsultationMetadataConsultationType: String, Codable, Equatable, CaseIterable {
        case instore = "instore"
        case virtual = "virtual"
    }

    /// URL of the consultation for client
    let clientLink: URL?
    let consultationType: InteractionVirtualConsultationMetadataConsultationType
    let context: InteractionVirtualConsultationMetadataContext
    let endTime: ISO8601DateTime
    let startTime: ISO8601DateTime
    let store: Store?
    let templateName: String?

    enum CodingKeys: String, CodingKey {
        case clientLink = "clientLink"
        case consultationType = "consultationType"
        case context = "context"
        case endTime = "endTime"
        case startTime = "startTime"
        case store = "store"
        case templateName = "templateName"
    }

    init(clientLink: URL? = nil, consultationType: InteractionVirtualConsultationMetadataConsultationType, context: InteractionVirtualConsultationMetadataContext, endTime: ISO8601DateTime, startTime: ISO8601DateTime, store: Store? = nil, templateName: String? = nil) {
        self.clientLink = clientLink
        self.consultationType = consultationType
        self.context = context
        self.endTime = endTime
        self.startTime = startTime
        self.store = store
        self.templateName = templateName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clientLink = try container.mkDecodeIfPresent(URL.self, forKey: .clientLink)
        self.consultationType = try container.mkDecode(InteractionVirtualConsultationMetadataConsultationType.self, forKey: .consultationType)
        self.context = try container.mkDecode(InteractionVirtualConsultationMetadataContext.self, forKey: .context)
        self.endTime = try container.mkDecode(ISO8601DateTime.self, forKey: .endTime)
        self.startTime = try container.mkDecode(ISO8601DateTime.self, forKey: .startTime)
        self.store = try container.mkDecodeIfPresent(Store.self, forKey: .store)
        self.templateName = try container.mkDecodeIfPresent(String.self, forKey: .templateName)
    }
}
