//
//  ClientInfoEditViewController.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 13/01/2022.
//

import Combine
import MaisonKit

class ClientInfoEditViewController: StylableViewController<GenericFormView<ClientInfoData>> {
    
    private enum Labels {
        static let title = MKLocalizedString("client360.details.edit.title",
                                             comment: "Title for the client 360 edit details subview")
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    var viewModel: ClientInfoEditViewModel! {
        didSet {
            self.childView = GenericFormView(viewModel: self.viewModel)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.title
        self.createSaveButton()
        self.createCloseButton()
        Analytics.log(EditClientInformationEvent())
    }
    
    private func createSaveButton() {
        self.viewModel.$isValidForm.sink { [weak self] isValid in
            guard let self = self else { return }
            self.setRightBarButtonItem(NavigationButton(title: .text(GeneralLabels.save), isEnabled: isValid, action: self.viewModel.saveForm))
        }.store(in: &self.cancellables)

        self.viewModel.$isSaving.sink { [weak self] isSaving in
            guard let self = self else { return }
            if isSaving {
                self.setRightBarButtonItem(.loading)
            } else {
                self.setRightBarButtonItem(NavigationButton(title: .text(GeneralLabels.save),
                                                            isEnabled: self.viewModel.isValidForm,
                                                            action: self.viewModel.saveForm))
            }
        }.store(in: &self.cancellables)
    }
    
    private func createCloseButton() {
        self.setLeftBarButtonItem(NavigationButton(title: .text(GeneralLabels.cancel), action: self.viewModel.closeForm))
    }
    
}
