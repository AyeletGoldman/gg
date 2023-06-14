// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension ErrorDisplayable {

    private enum Labels {
        static let dataErrorTitle = MKLocalizedString("errors.data.title", comment: "Title of an unspecified error from the server.")
        static let dataErrorDescription = MKLocalizedString("errors.data.description", comment: "Description of an unspecified error from the server.")
        static let connectionErrorTitle = MKLocalizedString("errors.connection.title", comment: "Title of an error due to connection fail")
        static let connectionErrorDescription = MKLocalizedString("errors.connection.description", comment: "Description of an error due to connection fail")
        static let emptyResultTitle = MKLocalizedString("errors.empty-results.title", comment: "Title of an error when results are empty")
        static let emptyResultDescription = MKLocalizedString("errors.empty-results.description", comment: "Description of an error when results are empty")
    }

    /// Common images available for instances of `ErrorDisplayable`
    enum Images {
        static let dataError: ImageSource = .styledImage(identifier: "icon-lrg-fail-data")
        static let connectionError: ImageSource = .styledImage(identifier: "icon-lrg-fail-connection")
        static let emptyResult: ImageSource = .styledImage(identifier: "icon-lrg-fail-results")
    }

    /// `ErrorDisplayable` instance of an unspecified error coming from the server
    static let dataError = ErrorDisplayable(localizedDescription: Labels.dataErrorDescription,
                                            localizedTitle: Labels.dataErrorTitle,
                                            image: Images.dataError)

    /// `ErrorDisplayable` instance of an error a connection failure
    static let connectionError = ErrorDisplayable(localizedDescription: Labels.connectionErrorDescription,
                                                  localizedTitle: Labels.connectionErrorTitle,
                                                  image: Images.connectionError)

    /// `ErrorDisplayable` instance of an error from empty results
    static let emptyResult = ErrorDisplayable(localizedDescription: Labels.emptyResultDescription,
                                              localizedTitle: Labels.emptyResultTitle,
                                              image: Images.emptyResult)
}
