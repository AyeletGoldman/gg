// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import FirebaseRemoteConfig
import MaisonKit

extension SceneDelegate {
    func setupFeatureFlags() {
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        #if DEBUG
        settings.minimumFetchInterval = 0
        #else
        settings.minimumFetchInterval = 3600
        #endif
        remoteConfig.configSettings = settings

        remoteConfig.fetchAndActivate { status, error in
            guard status != .error else {
                return
            }
            Features.manager.addFeatureFlag(Flag(name: .scanBarcode, isEnabled: true))
//            Features.manager.addFeatureFlag(Flag(name: .enableTimelinePublisherRefreshFromImplementation, isEnabled: true))
            // Define features from Firebase
        }
    }
}
