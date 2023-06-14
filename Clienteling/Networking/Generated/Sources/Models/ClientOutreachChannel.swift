/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientOutreachChannel: Codable, Equatable {

    enum ClientOutreachChannelType: String, Codable, Equatable, CaseIterable {
        case call = "Call"
        case sms = "SMS"
        case email = "Email"
        case whatsApp = "WhatsApp"
        case weChat = "WeChat"
        case line = "Line"
        case kakao = "Kakao"
    }

    enum ClientOutreachChannelSupportedTemplateTypes: String, Codable, Equatable, CaseIterable {
        case html = "html"
        case text = "text"
    }

    let isPreferred: Bool
    let recipients: [String]?
    let supportedTemplateTypes: [ClientOutreachChannelSupportedTemplateTypes]
    let type: ClientOutreachChannelType

    enum CodingKeys: String, CodingKey {
        case isPreferred = "isPreferred"
        case recipients = "recipients"
        case supportedTemplateTypes = "supportedTemplateTypes"
        case type = "type"
    }

    init(isPreferred: Bool, recipients: [String]? = nil, supportedTemplateTypes: [ClientOutreachChannelSupportedTemplateTypes], type: ClientOutreachChannelType) {
        self.isPreferred = isPreferred
        self.recipients = recipients
        self.supportedTemplateTypes = supportedTemplateTypes
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isPreferred = try container.mkDecode(Bool.self, forKey: .isPreferred)
        self.recipients = try container.mkDecodeIfPresent([String].self, forKey: .recipients)
        self.supportedTemplateTypes = try container.mkDecode([ClientOutreachChannelSupportedTemplateTypes].self, forKey: .supportedTemplateTypes)
        self.type = try container.mkDecode(ClientOutreachChannelType.self, forKey: .type)
    }
}
