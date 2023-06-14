// Copyright © 2021 LVMH. All rights reserved.

import StylableSwiftUI

/// Displayable that holds multiple informations related to an Error in order to be displayed
public struct ErrorDisplayable: LocalizedError {

    /// Holds a description for the error, differs from Error.localizedDescription, will be used first
    public let localizedDescription: String

    /// Holds a title for the error
    public let localizedTitle: String?

    /// Holds an image to illustrate the error
    public let image: ImageSource?

    /// Convenience initializer from a common error
    /// - Parameters:
    ///   - localizedDescription: a description for the error, localized in the language for the user interface
    ///   - localizedTitle: a title for the error, localized in the language for the user interface
    ///   - image: an image to illustrate the error
    public init(localizedDescription: String, localizedTitle: String? = nil, image: ImageSource? = nil) {
        self.localizedDescription = localizedDescription
        self.localizedTitle = localizedTitle
        self.image = image
    }

    /// Convenience initializer from a common error
    /// - Parameters:
    ///   - error: a common and unspecified error. If this error is of type `ErrorDisplayable`, then we copy all properties
    public init(_ error: Error) {
        if let displayable = error as? ErrorDisplayable {
            self.init(localizedDescription: displayable.localizedDescription,
                      localizedTitle: displayable.localizedTitle,
                      image: displayable.image)
        } else {
            self.init(localizedDescription: error.localizedDescription)
        }
    }
}
