//  Copyright © 2021 LVMH. All rights reserved.

import Combine
#if DEBUG
final class FeatureFlagsViewModel: ObservableObject {

    var featureFlags: [FeatureFlagDisplayable] {
        Features.manager.allFeatureFlags.map { FeatureFlagDisplayable(name: $0.name.rawValue, isEnabled: $0.isEnabled) }
    }
}

struct FeatureFlagDisplayable: Identifiable {
    var id: String {
        return self.name
    }
    let name: String
    let isEnabled: Bool
}
#endif
