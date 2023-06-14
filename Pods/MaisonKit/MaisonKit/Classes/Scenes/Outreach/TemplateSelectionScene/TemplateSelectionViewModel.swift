// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

/// The display data for template selection.
struct TemplateSelectionData: Equatable {
    /// The available templates. This will change depending on the selected language.
    let availableTemplates: [Template]
    /// The available languages. These don't change once we've retrieved them from the network.
    let availableLanguages: [TemplateLanguage]
    /// The selected language to filter templates by.
    let selectedLanguage: TemplateLanguage
}

/// A view-model to handle the retrieval and display of templates.
final class TemplateSelectionViewModel: ObservableObject {

    /// A subject that holds the template data that was retrieved from the data source. Defaults to `nil`.
    private let originalTemplateData = CurrentValueSubject<TemplateSelectionData?, Never>(nil)
    /// A store for subscriptions
    private var cancellables = Set<AnyCancellable>()
    /// The flow item that this view model represents.
    private let outreachFlowItem: OutreachFlowItem
    /// The assets that will be shared
    private let assetURLs: [URL]
    /// A function to perform to get the templates to show
    private let getTemplates: GetTemplatesMethod
    /// A function to perform when the outreach will finish
    let onDone: OutreachResultClosure
    /// The router for this viewmodel.
    private let router: TemplateSelectionRouter

    /// Holds the currently selected language ID. This is used to filter templates.
    @Published var selectedLanguageId: TemplateLanguage.ID = TemplateLanguage.allLanguages.code
    /// Holds the currently selected template ID. This is used to show the correct text in the next screen.
    @Published var selectedTemplateId: Template.ID? = Template.blankTemplate.id
    /// Holds the current representation of the UI.
    @Published private(set) var templateData: ResultState<TemplateSelectionData, ErrorDisplayable> = .waiting

    /// Creates a new `TemplateSelectionViewMode` with the given `OutreachFlowItem`.
    /// - Parameter outreachFlowItem: The flow item that this view model represents.
    /// - Parameter assetURLs: The assets to share
    /// - Parameter getTemplates: A function to perform to get the templates to show
    /// - Parameter onDone: A function to perform when the outreach will finish
    /// - Parameter router: The router for this viewmodel.
    init(outreachFlowItem: OutreachFlowItem,
         assetURLs: [URL],
         getTemplates: @escaping GetTemplatesMethod,
         onDone: @escaping OutreachResultClosure,
         router: TemplateSelectionRouter) {
        self.outreachFlowItem = outreachFlowItem
        self.assetURLs = assetURLs
        self.getTemplates = getTemplates
        self.onDone = onDone
        self.router = router
        self.setupSelectedLanguageSubscription()
    }

    private func setupSelectedLanguageSubscription() {
        // Get a stream of the datasource's template data, but only if it was not `nil`.
        let originalData = self.originalTemplateData.compactMap { $0 }

        // When the selected language changes, we want to update the list of available templates
        self.$selectedLanguageId
            .combineLatest(originalData) // combine with the original non-nil source
            .map { selectedLanguageId, originalData in
                // If we selected all languages, no filtering just return the original server data
                if selectedLanguageId == TemplateLanguage.allLanguages.code {
                    return originalData
                }
                // Get the templates based on the language we have chosen and the available supported template types
                let availableTemplates = originalData.availableTemplates.filter {
                    $0.languageCode == selectedLanguageId || $0.skipsFiltering
                }
                // Get the selected language based on the ID
                let selectedLanguage = originalData.availableLanguages.first { $0.code == selectedLanguageId }
                return TemplateSelectionData(availableTemplates: availableTemplates,
                                             availableLanguages: originalData.availableLanguages,
                                             selectedLanguage: selectedLanguage ?? .allLanguages)
            }
            .handleEvents(receiveOutput: { [weak self] templateSelectionData in
                // If the newly-filtered templates don't have the selected template
                // available, return the selection to the default
                let containsSelectedTemplate = templateSelectionData.availableTemplates
                    .contains(where: {
                        $0.id == self?.selectedTemplateId
                    })
                if !containsSelectedTemplate {
                    self?.selectedTemplateId = Template.blankTemplate.id
                }
            })
            .map { .found($0) }
            .weakAssign(to: \.templateData, on: self)
            .store(in: &self.cancellables)
    }

    /// Fetches all templates and languages available, and updates the published variables to the fetched values
    func fetchTemplatesAndLanguages() {
        guard case .waiting = self.templateData else {
            return
        }
        self.getTemplates()
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.templateData = .loading(nil)
            })
            .catch { error in
                return Just(.failure(ErrorDisplayable(error)))
            }
            .sink(receiveValue: { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.templateData = .failed(error)
                case .success(let displayable):
                    let contentTypes = self?.outreachFlowItem.type.supportedContentTypes ?? []
                    let templates = displayable.templates.filter {
                        contentTypes.contains($0.contentType) || $0.skipsFiltering
                    }
                    self?.originalTemplateData.send(TemplateSelectionData(
                        availableTemplates: templates,
                        availableLanguages: displayable.languages,
                        selectedLanguage: .allLanguages
                    ))
                }
            }).store(in: &self.cancellables)
    }

    func didTapLanguages() {
        self.router.presentLanguageSelection(languages: self.templateData.value?.availableLanguages ?? [],
                                             selectedLanguageId: self.selectedLanguageId,
                                             onSelectLanguage: { [weak self] languageId in
                                                self?.selectedLanguageId = languageId
                                             })
    }

    func didTapNext() {
        let selectedTemplate = self.originalTemplateData.value?
            .availableTemplates
            .first { $0.id == self.selectedTemplateId }
        self.router.presentOutreachMessageForm(outreachType: self.outreachFlowItem.type,
                                               assetURLs: self.assetURLs,
                                               clientId: self.outreachFlowItem.clientID,
                                               recipient: self.outreachFlowItem.recipient,
                                               template: selectedTemplate,
                                               validator: OutreachValidator(),
                                               onDone: self.onDone)
    }
}

extension TemplateSelectionViewModel {

    // Return `AuxiliaryViewModel` for empty templates
    func getEmptyTemplatesViewModel() -> AuxiliaryViewModel {
        return AuxiliaryViewModel.emptyDataModel(
            title: Labels.emptyTitle,
            subtitle: Labels.emptySubtitle
        )
    }
}

private extension TemplateSelectionViewModel {
    enum Labels {
        static let emptyTitle = MKLocalizedString("template-selection.empty.title",
                                                  comment: "Empty view title when there are no templates")
        static let emptySubtitle = MKLocalizedString("template-selection.empty.subtitle",
                                                     comment: "Empty view subtitle when there are no templates")
    }
}
