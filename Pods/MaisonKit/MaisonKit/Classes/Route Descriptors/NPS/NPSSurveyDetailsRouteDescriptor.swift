//  Copyright © 2022 LVMH. All rights reserved.

/// The route descriptor for the details of a survey
public struct NPSSurveyDetailsRouteDescriptor: RouteDescriptor {

    public static let identifier: Identifier = "NPSSurveyDetailsRouteDescriptor"

    /// The ID of the NPS survey to show the answers for
    public let id: String

    /// Creates a new `NPSSurveyDetailsRouteDescriptor`.
    /// - Parameter id: The ID of the NPS survey to show the answers for
    public init(id: String) {
        self.id = id
    }
}
