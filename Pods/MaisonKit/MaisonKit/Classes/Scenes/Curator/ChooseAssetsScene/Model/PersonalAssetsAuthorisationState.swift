// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Photos

enum PersonalAssetsAuthorisationState {
    case unknown
    case denied
    // The associated value is the array of assets in the user's library
    case permitted([PHAsset])
}
