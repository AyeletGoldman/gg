/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get appointments for the current logged in user
/// @description Get appointments for the current logged in user
struct GetAppointmentsV2Appointments: TargetType {
    ///The advisor ID of the advisor which assigned to the appointment.
    let advisorId: String?
    ///The client ID of the client for whom the appointment is scheduled.
    let clientId: String?
    ///The territory owner ID of the territory at which the appointment will take place. If the appointment is virtual, the territory ID will be the same territory in which the advisor is working at.
    let territoryOwnerId: String?
    ///The territory ID at which the appointment will take place. If the appointment is virtual, the territory ID will be the same territory in which the advisor is working at.
    let territoryId: String?
    ///The date representation of the appointment's starting time.
    let startDate: UTCDate?
    ///The date representation of the appointment's ending time.
    let endDate: UTCDate?
    ///The type of the appointment.
    let type: String?

    init(advisorId: String?, clientId: String?, territoryOwnerId: String?, territoryId: String?, startDate: UTCDate?, endDate: UTCDate?, type: String?) {
        self.advisorId = advisorId
        self.clientId = clientId
        self.territoryOwnerId = territoryOwnerId
        self.territoryId = territoryId
        self.startDate = startDate
        self.endDate = endDate
        self.type = type
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/appointments/v2/appointments"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        // Formatting request parameters is tricky business because Moya (or Alamofire?) doesn't have the ability to format
        // each parameter individually. So we always format the value beforehand and then pass it into the url encoder
        let queryEncoder = URLQueryEncoder()
        queryEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        queryEncoder.encode(self.advisorId,
                            forKey: "advisorId",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.clientId,
                            forKey: "clientId",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.territoryOwnerId,
                            forKey: "territoryOwnerId",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.territoryId,
                            forKey: "territoryId",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.startDate,
                            forKey: "startDate",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.endDate,
                            forKey: "endDate",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.type,
                            forKey: "type",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("Get/appointments/v2/appointments").url
    }
}

extension GetAppointmentsV2Appointments: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

