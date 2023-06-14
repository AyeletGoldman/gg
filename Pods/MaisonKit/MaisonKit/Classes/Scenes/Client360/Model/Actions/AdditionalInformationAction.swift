// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension MenuAction {

    /// Creates a new `MenuAction` that will be used to display the Client 360 details scene
    /// - Parameters:
    ///   - clientId: the ID of the client to display the details for
    ///   - clientName: _optional_. the name of the client
    /// - Returns: an instance of `MenuAction` that will return the Client360 details scene.
    static func additionalInformationAction(clientId: String, clientName: String?) -> MenuAction {
        let title = MKLocalizedString("client360.actions.additional-information.title",
                                      comment: "The title of the client 360 action for additional information")

        return MenuAction(localizedTitle: title,
                          imageIdentifier: Self.buildIdentifier(withToken: "icon-info"),
                          routeDescriptorFactory: { _ in
            return Client360DetailsRouteDescriptor(clientId: clientId, clientName: clientName)
        })
    }
}
