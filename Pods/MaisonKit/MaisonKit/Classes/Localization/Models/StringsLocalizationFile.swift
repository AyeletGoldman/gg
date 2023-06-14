// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The values we're expecting from the API for localized content
/// Represents values we will turn into a .strings file to store for use with translations.
public struct StringsLocalizationFile {
    /// The language code to store these localizations under. ISO 639-1 or a combination in the form of  `${ISO-639-1}_${ISO-3166}`
    public let languageCode: LocalizationLanguage
    /// A dictionary of localization key-value to construct a`.strings` file content's from.
    public let localizationValues: [LocalizationKey: LocalizationValue]

    /// Creates a new `StringsLocalizationFile`
    /// - Parameter languageCode: The language code to store these localizations under. ISO 639-1 or a combination in the form of  `${ISO-639-1}_${ISO-3166}`
    /// - Parameter localizationValues: The key-value pairs that represent localizations.
    public init(languageCode: LocalizationLanguage, localizationValues: [LocalizationKey: LocalizationValue]) {
        self.languageCode = languageCode
        self.localizationValues = localizationValues
    }
}
