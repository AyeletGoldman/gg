// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

public final class FiltersViewController: StylableViewController<FiltersSceneView> {

    private enum Labels {
        static let navigationBarCancelButtonTitle = MKLocalizedString("filters.navigationBar.leading.cancel",
                                                                      comment: "Title for the navigation bar button that cancel the filters selection")
    }

    var viewModel: FiltersViewModel! {
        didSet {
            self.childView = FiltersSceneView(viewModel: self.viewModel)
        }
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.title

        self.createDoneBarButton()
        if let onDismiss = self.viewModel.onDismiss {
            self.createDismissBarButton(onDismiss: onDismiss)
        }
    }

    private func createDoneBarButton() {
        self.setRightBarButtonItem(NavigationButton(title: .text(self.viewModel.doneButtonTitle), action: self.viewModel.onDone))
    }

    private func createDismissBarButton(onDismiss: @escaping () -> Void) {
        self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle), action: onDismiss))
    }
}
