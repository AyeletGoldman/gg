// Copyright © 2021 LVMH. All rights reserved.

import Foundation

final class LanguageSelectionViewModel: ObservableObject {

    let languages: [TemplateLanguage]
    @Published var selectedLanguageId: TemplateLanguage.ID? {
        didSet {
            if let languageId = self.selectedLanguageId {
                self.onSelectLanguage(languageId)
            }
        }
    }
    private let onSelectLanguage: (TemplateLanguage.ID) -> Void

    init(languages: [TemplateLanguage],
         selectedLanguageId: TemplateLanguage.ID?,
         onSelectLanguage: @escaping (TemplateLanguage.ID) -> Void) {
        self.languages = languages
        self.selectedLanguageId = selectedLanguageId
        self.onSelectLanguage = onSelectLanguage
    }
}
