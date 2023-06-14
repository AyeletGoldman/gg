//
//  ClientInfoAction.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 12/01/2022.
//

import MaisonKit

public extension MenuAction {
    
    static func clientInfoAction(clientId: String) -> MenuAction {
        let title = MKLocalizedString("client360.actions.additional-information.title",
                                      comment: "The title of the client 360 action for additional information")
        
        let action = MenuAction(localizedTitle: title,
                                imageIdentifier: "pulldown_icon-info",
                                preferredPresentationStyle: .push,
                                sceneFactory: { _ in
            return ClientInfoScene(clientId: clientId)
        })
        
        return action
    }
}
