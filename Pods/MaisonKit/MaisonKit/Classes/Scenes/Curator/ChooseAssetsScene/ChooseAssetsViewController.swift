// Copyright © 2022 LVMH. All rights reserved.

import UIKit
import Combine
import StylableSwiftUI

final class ChooseAssetsViewController: StylableViewController<ChooseAssetsView> {

    private enum Labels {
        static let title = MKLocalizedString("choose-assets.navigation-bar.title",
                                             comment: "Title of navigation bar in choose assets screen")
        static let close = MKLocalizedString("choose-assets.navigation-bar.close.title",
                                             comment: "Title of close button in choose assets screen")
        static let done = MKLocalizedString("choose-assets.navigation-bar.done.title",
                                            comment: "Title of done button in choose assets screen")
    }

    var viewModel: ChooseAssetsViewModel! {
        didSet {
            self.childView = ChooseAssetsView(viewModel: viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "products", variant: "curator")
    }

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = Labels.title

        self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.close), action: self.viewModel.didTapClose))

        Publishers.CombineLatest(self.viewModel.$assetsDisplayable, self.viewModel.$isSaving)
            .sink { [weak self] displayable, isSaving in
                guard let self = self else { return }
                if isSaving {
                    self.setRightBarButtonItem(.loading)
                } else {
                    self.setRightBarButtonItem(NavigationButton(title: .text(Labels.done),
                                                                isEnabled: displayable.isSuccess,
                                                                action: self.viewModel.didTapDone))
                }
            }.store(in: &self.cancellables)

        self.viewModel.fetchAssets()
    }
}
