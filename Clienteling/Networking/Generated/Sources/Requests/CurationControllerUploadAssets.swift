/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Upload personal assets for a given curation.
struct CurationControllerUploadAssets: TargetType {
    ///Curation ID to update curation information
    let curationId: String
    let uploadAssetBody: UploadAssetBody

    init(curationId: String, uploadAssetBody: UploadAssetBody) {
        self.curationId = curationId
        self.uploadAssetBody = uploadAssetBody
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/curations/v1/curations/{curationId}/assets"
        let formatter = PathFormatter()
        let curationIdSafe = formatter.format(value: self.curationId)
        path = path.replacingOccurrences(of: "{curationId}", with: curationIdSafe)
        return path
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        let multipartEncoder = MultipartFormEncoder()
        multipartEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        multipartEncoder.encode(self.uploadAssetBody,
                                forKey: "value")
        return .uploadMultipart(multipartEncoder.formData)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("CurationControllerUploadAssets").url
    }
}

extension CurationControllerUploadAssets: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

