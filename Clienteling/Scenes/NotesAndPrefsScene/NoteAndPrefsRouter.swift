//
//  NoteEditRouter.swift
//  Zenith Clienteling
//
//  Created by Noy Barak on 26/04/2022.
//

import MaisonKit
import UIKit

class NoteAndPrefsRouter: Router<UIViewController>, DefaultGenericFormPresenterRouter {

    func presentEditNote(_ note: NoteContent, onDone: @escaping (_ didSave: Bool) -> Void) {
        let scene = NoteEditScene(note: note, onDone: { didSave, controller in
            onDone(didSave)
            controller.dismiss(animated: true)
        })
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller, animated: true, completion: nil)
    }
}
