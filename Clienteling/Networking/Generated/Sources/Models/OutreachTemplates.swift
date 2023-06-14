/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct OutreachTemplates: Codable, Equatable {

    let languages: [TemplateLanguages]
    let templates: [OutreachTemplatesContent]

    enum CodingKeys: String, CodingKey {
        case languages = "languages"
        case templates = "templates"
    }

    init(languages: [TemplateLanguages], templates: [OutreachTemplatesContent]) {
        self.languages = languages
        self.templates = templates
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.languages = try container.mkDecode([TemplateLanguages].self, forKey: .languages)
        self.templates = try container.mkDecode([OutreachTemplatesContent].self, forKey: .templates)
    }
}
