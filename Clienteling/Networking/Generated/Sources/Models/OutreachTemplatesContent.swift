/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct OutreachTemplatesContent: Codable, Equatable {

    enum OutreachTemplatesContentType: String, Codable, Equatable, CaseIterable {
        case html = "html"
        case text = "text"
    }

    let content: String
    let id: String
    let languageCode: String
    let name: String
    let preview: String?
    let subject: String
    let type: OutreachTemplatesContentType

    enum CodingKeys: String, CodingKey {
        case content = "content"
        case id = "id"
        case languageCode = "languageCode"
        case name = "name"
        case preview = "preview"
        case subject = "subject"
        case type = "type"
    }

    init(content: String, id: String, languageCode: String, name: String, preview: String? = nil, subject: String, type: OutreachTemplatesContentType) {
        self.content = content
        self.id = id
        self.languageCode = languageCode
        self.name = name
        self.preview = preview
        self.subject = subject
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.mkDecode(String.self, forKey: .content)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.languageCode = try container.mkDecode(String.self, forKey: .languageCode)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.preview = try container.mkDecodeIfPresent(String.self, forKey: .preview)
        self.subject = try container.mkDecode(String.self, forKey: .subject)
        self.type = try container.mkDecode(OutreachTemplatesContentType.self, forKey: .type)
    }
}
