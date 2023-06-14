//
//  ClientInfoScene.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 12/01/2022.
//

import MaisonKit

struct ClientInfoScene: Scene {
    
    private let clientId : String
    
    init (clientId: String){
        self.clientId = clientId
    }

    func createViewController() -> ClientInfoViewController {
        return ClientInfoViewController()
    }
    
    func configure(controller: ClientInfoViewController, using factory: SceneFactory) {
        let router = ClientInfoRouter(controller: controller, factory: factory)
        let viewModel = ClientInfoViewModel(router: router, clientId: clientId)
        controller.viewModel = viewModel
    }
    
}
