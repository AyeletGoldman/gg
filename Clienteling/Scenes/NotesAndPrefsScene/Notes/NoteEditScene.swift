//
//  NotesEditScene.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 17/01/2022.
//

import MaisonKit

struct NoteEditScene: Scene {
    
    private let note: NoteContent
    let onDone: (_ didSave: Bool, UIViewController) -> Void
    
    init(note: NoteContent, onDone: @escaping (_ didSave: Bool, UIViewController) -> Void) {
        self.note = note
        self.onDone = onDone
    }
    
    func createViewController() -> NoteEditViewController {
        return NoteEditViewController()
    }
    
    func configure(controller: NoteEditViewController, using factory: SceneFactory) {
        let viewModel = NoteEditViewModel(note: self.note, onDone: { [weak controller] didSave in
            guard let controller = controller else { return }
            self.onDone(didSave, controller)
        })
        controller.viewModel = viewModel
    }
}
