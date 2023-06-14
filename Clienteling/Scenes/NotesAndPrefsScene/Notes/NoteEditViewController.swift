//
//  NotesEditViewController.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 17/01/2022.
//

import Combine
import MaisonKit

class NoteEditViewController: StylableViewController<NoteEditView> {
    
    private enum Labels {
        static let navBarCancelButtonTitle = MKLocalizedString("client360.note-form.navigationBar.cancel",
                                                               comment: "Title for the cancel edit note button")
        static let navBarSaveButtonTitle = MKLocalizedString("client360.note-form.navigationBar.save",
                                                             comment: "Title for the save note button")
    }
    private var cancellables = Set<AnyCancellable>()
    
    var viewModel: NoteEditViewModel! {
        didSet {
            self.childView = NoteEditView(viewModel: self.viewModel)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.navBarTitle
        self.createSaveButton()
        self.createCloseButton()
    }
    
    private func createSaveButton() {
        self.viewModel.$isValidForm.sink { [weak self] isValid in
            guard let self = self else { return }
            self.setRightBarButtonItem(NavigationButton(title: .text(Labels.navBarSaveButtonTitle),
                                                        isEnabled: isValid, action: self.viewModel.saveNote))
        }.store(in: &self.cancellables)
        
        self.viewModel.$isSaving.sink { [weak self] isSaving in
            guard let self = self else { return }
            if isSaving {
                self.setRightBarButtonItem(.loading)
            } else {
                self.setRightBarButtonItem(NavigationButton(title: .text(Labels.navBarSaveButtonTitle),
                                                            isEnabled: self.viewModel.isValidForm,
                                                            action: self.viewModel.saveNote))
            }
        }.store(in: &self.cancellables)
    }
    
    private func createCloseButton() {
        self.setLeftBarButtonItem(NavigationButton(title: .text(GeneralLabels.cancel), action: self.viewModel.closeForm))
    }
}
