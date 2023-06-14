/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboardMultiValueBarBars: Codable, Equatable {

    let progressBarValues: [IDashboardMultiValueBarBarsProgressValue]
    let title: String

    enum CodingKeys: String, CodingKey {
        case progressBarValues = "progressBarValues"
        case title = "title"
    }

    init(progressBarValues: [IDashboardMultiValueBarBarsProgressValue], title: String) {
        self.progressBarValues = progressBarValues
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.progressBarValues = try container.mkDecode([IDashboardMultiValueBarBarsProgressValue].self, forKey: .progressBarValues)
        self.title = try container.mkDecode(String.self, forKey: .title)
    }
}
