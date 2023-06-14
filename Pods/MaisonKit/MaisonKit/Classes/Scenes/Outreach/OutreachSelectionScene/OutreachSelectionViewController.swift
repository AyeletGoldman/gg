// Copyright © 2022 LVMH. All rights reserved.

import UIKit

final class OutreachSelectionViewController: StylableViewController<OutreachSelectionView> {

    private enum Labels {
        static let navigationBarCancelTitle = MKLocalizedString("outreach-selection.navigation-bar.cancel.title",
                                                                comment: "Cancel button shown in the navigation bar of the outreach selection screen")
        static let navigationTitle = MKLocalizedString("outreach-selection.navigation-bar.title",
                                                                comment: "Title shown in the navigation bar of the outreach selection screen")
    }

    var viewModel: OutreachSelectionViewModel! {
        didSet {
            self.childView = OutreachSelectionView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Close the keyboard in case it opens on the previous screen
        UIApplication.shared.endEditing(true)

        self.title = Labels.navigationTitle

        self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelTitle),
                                                   action: { [weak self] in
            self?.viewModel.didTapCancel()
        }))

        self.viewModel.fetchChannels()
    }
}
