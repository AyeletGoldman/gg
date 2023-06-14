//
//  noteAndPrefsAction.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 29/12/2021.
//

import MaisonKit

extension MenuAction {

    static func noteAndPrefsAction(clientId: String) -> MenuAction {
        let title = MKLocalizedString("client360.actions.notes-and-preferences.title",
                                      comment: "The title of the notes and preferences button in the client 360 menu")

        let action = MenuAction(localizedTitle: title,
                                imageIdentifier: "pulldown_icon-notes",
                                preferredPresentationStyle: .push,
                                sceneFactory: { _ in
            return NoteAndPrefsScene(clientId: clientId)
        })

        return action
    }
}
