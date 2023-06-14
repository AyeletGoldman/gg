//
//  ClientInfoEditScene.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 13/01/2022.
//

import MaisonKit

struct ClientInfoEditScene: Scene {

    private let clientId: String
    private let clientDetailsData: [FieldsSection]
    private let onDone: (_ didSave: Bool, UIViewController) -> Void

    init(clientId: String,
         clientDetailsData: [FieldsSection],
         onDone: @escaping (_ didSave: Bool, UIViewController) -> Void) {
        self.clientId = clientId
        self.clientDetailsData = clientDetailsData
        self.onDone = onDone
    }

    
    func createViewController() -> ClientInfoEditViewController {
        return ClientInfoEditViewController()
    }
    
    func configure(controller: ClientInfoEditViewController, using factory: SceneFactory) {
        let router = DefaultGenericFormRouter(controller: controller, factory: factory)
        let viewModel = ClientInfoEditViewModel(
            clientId: self.clientId,
            clientDetailsData: self.clientDetailsData,
            onDone: { [weak controller] didSave in
                guard let controller = controller else { return }
                self.onDone(didSave, controller)
            },
            router: router)
        controller.viewModel = viewModel
    }
    
}
