/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionConsultationCreationMetadata: Codable, Equatable {

    enum InteractionConsultationCreationMetadataContext: String, Codable, Equatable, CaseIterable {
        case virtualConsultation = "virtualConsultation"
    }

    enum InteractionConsultationCreationMetadataConsultationType: String, Codable, Equatable, CaseIterable {
        case instore = "instore"
        case virtual = "virtual"
    }

    let consultationType: InteractionConsultationCreationMetadataConsultationType
    let context: InteractionConsultationCreationMetadataContext
    let endTime: ISO8601DateTime
    let startTime: ISO8601DateTime
    let storeCode: String
    let templateId: String?

    enum CodingKeys: String, CodingKey {
        case consultationType = "consultationType"
        case context = "context"
        case endTime = "endTime"
        case startTime = "startTime"
        case storeCode = "storeCode"
        case templateId = "templateId"
    }

    init(consultationType: InteractionConsultationCreationMetadataConsultationType, context: InteractionConsultationCreationMetadataContext, endTime: ISO8601DateTime, startTime: ISO8601DateTime, storeCode: String, templateId: String? = nil) {
        self.consultationType = consultationType
        self.context = context
        self.endTime = endTime
        self.startTime = startTime
        self.storeCode = storeCode
        self.templateId = templateId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.consultationType = try container.mkDecode(InteractionConsultationCreationMetadataConsultationType.self, forKey: .consultationType)
        self.context = try container.mkDecode(InteractionConsultationCreationMetadataContext.self, forKey: .context)
        self.endTime = try container.mkDecode(ISO8601DateTime.self, forKey: .endTime)
        self.startTime = try container.mkDecode(ISO8601DateTime.self, forKey: .startTime)
        self.storeCode = try container.mkDecode(String.self, forKey: .storeCode)
        self.templateId = try container.mkDecodeIfPresent(String.self, forKey: .templateId)
    }
}
