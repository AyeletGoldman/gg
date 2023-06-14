//  Copyright © 2022 LVMH. All rights reserved.

public struct NPSDetailsRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "NPSDetailsRouteDescriptor"

    /// The ID of the NPS survey
    public let id: String

    /// Creates a new `NPSDetailsRouteDescriptor`
    /// - Parameter id: The ID of the NPS survey
    public init(id: String) {
        self.id = id
    }
}
