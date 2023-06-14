//
//  PrefsEditViewController.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 17/01/2022.
//
import MaisonKit
import Combine

final class PrefsEditViewController: StylableViewController<GenericFormView<NoteAndPrefsData>> {
    private enum Labels {
        static let title = MKLocalizedString("client-form.notes-and-preferences.edit-prefs.title",
                                             comment: "The title of edit's prefs view controller")
    }
    
    private var cancellables = Set<AnyCancellable>()

    var viewModel: PrefsEditViewModel! {
        didSet {
            self.childView = GenericFormView(viewModel: self.viewModel)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.title
        self.createSaveButton()
        self.createCloseButton()
        Analytics.log(EditPreferencesEvent())
    }
    
    private func createSaveButton() {
        self.viewModel.$isValidForm.sink { [weak self] isValid in
            guard let self = self else { return }
            self.setRightBarButtonItem(NavigationButton(title: .text(GeneralLabels.save), isEnabled: isValid, action: self.viewModel.savePrefs))
        }.store(in: &self.cancellables)
        
        self.viewModel.$isSaving.sink { [weak self] isSaving in
            guard let self = self else { return }
            if isSaving {
                self.setRightBarButtonItem(.loading)
            } else {
                self.setRightBarButtonItem(NavigationButton(title: .text(GeneralLabels.save),
                                                            isEnabled: self.viewModel.isValidForm,
                                                            action: self.viewModel.savePrefs))
            }
        }.store(in: &self.cancellables)
    }
    
    private func createCloseButton() {
        self.setLeftBarButtonItem(NavigationButton(title: .text(GeneralLabels.cancel), action: self.viewModel.closeForm))
    }
    
}
