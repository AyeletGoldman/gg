//
//  NotesAndPrefsViewController.swift
//  Zenith Clienteling Dev
//

import UIKit
import StylableSwiftUI
import MaisonKit

class NoteAndPrefsViewController: StylableViewController<GenericFormView<NoteAndPrefsData>> {

    private enum Labels {
        static let title = MKLocalizedString("client-form.notes-and-preferences.title",
                                             comment: "The title of the notes and preferences view controller")
    }

    var viewModel: NoteAndPrefsViewModel! {
        didSet {
            self.childView = GenericFormView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.title
    }
}

