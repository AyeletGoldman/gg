// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// A combination of the language code and the language name.
public struct TemplateLanguage: Identifiable, Hashable, Equatable {

    private enum Labels {
        static let allLanguagesName = MKLocalizedString("outreach.templates.languages.all-languages.title",
                                                        comment: "Title for the 'All languages' language to be displayed in the template selection")
    }

    /// The language code is the identifier
    public var id: String {
        return self.code
    }

    /// The language code, in ISO-639-1
    public let code: String
    /// The language name
    public let name: String

    private static let allLanguagesCode = "__ALL_LANGUAGES__"
    /// A constant to define a template language that should include all available languages.
    public static let allLanguages = TemplateLanguage(
        code: TemplateLanguage.allLanguagesCode,
        name: Labels.allLanguagesName
    )

    /// Creates an instance of `TemplateLanguage`
    /// - Parameters:
    ///   - code: The language code, in ISO-639-1
    ///   - name: The language name
    public init(code: String, name: String) {
        self.code = code
        self.name = name
    }
}
