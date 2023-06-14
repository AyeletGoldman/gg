// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine

/// The localization adapter that users of MaisonKit conform to so they can provide localization files for use in translated content.
public protocol LocalizationAdapter {
    /// Asks the adapter to fetch the latest localization files
    /// - Returns: a publisher that will either return the newest localization files or an error displayable.
    func fetchLocalization() -> AnyPublisher<[LocalizationFiles], ErrorDisplayable>
}
