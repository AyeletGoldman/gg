/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get the list of all available filters.
/// @description Return the list of all available filters
struct FiltersControllerFindAll: TargetType {
    /// Return the list of all available filters
    enum EventType: String, Codable, Equatable, CaseIterable {
        case appointment = "Appointment"
        case standard = "Standard"
    }
    ///Filter to determine the filters that we should return.
    /// 
    /// Currently there's only one event type that is handled in SF: appointment.
    /// Because we don't know when another event type will be added, we prefer to design
    /// this endpoint like this so that we won't need to apply any change in the near future.
    /// 
    /// There're two options at the moment for this filter: Appointment and Standard.
    /// `Appointment` will return the filters that can be applied on events of type Appointment
    /// and `Standard` will return filters that can be applied on all kind of events
    /// 
    /// This filter is not required at the moment and will return the filters for the
    /// eventType `Standard`, which is consider as the reference for this endpoint.
    let eventType: FiltersControllerFindAll.EventType?
    ///The returned content's expected language. 
    /// The format is defined by RFC-4646: https://tools.ietf.org/html/rfc4646
    /// If the server is unable to honour this language it will return the content in the default language.
    let acceptLanguage: String?

    init(eventType: FiltersControllerFindAll.EventType?, acceptLanguage: String?) {
        self.eventType = eventType
        self.acceptLanguage = acceptLanguage
    }

    var headers: [String: String]? {
        return [
            "Accept-Language": self.acceptLanguage
        ].compactMapValues { $0 }
    }

    var path: String {
        return "/events/v1/filters"
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
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("FiltersControllerFindAll").url
    }
}

extension FiltersControllerFindAll: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

