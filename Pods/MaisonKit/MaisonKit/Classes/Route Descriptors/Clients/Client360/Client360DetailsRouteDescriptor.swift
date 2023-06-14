// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor to create a Client 360 details screen
public struct Client360DetailsRouteDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "Client360DetailsRouteDescriptor"

    /// The ID of the client to fetch the details for
    public let clientId: String
    /// The name of the client, if available. This will ususally be used as the title in the navigation bar.
    public let clientName: String?
}
