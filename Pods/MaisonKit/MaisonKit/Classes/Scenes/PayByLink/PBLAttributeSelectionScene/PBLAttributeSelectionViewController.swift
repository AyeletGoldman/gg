//  Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI
import Combine

final class PBLAttributeSelectionViewController: StylableViewController<PBLAttributeSelectionView> {

    private var cancellables = Set<AnyCancellable>()

    private enum Labels {
        static let navigationBarCancelButtonTitle = MKLocalizedString("pay-by-link.attribute-selection.navigation-bar.leading.cancel",
                                                                      comment: "Title for the navigation bar button that cancel the attribute selection in pay-by-link")
        static let navigationBarDoneButtonTitle = MKLocalizedString("pay-by-link.attribute-selection.navigation-bar.trailing.done",
                                                                      comment: "Title for the navigation bar button 'Done' in attribute selection in pay-by-link")
        static let title = MKLocalizedString("pay-by-link.attribute-selection.navigation-bar.title",
                                                                      comment: "Title for the navigation bar in attribute selection for pay-by-link")
    }

    var viewModel: PBLAttributeSelectionViewModel! {
        didSet {
            self.childView = PBLAttributeSelectionView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "products", variant: "pay-by-link")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.title
        self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle),
                                                   action: self.viewModel.didTapCancel))
        self.viewModel.$isValidSelection.sink { _ in } receiveValue: { isValid in
            self.setRightBarButtonItem(NavigationButton(title: .text(Labels.navigationBarDoneButtonTitle),
                                                        isEnabled: isValid,
                                                        action: self.viewModel.didTapDone))

        }.store(in: &self.cancellables)

        self.viewModel.fetchProductData()
    }
}
