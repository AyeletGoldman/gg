// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The router for the template selection scene
public protocol TemplateSelectionRouter {

    /// Presents the language selection scene
    /// - Parameters:
    ///   - languages: Languages available for the templates
    ///   - selectedLanguageId: Id of current selected language, might be nil
    ///   - onSelectLanguage: Closure invoked when a language is selected
    func presentLanguageSelection(languages: [TemplateLanguage],
                                  selectedLanguageId: TemplateLanguage.ID?,
                                  onSelectLanguage: @escaping (TemplateLanguage.ID) -> Void)

    // swiftlint:disable function_parameter_count
    /// Present the outreach message form scene
    /// - Parameters:
    ///   - outreachType: The type of the outreach
    ///   - assetURLs: The assets to share
    ///   - clientId: The id of the client for the outreach
    ///   - recipient: The recipient for the outreach
    ///   - template: The template selected
    ///   - validator: A validator for the message that will be written, might be nil
    ///   - onDone: Closure invoked when the outreach will finish
    func presentOutreachMessageForm(outreachType: OutreachType,
                                    assetURLs: [URL],
                                    clientId: String,
                                    recipient: String?,
                                    template: Template?,
                                    validator: OutreachValidator?,
                                    onDone: @escaping OutreachResultClosure)
    // swiftlint:enable function_parameter_count
}

final class DefaultTemplateSelectionRouter: Router<TemplateSelectionViewController>, TemplateSelectionRouter {
    func presentLanguageSelection(languages: [TemplateLanguage],
                                  selectedLanguageId: TemplateLanguage.ID?,
                                  onSelectLanguage: @escaping (TemplateLanguage.ID) -> Void) {
        let scene = self.factory.retrieveScene(with: LanguageSelectionRouteDescriptor(
            languages: languages,
            selectedLanguageId: selectedLanguageId,
            onSelectLanguage: onSelectLanguage
        ))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }

    // swiftlint:disable:next function_parameter_count
    func presentOutreachMessageForm(outreachType: OutreachType,
                                    assetURLs: [URL],
                                    clientId: String,
                                    recipient: String?,
                                    template: Template?,
                                    validator: OutreachValidator?,
                                    onDone: @escaping OutreachResultClosure) {
        let scene = self.factory.retrieveScene(with: OutreachMessageFormRouteDescriptor(
            outreachType: outreachType,
            assetURLs: assetURLs,
            clientId: clientId,
            recipient: recipient,
            template: template,
            validator: validator,
            onDone: onDone
        ))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }
}
