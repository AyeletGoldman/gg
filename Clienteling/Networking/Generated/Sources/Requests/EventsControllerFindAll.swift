/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get the list of all events.
/// @description Get the list of all events.
/// 
/// There are several filters available at the moment.
/// Three of them (appointmentTopicId, appointmentChannel, storeId) can be applied only if the eventType is appointment.
/// In case you specify one of these three filters without passing eventType=Appointment as well, an error is thrown.
/// 
/// Note: If you consider sending multiple values for a single filter,
/// the recommend way to that is to separate them using a comma `,`.
struct EventsControllerFindAll: TargetType {
    /// Get the list of all events.
    /// 
    /// There are several filters available at the moment.
    /// Three of them (appointmentTopicId, appointmentChannel, storeId) can be applied only if the eventType is appointment.
    /// In case you specify one of these three filters without passing eventType=Appointment as well, an error is thrown.
    /// 
    /// Note: If you consider sending multiple values for a single filter,
    /// the recommend way to that is to separate them using a comma `,`.
    enum EventType: String, Codable, Equatable, CaseIterable {
        case appointment = "Appointment"
        case standard = "Standard"
    }
    ///Filter to determine the type of the event
    let eventType: EventsControllerFindAll.EventType?
    ///Filters used to refine the events retrieved.
    /// 
    /// ```
    /// filters = {
    ///   filterKey1 : VALUE1,
    ///   filterKey2 : VALUEA,VALUEB,VALUEC
    /// }
    /// ```
    /// 
    /// The filterKeys are obtained from the result of the get filters query.
    /// 
    /// In case an array of values are provided with a filter,
    /// the logical operation that will be apply is `Logical OR`
    let filters: [String: [String]]?

    init(eventType: EventsControllerFindAll.EventType?, filters: [String: [String]]?) {
        self.eventType = eventType
        self.filters = filters
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/events/v1/events"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        // Formatting request parameters is tricky business because Moya (or Alamofire?) doesn't have the ability to format
        // each parameter individually. So we always format the value beforehand and then pass it into the url encoder
        let queryEncoder = URLQueryEncoder()
        queryEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        queryEncoder.encode(self.eventType,
                            forKey: "eventType",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.filters,
                            forKey: "filters",
                            explode: false,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("EventsControllerFindAll").url
    }
}

extension EventsControllerFindAll: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

