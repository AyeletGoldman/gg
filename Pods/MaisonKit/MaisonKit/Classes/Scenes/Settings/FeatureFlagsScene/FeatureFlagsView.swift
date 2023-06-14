//  Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

#if DEBUG
struct FeatureFlagsView: View {

    @ObservedObject private var viewModel: FeatureFlagsViewModel

    init(viewModel: FeatureFlagsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        if self.viewModel.featureFlags.isEmpty {
            Text("No feature flags")
                .style("background")
        } else {
            List {
                ForEach(self.viewModel.featureFlags) { feature in
                    HStack {
                        Text(feature.name)
                        Spacer()
                        Text("Enabled: \(feature.isEnabled.description)")
                    }
                }
            }.style("background")
        }
    }
}
#endif
