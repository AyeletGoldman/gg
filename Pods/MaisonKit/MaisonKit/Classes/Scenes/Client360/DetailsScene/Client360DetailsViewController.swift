// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import Combine
import StylableSwiftUI

final class Client360DetailsViewController: StylableViewController<GenericFormView<Client360Displayable.Details>> {

    private enum Labels {
        static let editButtonTitle = MKLocalizedString("client360.details.navigation-bar.trailing.edit",
                                                       comment: "The title of the button to start editing a client's profile")
    }

    var viewModel: Client360DetailsViewModel! {
        didSet {
            self.childView = GenericFormView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        StylistIdentifier.buildFullIdentifier(for: "clients", variant: "profile")
    }

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.title

        self.viewModel.fetchClientData()
        self.buildRightBarButtonItems()
        self.viewModel.logViewAnalytics()
    }

    private func buildRightBarButtonItems() {
        if Features.manager.isEnabled(.editClient, defaultValue: false) {
            self.setRightBarButtonItem(NavigationButton(title: .text(Labels.editButtonTitle),
                                                        action: self.viewModel.didTapEditClientButton))
        }
    }
}
