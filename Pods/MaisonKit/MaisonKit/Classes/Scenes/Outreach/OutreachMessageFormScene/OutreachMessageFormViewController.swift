// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI
import Combine

final class OutreachMessageFormViewController: StylableViewController<OutreachMessageFormView> {

    private enum Labels {
        static let navigationBarTitle = MKLocalizedString("outreach.message.form.navigationBar.title", comment: "Title for the outreach message form scene")
        static let navigationBarNextButtonTitle = MKLocalizedString(
            "outreach.navigationBar.trailing.title",
            comment: "Button for navigation bar in outreach 'Next'")
    }

    private var cancellables = Set<AnyCancellable>()

    var viewModel: OutreachMessageViewModel! {
        didSet {
            self.childView = OutreachMessageFormView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "clients", variant: "outreach")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.navigationBarTitle
        self.addNavigationItems()
    }

    private func addNavigationItems() {
        self.viewModel.$isValidForm.sink { [weak self] isValid in
            guard let self = self else { return }
            self.setRightBarButtonItem(NavigationButton(title: .text(Labels.navigationBarNextButtonTitle),
                                                        isEnabled: isValid,
                                                        action: { [weak self] in
                self?.viewModel.didTapNext()
                self?.view.endEditing(true)
            }))
        }.store(in: &self.cancellables)

    }
}
