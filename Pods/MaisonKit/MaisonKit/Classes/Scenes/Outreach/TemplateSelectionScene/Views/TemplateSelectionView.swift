// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view that allows a user to select a template from a list of templates and filter that list from a list of languages.
struct TemplateSelectionView: View {

    private enum Labels {
        static let templateHeadingTitle = MKLocalizedString("outreach.template-selection.templates.heading.title",
                                                            comment: "The heading to show above the template selection UI in singular")
        static let languagesFormTitle = MKLocalizedString("outreach.template-selection.languages.form.title",
                                                          comment: "The title for the form field in language selection")
    }

    /// This view's view model
    @StateObject private var viewModel: TemplateSelectionViewModel

    /// Iinitializes a new `TemplateSelectionView` with the given view model and navigation bar button closure.
    /// - Parameter viewModel: The view model used to retrieve the data for this view and handle user interactions.
    init(viewModel: TemplateSelectionViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        self.buildView()
            .environment(\.editMode, .constant(.active))
            .edgesIgnoringSafeArea(.bottom)
    }

    @ViewBuilder
    private func buildView() -> some View {
        ResultStateViewBuilder(result: self.viewModel.templateData)
            .setLoadingView {
                SelectionListView(
                    items: TemplateSelectionData.loadingData.availableTemplates,
                    selection: .constant([]),
                    rowStylistIdentifier: "input[radio-box-stacked]",
                    headerContent: {
                        self.buildHeader(with: TemplateSelectionData.loadingData)
                    }, rowContent: { template in
                        self.buildRowContent(with: template)
                    }
                )
            }.buildContent { data in
                SelectionListView(
                    items: data.availableTemplates,
                    selection: self.$viewModel.selectedTemplateId,
                    rowStylistIdentifier: "input[radio-box-stacked]",
                    emptyViewModel: self.viewModel.getEmptyTemplatesViewModel(),
                    headerContent: {
                        self.buildHeader(with: data)
                    }, rowContent: { template in
                        self.buildRowContent(with: template)
                    }
                )
            }
    }

    /// Builds each of the content cells for the template selection list
    /// - Parameter template: the template for the row
    /// - Returns: a view representing the row's content, this will usually be the template name and a small excerpt of the text in the template
    @ViewBuilder
    private func buildRowContent(with template: Template) -> some View {
        ListItemView(title: template.name, subtitle: template.preview)
            // The selection list is in edit mode, but the contents of the list item view are not
            .environment(\.editMode, .constant(.inactive))
    }

    /// Builds the header for the view. The header has the language selection input and a title with the number
    /// of templates available.
    /// - Parameter data: the template selection data to build the language selection with
    /// - Returns: the view that will hold the language selection input and the section header for selecting a template
    @ViewBuilder
    private func buildHeader(with data: TemplateSelectionData) -> some View {
        Group {
            self.buildLanguageSelectionInput(with: data)
                .padding(.vertical, 20)
            SectionHeaderView(title: String(format: Labels.templateHeadingTitle, data.availableTemplates.count))
                .addStyledRowDivider()
                .padding(.horizontal)
            // The header is not in edit mode
        }.environment(\.editMode, .constant(.inactive))
    }

    /// Builds the language selection input
    /// - Parameter data: the template selection data to build the language selection with
    /// - Returns: a view that will allow the selection of languages
    @ViewBuilder
    private func buildLanguageSelectionInput(with data: TemplateSelectionData) -> some View {
        Button(action: self.viewModel.didTapLanguages) {
            FormFieldView(subtitle: Labels.languagesFormTitle) {
                HStack {
                    Text(verbatim: data.selectedLanguage.name)
                        .style("title")
                    Spacer()
                    MaisonKitImage(source: .styledImage(identifier: "icon-right"))
                        .frame(width: 20, height: 20)
                }.contentShape(Rectangle()) // To allow the whole row to be tapped
            }
            .styleInputContent()
        }
        .styleAsInputRow(includeDivider: true)
        .buttonStyle(.plain)// To enable tapping when in a list
    }
}

private extension TemplateSelectionData {
    static var loadingData: TemplateSelectionData {
        return TemplateSelectionData(availableTemplates: [
            Template(id: UUID().uuidString,
                     name: "Example 1",
                     languageCode: "en",
                     content: "Some content here can be quite long",
                     contentType: .text),
            Template(id: UUID().uuidString,
                     name: "Example 1",
                     languageCode: "en",
                     content: "Some content here can be quite long",
                     contentType: .text),
            Template(id: UUID().uuidString,
                     name: "Example 1",
                     languageCode: "en",
                     content: "Some content here can be quite long",
                     contentType: .text),
            Template(id: UUID().uuidString,
                     name: "Example 1",
                     languageCode: "en",
                     content: "Some content here can be quite long",
                     contentType: .text),
            Template(id: UUID().uuidString,
                     name: "Example 1",
                     languageCode: "en",
                     content: "Some content here can be quite long",
                     contentType: .text)
        ],
        availableLanguages: [
            TemplateLanguage(code: "en", name: "English"),
            TemplateLanguage(code: "fr", name: "French")
        ],
        selectedLanguage: TemplateLanguage(code: "en", name: "English"))
    }
}
