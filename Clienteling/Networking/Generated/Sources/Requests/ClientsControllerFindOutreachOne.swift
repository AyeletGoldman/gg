/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get client's outreach channels.
/// @description Get client's outreach channels by client ID.
struct ClientsControllerFindOutreachOne: TargetType {
    ///The client ID to get data of
    let clientId: String
    ///The types of channels you'd like to receive
    let channels: [OutreachChannels]?

    init(clientId: String, channels: [OutreachChannels]?) {
        self.clientId = clientId
        self.channels = channels
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/outreach/v1/clients/{clientId}/outreach"
        let formatter = PathFormatter()
        let clientIdSafe = formatter.format(value: self.clientId)
        path = path.replacingOccurrences(of: "{clientId}", with: clientIdSafe)
        return path
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        // Formatting request parameters is tricky business because Moya (or Alamofire?) doesn't have the ability to format
        // each parameter individually. So we always format the value beforehand and then pass it into the url encoder
        let queryEncoder = URLQueryEncoder()
        queryEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        queryEncoder.encode(self.channels,
                            forKey: "channels",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("ClientsControllerFindOutreachOne").url
    }
}

extension ClientsControllerFindOutreachOne: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

