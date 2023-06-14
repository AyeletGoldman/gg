//
//  ClientInfoViewController.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 12/01/2022.
//
 
import Combine
import MaisonKit

class ClientInfoViewController: StylableViewController<GenericFormView<ClientInfoData>> {
    
    private enum Labels {
        static let title = MKLocalizedString("client360.details.navigationBar.title",
                                             comment: "Title for the client 360 details subview navigation bar")
        static let editTitle = MKLocalizedString("client360.details.edit-button.title",
                                             comment: "Title for the client 360 details edit button")
    }

    private var cancellables = Set<AnyCancellable>()

    var viewModel: ClientInfoViewModel! {
        didSet {
            self.childView = GenericFormView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.title
        self.createEditButton()
        Analytics.log(OpenClientInformationEvent())
    }
    
     private func createEditButton() {
         self.viewModel.$allowEdit.sink { [weak self] allowEdit in
             guard let self = self else { return }
             if allowEdit {
                 self.setRightBarButtonItem(NavigationButton(title: .text(Labels.editTitle),
                                                             action: {self.viewModel.presentEditForm()}))
             } else {
                 self.setRightBarButtonItems([])
             }
         }.store(in: &self.cancellables)
     }
     
}
