// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A representation of a localization file that supports plurals
public struct StringsDictLocalizationFile {
    /// The language code to store these localizations under. ISO 639-1 or a combination in the form of  `${ISO-639-1}_${ISO-3166}`
    public let languageCode: String
    /// An array of localization entries to construct a `.stringsdict` file content's from.
    public let localizationValues: [LocalizationEntry]

    /// Creates a new `StringsDictLocalizationFile`
    /// - Parameter languageCode: The language code to store these localizations under. ISO 639-1 or a combination in the form of  `${ISO-639-1}_${ISO-3166}`
    /// - Parameter localizationValues: an array of localization entries to construct a `.stringsdict` file content's from.
    public init(languageCode: String, localizationValues: [LocalizationEntry]) {
        self.languageCode = languageCode
        self.localizationValues = localizationValues
    }
}
