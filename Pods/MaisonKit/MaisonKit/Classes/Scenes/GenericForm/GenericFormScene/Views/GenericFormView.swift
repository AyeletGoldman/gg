// Copyright © 2021 LVMH. All rights reserved.
import SwiftUI
import Combine

/// The view to show generic form fields and data
public struct GenericFormView<Object>: View {

    @ObservedObject private var viewModel: GenericFormViewModel<Object>

    /// Creates a new GenericFormView
    /// - Parameters:
    ///   - viewModel: The generic form view model to handle the view data
    public init(viewModel: GenericFormViewModel<Object>) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ResultStateViewBuilder(result: self.viewModel.sections)
            .setLoadingView { sections in
                if let sections = sections {
                    self.buildContent(self.buildSections(sections))
                } else {
                    self.buildContent(self.buildLoadingFields())
                }
            }
            .buildContent { self.buildContent(self.buildSections($0)) }
            .alert(alertContext: self.$viewModel.alertContext)
            .style("background")
            .resignKeyboardOnDragGesture()
            .onAppear(perform: self.viewModel.onAppear)
    }

    @ViewBuilder
    private func buildContent<V: View>(_ content: V) -> some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    content
                }
                .disabled(self.viewModel.isSaving)
                .padding(.top, 15)
                .environment(\.scrollViewProxy, proxy)
            }
        }
    }

    @ViewBuilder
    private func buildSections(_ sections: [FormSection<Object>]) -> some View {
        ForEach(Array(0..<sections.count), id: \.self) { index in
            if let title = sections[index].title {
                FormSectionHeaderView(title: title)
                    .addStyledRowDivider()
                    .padding(.horizontal)
            }
            if sections[index].fields.isEmpty {
                AuxiliaryView(viewModel: AuxiliaryViewModel(displayableError: .emptyResult))
            } else {
                self.buildFields(sections[index].fields)
            }
        }
    }

    @ViewBuilder
    private func buildFields(_ fields: [GFField<Object>]) -> some View {
        ForEach(Array(0..<fields.count), id: \.self) { index in
            fields[index].makeBody(self.$viewModel.data, self.viewModel.isReadOnly, { actionType in
                self.viewModel.handleActionType(action: actionType)
            })
        }
    }
}

private extension GenericFormView {
    @ViewBuilder
    func buildLoadingFields() -> some View {
        ForEach(0..<6) { _ in
            GFTextFieldView(value: .constant("Loading value"), config: GFFieldConfiguration(title: "Title", isReadOnly: true))
        }
    }
}
