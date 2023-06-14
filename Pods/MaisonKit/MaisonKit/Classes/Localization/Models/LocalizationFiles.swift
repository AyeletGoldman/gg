// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The two types of localization files that are available, .strings and .stringsdict
public struct LocalizationFiles {
    /// The language code to store these localizations under. ISO 639-1 or a combination in the form of  `${ISO-639-1}_${ISO-3166}`
    public let languageCode: LocalizationLanguage

    /// A  dictionary for simple translations
    public let singularDict: [LocalizationKey: LocalizationValue]
    /// A `dicionary used for translations that have plurals in them
    public let pluralDict: [LocalizationEntry]

    public init(languageCode: String = "", singularDict: [LocalizationKey: LocalizationValue] = [:], pluralDict: [LocalizationEntry] = []) {
        self.languageCode = languageCode

        self.singularDict = singularDict
        self.pluralDict = pluralDict
    }
}
