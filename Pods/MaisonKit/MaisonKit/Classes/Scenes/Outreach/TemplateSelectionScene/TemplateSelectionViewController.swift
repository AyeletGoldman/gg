// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import Combine
import StylableSwiftUI

final class TemplateSelectionViewController: StylableViewController<TemplateSelectionView> {

    private enum Labels {
        static let navigationBarTitle = MKLocalizedString("outreach.template-selection.navigationBar.title",
                                                          comment: "Title for the screen where the user selects templates")
        static let navigationBarCancelButtonTitle = MKLocalizedString("outreach.template-selection.navigationBar.leading.title",
                                                                    comment: "Title for the navigation bar button that cancel the template selection")
        static let navigationBarNextButtonTitle = MKLocalizedString("outreach.template-selection.navigationBar.trailing.title",
                                                                    comment: "Title for the navigation bar button that moves from template selection to template editing")
    }

    private var cancellables = Set<AnyCancellable>()
    var onCancel: (() -> Void)?

    var viewModel: TemplateSelectionViewModel! {
        didSet {
            self.childView = TemplateSelectionView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "clients", variant: "outreach")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.navigationBarTitle
        self.addNavigationItems()
        self.viewModel.fetchTemplatesAndLanguages()
    }

    private func addNavigationItems() {
        self.setRightBarButtonItem(NavigationButton(title: .text(Labels.navigationBarNextButtonTitle), isEnabled: false, action: self.viewModel.didTapNext))
        self.viewModel.$templateData.sink { [weak self] result in
            guard let self = self else { return }
            let isEnabled = result.isSuccess
            self.setRightBarButtonItem(NavigationButton(title: .text(Labels.navigationBarNextButtonTitle),
                                                        isEnabled: isEnabled,
                                                        action: self.viewModel.didTapNext))
        }.store(in: &self.cancellables)

        if let onCancel = self.onCancel {
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle),
                                                       action: onCancel))
        }
    }
}
