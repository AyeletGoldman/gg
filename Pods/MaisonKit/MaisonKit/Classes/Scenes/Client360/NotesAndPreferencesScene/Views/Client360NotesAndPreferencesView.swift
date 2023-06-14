// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct Client360NotesAndPreferencesView: View {

    private enum Labels {
        static let notesHeader =  MKLocalizedString("client360.notesAndPreferences.notes.title",
                                                    comment: "The title for the form section header for 'Notes'")
        static let emptyNotesTitle = MKLocalizedString("client360.notesAndPreferences.notes.empty.title",
                                                       comment: "The title for the empty view in notes and preferences section 'Notes'")
        static let emptyNotesBody = MKLocalizedString("client360.notesAndPreferences.notes.empty.subtitle",
                                                      comment: "The subtitle for the empty view in notes and preferences section 'Notes'")

        static let preferencesHeader = MKLocalizedString("client360.notesAndPreferences.preferences.title",
                                                         comment: "The title for the form section header for 'Preferences'")
        static let emptyPreferencesTitle = MKLocalizedString("client360.notesAndPreferences.preferences.empty.title",
                                                             comment: "The title for the empty view in notes and preferences section 'Preferences'")
        static let emptyPreferencesBody = MKLocalizedString("client360.notesAndPreferences.preferences.empty.subtitle",
                                                            comment: "The subtitle for the empty view in notes and preferences section 'Preferences'")
    }

    @ObservedObject var viewModel: Client360NotesAndPreferencesViewModel
    @Environment(\.isModalPresentationStyle) private var isPresentedModally

    init(viewModel: Client360NotesAndPreferencesViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        MKList {
            self.buildContent()
        }
        .style("background")
        .edgesIgnoringSafeArea(.bottom, if: self.isPresentedModally)
    }

    @ViewBuilder private func buildContent() -> some View {
        Group {
            Spacer().frame(height: 20)
            self.buildNotes()
            Spacer().frame(height: 20)
            self.buildPreferences()
            Spacer().frame(height: 40)
        }
        .padding(.horizontal)
        .listRowBackground(Color.clear.style("background"))
    }

    @ViewBuilder
    private func buildNotes() -> some View {
        FormSectionHeaderView(title: Labels.notesHeader)
        ResultStateViewBuilder(result: self.viewModel.notes)
            .setEmptyView {
                AuxiliaryView(viewModel: AuxiliaryViewModel.emptyDataModel(
                    title: Labels.emptyNotesTitle,
                    subtitle: Labels.emptyNotesBody
                ))
            }.setLoadingView {
                ForEach(0..<3) { _ in
                    NoteCellView(item: .loading)
                }
            }.buildContent { notes in
                ForEach(notes.items) { note in
                    NoteCellView(item: note)
                }
            }
    }

    @ViewBuilder
    private func buildPreferences() -> some View {
        FormSectionHeaderView(title: Labels.preferencesHeader)
        ResultStateViewBuilder(result: self.viewModel.preferences)
            .setEmptyView {
                AuxiliaryView(viewModel: AuxiliaryViewModel.emptyDataModel(
                    title: Labels.emptyPreferencesTitle,
                    subtitle: Labels.emptyPreferencesBody
                ))
            }.setLoadingView {
                ForEach(0..<3) { _ in
                    FormTextFieldView(typedField: TypedField(value: .text(lines: ["Some loading data"])), styleType: .compact)
                }
            }.buildContent { preferences in
                ForEach(preferences.items) { preference in
                    FormTextFieldView(typedField: preference, styleType: .compact)
                        .addStyledRowDivider(if: preference.id != preferences.items.last?.id)
                }
            }
    }
}

extension Client360Displayable.Notes: EmptyStateRepresentable {
    public var isEmpty: Bool {
        return self.items.isEmpty
    }
}

extension Client360Displayable.Preferences: EmptyStateRepresentable {
    public var isEmpty: Bool {
        return self.items.isEmpty
    }
}

private extension NoteDisplayable {
    static var loading: NoteDisplayable {
        return NoteDisplayable(id: UUID().uuidString,
                               advisorNameField: TypedField(value: .text(lines: ["Advisor"])),
                               storeNameField: TypedField(value: .text(lines: ["Store name"])),
                               dateField: .datetime(Date(), nil),
                               content: "This is some content")
    }
}
