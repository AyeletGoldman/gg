// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import UIKit
import Kingfisher

struct ClosureImageError: Error {
    let reason: String
}

struct ClosureImage: View {

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

#if DEBUG
struct ClosureImage_Previews: PreviewProvider {
    static var previews: some View {
        ClosureImage(closure: { onDone in
            let image = UIImage(systemName: "star")
            onDone(image)
        }, cacheKey: "preview")
        .frame(width: 50, height: 50)
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
