// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

/// Describes the source of an image. Supported sources are:
/// - A disk image, distributed as an asset with the library or app
/// - A system image, usually from SFSymbols
///   https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/
/// - An image downloaded from a URL.
/// - An image from the app identified by a `StylistIdentifier`
/// - An image loaded asynchonously into memory
public enum ImageSource {
    /// - A disk image, distributed as an asset with the library or app
    case disk(name: String, bundle: Bundle? = nil)
    /// - A system image, usually from SFSymbols
    case system(name: String)
    /// - An image downloaded from a URL.
    case url(URL)
    /// - An image from the app identified by a `StylistIdentifier`
    case styledImage(identifier: StylistIdentifier)
    /// - An image loaded asynchonously into memory
    case closure((@escaping (UIImage?) -> Void) -> Void, String)
}
