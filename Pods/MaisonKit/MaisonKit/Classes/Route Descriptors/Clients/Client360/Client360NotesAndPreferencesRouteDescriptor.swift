// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the notes and preferences screen in Client 360
// swiftlint:disable:next type_name
public struct Client360NotesAndPreferencesRouteDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "Client360NotesAndPreferencesRouteDescriptor"

    /// The ID of the client to fetch notes and preferences for
    public let clientId: String
}
