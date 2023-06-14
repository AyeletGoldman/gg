//  Copyright © 2021 LVMH. All rights reserved.

import UIKit
#if DEBUG
final class FeatureFlagsViewController: StylableViewController<FeatureFlagsView> {

    var viewModel: FeatureFlagsViewModel! {
        didSet {
            self.childView = FeatureFlagsView(viewModel: viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
#endif
