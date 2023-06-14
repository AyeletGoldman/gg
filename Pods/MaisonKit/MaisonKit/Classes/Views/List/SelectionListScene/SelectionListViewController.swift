// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI
import Combine

public final class SelectionListViewController: StylableViewController<SelectionListSceneView> {

    private enum Labels {
        static let navigationBarCancelButtonTitle = MKLocalizedString("selection-list.navigationBar.leading.cancel",
                                                                      comment: "Title for the navigation bar button that cancel a selection list")
    }

    var viewModel: SelectionListViewModel! {
        didSet {
            self.childView = SelectionListSceneView(viewModel: self.viewModel)
        }
    }

    private var cancellables = Set<AnyCancellable>()

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.title

        self.createDoneBarButton()
        if let onDismiss = self.viewModel.onDismiss {
            self.createDismissBarButton(onDismiss: onDismiss)
        }
    }

    private func createDoneBarButton() {
        self.viewModel.$isValidSelection.sink { _ in } receiveValue: { isValid in
            self.setRightBarButtonItem(NavigationButton(title: .text(self.viewModel.doneButtonTitle),
                                                        isEnabled: isValid,
                                                        action: self.viewModel.onDone))
        }.store(in: &self.cancellables)
    }

    private func createDismissBarButton(onDismiss: @escaping () -> Void) {
        self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle), action: onDismiss))
    }
}
