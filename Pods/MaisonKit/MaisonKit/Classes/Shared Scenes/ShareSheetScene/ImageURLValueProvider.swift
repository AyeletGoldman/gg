// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import UIKit

final class ImageURLValueProvider: UIActivityItemProvider {
    let url: URL

    init(url: URL) {
        self.url = url
        super.init(placeholderItem: UIImage())
    }

    override var item: Any {
        guard let data = try? Data(contentsOf: self.url) else { return UIImage() }
        guard let image = UIImage(data: data) else { return UIImage() }
        return image
    }
}
