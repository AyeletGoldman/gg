/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get appointment channels for the currently logged in user
/// @description Get available timeslots for the currently logged in user
/// 
/// This endpoint takes two optional parameters: `beginPeriod` and `endPeriod`. These two params form a pair, that means if one is specified, you need to specify the other.
/// In case you only provide one of these parameters, you'll receive a 400 bad request asking to provide the other parameter.
struct GetAppointmentsV1AppointmentsTerritoriesTimeslots: TargetType {
    ///The territory ID selected.
    let territoryId: String
    ///The topic ID selected.
    let topicId: String
    ///The date from which you wanna book an appointment
    let beginPeriod: ISO8601DateString?
    ///The deadline for booking an appointment
    let endPeriod: ISO8601DateString?

    init(territoryId: String, topicId: String, beginPeriod: ISO8601DateString?, endPeriod: ISO8601DateString?) {
        self.territoryId = territoryId
        self.topicId = topicId
        self.beginPeriod = beginPeriod
        self.endPeriod = endPeriod
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/appointments/v1/appointments/territories/timeslots"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        // Formatting request parameters is tricky business because Moya (or Alamofire?) doesn't have the ability to format
        // each parameter individually. So we always format the value beforehand and then pass it into the url encoder
        let queryEncoder = URLQueryEncoder()
        queryEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        queryEncoder.encode(self.territoryId,
                            forKey: "territoryId",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.topicId,
                            forKey: "topicId",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.beginPeriod,
                            forKey: "beginPeriod",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.endPeriod,
                            forKey: "endPeriod",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Get/appointments/v1/appointments/territories/timeslots").url
    }
}

extension GetAppointmentsV1AppointmentsTerritoriesTimeslots: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

