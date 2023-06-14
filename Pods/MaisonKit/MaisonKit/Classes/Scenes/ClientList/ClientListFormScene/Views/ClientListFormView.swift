// Copyright © 2020 LVMH. All rights reserved.

import Combine
import SwiftUI
import StylableSwiftUI

/// Client creation form view.
struct ClientListFormView: View {

    private enum Labels {
        static let listNameFieldTitle = MKLocalizedString("list.form-field.list-name.title", comment: "Title for the name field in the form")
        static let selectedClientsFieldTitle = MKLocalizedString("list.form-field.selected-clients.title", comment: "Title for the selected clients field in the form")
        static let selectedClientsValue = MKLocalizedString("list.form-field.selected-clients.number-of-clients",
                                                            comment: "Text to show the number of selected clients in singular")
        static let emptyClientsValue = MKLocalizedString("list.form-field.selected-clients.no-clients-selected", comment: "Text to show when there are no clients selected")
        static let listNamePlaceholder = MKLocalizedString("list.form-field.list-name.placeholder", comment: "Placeholder for title for creating a new list")
        static let alertDeleteButtonTitle = MKLocalizedString("list.edit.button.delete", comment: "Title of the delete list button")
    }

    @ObservedObject private var viewModel: ClientListFormViewModel

    private var disposeBag = Set<AnyCancellable>()

    /// Creates a new ClientListFormView
    /// - Parameter clientListFormViewModel: view model to handle creation of the client list
    init(clientListFormViewModel: ClientListFormViewModel) {
        self.viewModel = clientListFormViewModel
    }

    var body: some View {
        self.buildForm()
            .alert(alertContext: self.$viewModel.alertContext)
            .style("background")
            .edgesIgnoringSafeArea(.bottom)
            .resignKeyboardOnTapGesture()
    }

    @ViewBuilder
    private func buildForm() -> some View {
        VStack(spacing: 0) {
            self.buildNameField()
            ResultStateViewBuilder(result: self.viewModel.state)
                .setLoadingView {
                    self.buildClientsFormFieldView(title: "Loading...")
                }.buildContent { selectedClients in
                    self.buildClientsField(selectedClients: selectedClients)
                }
            Spacer()
            if self.viewModel.listId != nil {
                self.buildDeleteButton()
                    .keyboardAdaptive()
            }
        }
    }

    @ViewBuilder
    private func buildNameField() -> some View {
        FormFieldView(subtitle: Labels.listNameFieldTitle, isRequired: true) {
            TextField(self.$viewModel.listName)
                .placeHolder(Text(Labels.listNamePlaceholder),
                             shouldShow: self.viewModel.listName.isEmpty)
                .frame(height: 22)
        }
        .styleInputContent()
        .styleAsInputRow(isBlurred: self.viewModel.listName.isEmpty, includeDivider: true)
    }

    @ViewBuilder
    private func buildClientsField(selectedClients: Set<String>) -> some View {
        Button(action: self.viewModel.presentSearch, label: {
            self.buildClientsFormFieldView(title: self.getClientsValueText(selectedClients: selectedClients))
        })
        .styleAsInputRow(isBlurred: selectedClients.isEmpty, includeDivider: true)
    }

    @ViewBuilder
    private func buildClientsFormFieldView(title: String) -> some View {
        FormFieldView(subtitle: Labels.selectedClientsFieldTitle) {
            HStack(alignment: .center) {
                Text(verbatim: title)
                    .accessibility(identifier: "add-client")
                Spacer()
                MaisonKitImage(source: .styledImage(identifier: "icon-right"))
                    .frame(width: 20, height: 20)
            }
        }.styleInputContent()

    }

    private func getClientsValueText(selectedClients: Set<String>) -> String {
        if selectedClients.isEmpty {
            return Labels.emptyClientsValue
        }
        return String(format: Labels.selectedClientsValue, selectedClients.count)
    }

    @ViewBuilder
    private func buildDeleteButton() -> some View {
        AlertButton(buttonData: ButtonData(label: Labels.alertDeleteButtonTitle,
                                           action: self.viewModel.deleteClientListConfirmPopup))
        .padding(.horizontal)
        .padding(.vertical, 20)
    }
}
