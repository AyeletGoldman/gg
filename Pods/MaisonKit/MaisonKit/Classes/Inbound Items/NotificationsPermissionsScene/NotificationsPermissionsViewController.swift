//  Copyright © 2021 LVMH. All rights reserved.

import UIKit

final class NotificationsPermissionsViewController: StylableViewController<NotificationsPermissionsView> {

    private enum Labels {
        static let title = MKLocalizedString("notifications.permission-modal.navigation-bar.title",
                                             comment: "The title for the permissions modal's navigation bar")
        static let cancelTitle = MKLocalizedString("notifications.permission-modal.navigation-bar.cancel.title",
                                             comment: "The title for the permissions modal's navigation bar cancel button")
    }

    var viewModel: NotificationsPermissionsViewModel! {
        didSet {
            self.childView = NotificationsPermissionsView(viewModel: viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.title

        self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.cancelTitle),
                                                   action: self.viewModel.didTapCancel))
    }
}
