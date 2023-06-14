/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get saved templates.
/// @description Get saved templates.
struct TemplatesControllerFindAll: TargetType {
    /// Get saved templates.
    enum Category: String, Codable, Equatable, CaseIterable {
        case outreach = "outreach"
        case productShare = "productShare"
        case payByLink = "payByLink"
        case virtualConsultation = "virtualConsultation"
        case curator = "curator"
    }
    ///Filter by template category
    let category: TemplatesControllerFindAll.Category?

    init(category: TemplatesControllerFindAll.Category?) {
        self.category = category
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/outreach/v1/templates"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        // Formatting request parameters is tricky business because Moya (or Alamofire?) doesn't have the ability to format
        // each parameter individually. So we always format the value beforehand and then pass it into the url encoder
        let queryEncoder = URLQueryEncoder()
        queryEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        queryEncoder.encode(self.category,
                            forKey: "category",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("TemplatesControllerFindAll").url
    }
}

extension TemplatesControllerFindAll: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

