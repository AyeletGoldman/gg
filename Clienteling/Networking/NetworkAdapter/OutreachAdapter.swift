// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import MaisonKit
import Combine
import Moya

extension NetworkAdapter: OutreachAdapter {

    func getClientOutreachChannels(clientID: String) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error> {
        return self.getClientOutreachChannels(clientId: clientID, channelTypes: [.text, .voice])
    }

    func createInteraction(interaction: OutreachInteractionCreation) -> VoidResultPublisher {
        return self.createInteraction(interaction: interaction, context: .client360)
    }

    func getTemplates(clientId: String) -> AnyPublisher<Result<TemplatesDisplayable, ErrorDisplayable>, Error> {
        let templatesPublisher = self.networking.templatesControllerFindAll(category: .outreach)
            .unwrapDefaultSuccessResponse()
        let clientPlaceholderFieldsPublisher = self.getClientPlaceholderFieldsPublisher(clientId: clientId)

        return Publishers.Zip(templatesPublisher, clientPlaceholderFieldsPublisher)
            .map { (templatesResponse, clientPlaceholderFields) -> TemplatesDisplayable in
                let placeholderFields = clientPlaceholderFields + self.getUserPlaceholderFields()
                return TemplatesDisplayable(templatesResponse.data.result, placeholders: placeholderFields)
            }
            .mapToResultViewModel { $0 }
    }
    
    func getClientPlaceholderFieldsPublisher(clientId: String) -> AnyPublisher<[TemplatePlaceholder], Error> {
        return self.networking.clientsControllerFindDetailsOne(clientId: clientId)
            .unwrapDefaultSuccessResponse()
            .map { details in
                let clientFields = details.data.result.clientDetails.map { $0.items }.reduce( [], +)
                return clientFields.map {
                    TemplatePlaceholder.replace(placeholder: "{@Client.\($0.apiName)}",
                                                replaceWith: MaisonKit.TypedValue(from: $0).toString())
                }
            }
            .eraseToAnyPublisher()
    }

    func getUserPlaceholderFields() -> [TemplatePlaceholder] {
        guard let user = MaisonKitUser.currentLoggedInUser else {
            return []
        }
        var placeholders = user.displayFields?.map {
            TemplatePlaceholder.replace(placeholder: "{@User.\($0.id)}", replaceWith: $0.value.toString())
        } ?? []
        if let userStore = user.store {
            placeholders += [
                TemplatePlaceholder.replace(placeholder: "{@Store.Name}", replaceWith: userStore.name)
            ]
        }

        return placeholders
    }
}

extension ClientOutreachChannel.ClientOutreachChannelSupportedTemplateTypes {
    var asTemplateContentType: Template.ContentType {
        switch self {
        case .html:
            return .html
        case .text:
            return .text
        }
    }
}

extension TemplatesDisplayable {
    init(_ templateResponse: OutreachTemplates, placeholders: [TemplatePlaceholder] = [], localTemplates: [Template] = []) {
        var templates = templateResponse.templates.map {
            Template(
                id: $0.id,
                name: $0.name,
                languageCode: $0.languageCode,
                subject: $0.subject,
                preview: $0.preview,
                content: $0.content,
                contentType: Template.ContentType(type: $0.type)
            )
        }
        templates = localTemplates + templates
        templates.insert(.blankTemplate, at: 0)
        var languages = templateResponse.languages.map {
            TemplateLanguage(code: $0.code, name: $0.displayName)
        }
        languages.insert(.allLanguages, at: 0)
        self.init(templates: templates, languages: languages, placeholders: placeholders)
    }
}

extension Template.ContentType {
    init(type: OutreachTemplatesContent.OutreachTemplatesContentType) {
        switch type {
        case .html:
            self = .html
        case .text:
            self = .text
        }
    }
}
