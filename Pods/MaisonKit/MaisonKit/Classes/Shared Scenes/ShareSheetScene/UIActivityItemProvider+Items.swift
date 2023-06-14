// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension UIActivityItemProvider {

    /// A `UIActivityItemProvider` that wraps a `String` value
    /// - Parameter string: the string to wrap in an `UIActivityItemProvider`
    /// - Returns: a fully initialized provider that will return a `String` when used in an `UIActivityViewController`
    static func string(_ string: String) -> UIActivityItemProvider {
        return SynchronousValueProvider(value: string)
    }

    /// A `UIActivityItemProvider` that wraps a `URL` value
    /// - Parameter url: the URL to wrap in an `UIActivityItemProvider`
    /// - Returns: a fully initialized provider that will return a `URL` when used in an `UIActivityViewController`
    static func url(_ url: URL) -> UIActivityItemProvider {
        return SynchronousValueProvider(value: url)
    }

    /// A `UIActivityItemProvider` that wraps a `UIImage` value
    /// - Parameter image: the image to wrap in an `UIActivityItemProvider`
    /// - Returns: a fully initialized provider that will return a `UIImage` when used in an `UIActivityViewController`
    static func image(_ image: UIImage) -> UIActivityItemProvider {
        return SynchronousValueProvider(value: image)
    }

    /// A `UIActivityItemProvider` that wraps a `UIImage` value loaded from a URL
    /// - Parameter url: the URL to use to download the image from
    /// - Returns: a fully initialized provider that will return a `UIImage` after being downloaded when used in an `UIActivityViewController`
    static func image(fromURL url: URL) -> UIActivityItemProvider {
        return ImageURLValueProvider(url: url)
    }
}
