// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the product catalog filter.
public struct LanguageSelectionRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "LanguageSelectionRouteDescriptor"

    /// Languages available for the templates
    public let languages: [TemplateLanguage]

    /// Id of current selected language, might be nil
    public let selectedLanguageId: TemplateLanguage.ID?

    /// Closure invoked when a language is selected
    public let onSelectLanguage: (TemplateLanguage.ID) -> Void

    /// Creates an instance of `LanguageSelectionRouteDescriptor`
    /// - Parameters:
    ///   - languages: Languages available for the templates
    ///   - selectedLanguageId: Id of current selected language, might be nil
    ///   - onSelectLanguage: Closure invoked when a language is selected
    public init(languages: [TemplateLanguage],
                selectedLanguageId: TemplateLanguage.ID?,
                onSelectLanguage: @escaping (TemplateLanguage.ID) -> Void) {
        self.languages = languages
        self.selectedLanguageId = selectedLanguageId
        self.onSelectLanguage = onSelectLanguage
    }
}
