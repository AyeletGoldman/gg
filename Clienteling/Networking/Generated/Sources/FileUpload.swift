/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.
///
/// Clienteling APIs
/// Clienteling APIs.
/// Version: v1

import Foundation

struct FileUpload: Codable, Equatable {
    let data: Data
    let mimeType: String?
    let fileName: String?

    init(data: Data, mimeType: String? = nil, fileName: String? = nil) {
        self.data = data
        self.mimeType = mimeType
        self.fileName = fileName
    }
}
