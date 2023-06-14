// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// Provides a placeholder image source with an image that doesn't exist. This is used to show the background of the image view while we fetch the real image.
extension ImageSource {
    static let loadingPlaceholder: ImageSource = ImageSource.disk(name: "_NOT_FOUND_IMAGE_", bundle: .maisonKit)
}
