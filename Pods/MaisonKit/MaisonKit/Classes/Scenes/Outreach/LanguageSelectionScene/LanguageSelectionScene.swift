// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct LanguageSelectionScene: Scene {

    private let languages: [TemplateLanguage]
    private let selectedLanguageId: TemplateLanguage.ID?
    private let onSelectLanguage: (TemplateLanguage.ID) -> Void

    init(languages: [TemplateLanguage],
         selectedLanguageId: TemplateLanguage.ID?,
         onSelectLanguage: @escaping (TemplateLanguage.ID) -> Void) {
        self.languages = languages
        self.selectedLanguageId = selectedLanguageId
        self.onSelectLanguage = onSelectLanguage
    }

    func createViewController() -> LanguageSelectionViewController {
        return LanguageSelectionViewController()
    }

    func configure(controller: LanguageSelectionViewController,
                   using factory: SceneFactory) {
        let viewModel = LanguageSelectionViewModel(languages: self.languages,
                                                   selectedLanguageId: self.selectedLanguageId,
                                                   onSelectLanguage: self.onSelectLanguage)
        controller.viewModel = viewModel
    }
}
