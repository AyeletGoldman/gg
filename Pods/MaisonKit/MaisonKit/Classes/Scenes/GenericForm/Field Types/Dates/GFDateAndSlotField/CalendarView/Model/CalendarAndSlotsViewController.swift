// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI
import Combine

private enum Labels {

    static let navigationBarCancelButtonTitle = MKLocalizedString("calendar-and-slots.navigationBar.leading.cancel",
                                                                  comment: "Title for the navigation bar button that cancel calendar and slots screen")
    static let navigationBarDoneButtonTitle = MKLocalizedString("calendar-and-slots.navigationBar.trailing.done",
                                                                comment: "Title for the done button in the calendar and slots screen navigation bar")
}

final class CalendarAndSlotsViewController: StylableViewController<CalendarAndSlotsSceneView> {

    var viewModel: CalendarAndSlotsViewModel! {
        didSet {
            self.childView = CalendarAndSlotsSceneView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.pageTitle

        self.createCloseButton()
        self.createDoneButton()
    }

    private func createCloseButton() {
        if self.isModal {
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle),
                                                       action: self.viewModel.onDismiss))
        }
    }

    private func createDoneButton() {
        self.setRightBarButtonItem(NavigationButton(title: .text(Labels.navigationBarDoneButtonTitle),
                                                    action: self.viewModel.onDone))
    }
}
