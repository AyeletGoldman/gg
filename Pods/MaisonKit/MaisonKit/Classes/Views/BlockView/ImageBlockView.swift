// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

/// A view that displays a centered image over text, with a small spacing between them.
struct ImageBlockView: View {

    private enum Constants {
        static let imageSize = CGSize(width: 18, height: 18)
    }

    let image: ImageSource
    let subtitle: String?

    var body: some View {
        BlockView(titleView: {
            MaisonKitImage(source: self.image)
                .frame(width: Constants.imageSize.width, height: Constants.imageSize.height)
        }, subtitle: subtitle)
    }
}

struct ImageBlockView_Previews: PreviewProvider {
    static var previews: some View {
        ImageBlockView(image: .system(name: "star"),
                       subtitle: "Test")
    }
}
