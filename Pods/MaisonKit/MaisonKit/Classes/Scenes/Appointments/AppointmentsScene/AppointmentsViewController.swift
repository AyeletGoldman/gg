// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI
import Combine

final class AppointmentsViewController: TabBarRootViewController<AppointmentsView> {

    private enum Labels {
        static let title = MKLocalizedString("appointments.navigationBar.title",
                                             comment: "The title to show in the navigation bar for the appointments scene")
    }

    private var cancellables = Set<AnyCancellable>()

    var viewModel: AppointmentsViewModel! {
        didSet {
            self.childView = AppointmentsView(viewModel: self.viewModel)
        }
    }

    override var tabBarImageIcon: String { return "icon-calendar" }
    override var tabBarTitle: String { return MKLocalizedString("tab.appointments.title", comment: "The tab icon title for Appointments") }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.title

        self.viewModel.fetchTimelineDetails()

        self.setRightBarButtonItem(NavigationButton(title: .image(.styledImage(identifier: "icon-add")),
                                                    action: self.viewModel.presentBookAppointment))
    }
}
