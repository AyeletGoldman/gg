// Copyright © 2022 LVMH. All rights reserved.

import UIKit
import Combine
import StylableSwiftUI

final class ActionSheetViewController: StylableViewController<ActionSheetView> {

    var viewModel: ActionSheetViewModel! {
        didSet {
            self.childView = ActionSheetView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.viewModel.actionSheetContent.title

        if let cancelItem = self.viewModel.actionSheetContent.cancelItem {
            self.setLeftBarButtonItem(NavigationButton(title: .text(cancelItem.title),
                                                        action: {
                cancelItem.action?()
                self.viewModel.didTapCancel()
            }))
        }
    }
}
