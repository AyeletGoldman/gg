//
//  ClientActionDetailsScene.swift
//  Zenith Clienteling
//

import MaisonKit

struct ClientActionDetailsScene: Scene {

    let actionTitle: String
    let actionContent: String

    func configure(controller: ClientActionDetailsViewController, using factory: SceneFactory) {
        controller.actionTitle = self.actionTitle
        controller.actionContent = self.actionContent
    }

    func createViewController() -> ClientActionDetailsViewController {
        return ClientActionDetailsViewController()
    }
}
