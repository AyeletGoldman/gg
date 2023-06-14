// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI
import Combine

final class DashboardViewController: TabBarRootViewController<DashboardView> {

    private enum Labels {
        static let dashboardHeadingTitle = MKLocalizedString("dashboard.heading.title", comment: "The title for the dashboard heading")
    }

    var viewModel: DashboardViewModel! {
        didSet {
            self.childView = DashboardView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return "dashboard"
    }

    override var tabBarImageIcon: String { return "icon-dashboard" }
    override var tabBarTitle: String { return MKLocalizedString("tab.dashboard.title", comment: "The tab icon title for Dashboard") }

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.dashboardHeadingTitle

        self.setSpinnerAppearance()
        self.stylist.$currentTheme
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.setSpinnerAppearance()
            }.store(in: &self.cancellables)

        self.viewModel.fetchDashboard()
    }

    private func setSpinnerAppearance() {
        let appearance = UIRefreshControl.appearance(whenContainedInInstancesOf: [ListAppearance.appearanceContainer, DashboardViewController.self])
        appearance.tintColor = self.styleContainer.backgroundColor(for: "spinner/background")
    }
}
