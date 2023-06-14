// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI
import Combine

final class NotificationCenterViewController: StylableViewController<NotificationCenterView> {

    private enum Labels {
        static let navigationBarTitle = MKLocalizedString("notification-center.navigationBar.title",
                                                          comment: "Title for notification center screen")
    }

    var viewModel: NotificationCenterViewModel! {
        didSet {
            self.childView = NotificationCenterView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return "notifications"
    }

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.navigationBarTitle

        self.setSpinnerAppearance()
        self.stylist.$currentTheme
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.setSpinnerAppearance()
            }.store(in: &self.cancellables)

        self.viewModel.fetchData()
    }

    private func setSpinnerAppearance() {
        let appearance = UIRefreshControl.appearance(whenContainedInInstancesOf: [ListAppearance.appearanceContainer, NotificationCenterViewController.self])
        appearance.tintColor = self.styleContainer.backgroundColor(for: "spinner/background")
    }
}
