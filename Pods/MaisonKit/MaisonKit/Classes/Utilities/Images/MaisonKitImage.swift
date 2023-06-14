// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A view to display images created from an `ImageSource`.
public struct MaisonKitImage: View {

    private let source: ImageSource

    /// Creates a new `MaisonKitImage` from the given `source`.
    /// - Parameter source: the source of the image
    public init(source: ImageSource) {
        self.source = source
    }

    public var body: some View {
        self.getImage()
    }

    @ViewBuilder
    private func getImage() -> some View {
        switch self.source {
        case .disk(let name, let bundle):
            Image(name, bundle: bundle).resizable()
        case .system(let name):
            Image(systemName: name).resizable()
        case .url(let url):
            RemoteImage(url: url)
        case .styledImage(let identifier):
            StylableImage(identifier)
                .resizable()
        case .closure(let closure, let cacheKey):
            ClosureImageView(closure: closure, cacheKey: cacheKey)
        }
    }
}
