// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension MenuAction {

    /// Creates a new `MenuAction` that will be used to display the Client 360 notes and preferences scene
    /// - Parameters:
    ///   - clientId: the ID of the client to display the notes and preferences for
    /// - Returns: an instance of `MenuAction` that will return the Client360 notes & preferences scene.
    static func notesAndPreferencesAction(clientId: String) -> MenuAction {
        let title = MKLocalizedString("client360.actions.notes-and-preferences.title",
                                      comment: "The title of the notes and preferences button in the client 360 menu")

        return MenuAction(localizedTitle: title,
                          imageIdentifier: Self.buildIdentifier(withToken: "icon-notes"),
                          routeDescriptorFactory: { _ in
            return Client360NotesAndPreferencesRouteDescriptor(clientId: clientId)
        })
    }
}
