//
//   PrefsEditScene.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 17/01/2022.
//
import MaisonKit
import Foundation

struct PrefsEditScene: Scene {
    
    private let data: NoteAndPrefsData
    let onDone: (_ didSave: Bool, UIViewController) -> Void
    
    init(data: NoteAndPrefsData, onDone: @escaping (_ didSave: Bool, UIViewController) -> Void) {
        self.data = data
        self.onDone = onDone
    }
    
    func createViewController() -> PrefsEditViewController {
        return PrefsEditViewController()
    }
    
    func configure(controller: PrefsEditViewController, using factory: SceneFactory) {
        let router = DefaultGenericFormRouter(controller: controller, factory: factory)
        let viewModel = PrefsEditViewModel(data: self.data, onDone: { [weak controller] didSave in
            guard let controller = controller else { return }
            self.onDone(didSave, controller)
        }, router: router)
        controller.viewModel = viewModel
    }
}
