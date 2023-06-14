// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import UIKit
import Kingfisher

struct ClosureImageError: Error {
    let reason: String
}

struct ClosureImageView: View {

    let closure: (@escaping (UIImage?) -> Void) -> Void
    let cacheKey: String

    var body: some View {
        KFImage.dataProvider(ClosureBasedImageProvider(cacheKey: self.cacheKey,
                                                       closure: self.closure))
        .resizable()
    }
}

struct ClosureBasedImageProvider: ImageDataProvider {

    let cacheKey: String
    let closure: (@escaping (UIImage?) -> Void) -> Void

    func data(handler: @escaping (Result<Data, Error>) -> Void) {
        self.closure { image in
            guard let image = image, let data = image.pngData() else {
                handler(.failure(ClosureImageError(reason: "Unable to fetch image from library")))
                return
            }
            handler(.success(data))
        }
    }
}
