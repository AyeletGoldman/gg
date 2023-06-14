// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import UIKit

struct AppDetails {

    private enum Constants {
        static let marketingVersionBundleString = "CFBundleShortVersionString"
    }

    static var marketingVersion: String {
        return Bundle.main
            .infoDictionary?[Constants.marketingVersionBundleString] as? String ?? Localization.Strings.notAvailable
    }
}
