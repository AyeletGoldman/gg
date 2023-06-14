//
//  ClientInfoRouter.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 12/01/2022.
//

import MaisonKit
import UIKit

class ClientInfoRouter: Router<UIViewController>, DefaultGenericFormPresenterRouter {

    func presentEditForm(clientId: String,
                         clientDetailsData: [FieldsSection],
                         onDone: @escaping (_ didSave: Bool) -> Void) {
        let scene = ClientInfoEditScene(clientId: clientId, clientDetailsData: clientDetailsData,
                                        onDone: { didSave, controller in
            onDone(didSave)
            controller.dismiss(animated: true)
        })
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller, animated: true, completion: nil)
    }
}
