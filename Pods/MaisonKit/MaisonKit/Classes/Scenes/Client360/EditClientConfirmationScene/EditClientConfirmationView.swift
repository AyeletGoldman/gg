//  Copyright © 2023 LVMH. All rights reserved.

import SwiftUI

struct EditClientConfirmationView: View {

    private enum Labels {
        static let confirmButtonTitle = MKLocalizedString("clients.edit-client.confirmation.confirm-button.title",
                                                          comment: "The title of the button to confirm changes to a client's record")
        static let confirmButtonSubtitle = MKLocalizedString("clients.edit-client.confirmation.confirm-button.subtitle",
                                                          comment: "The subtitle of the button to confirm changes to a client's record. This explains the action tapping on the button will have.")
    }

    @ObservedObject private var viewModel: EditClientConfirmationViewModel

    init(viewModel: EditClientConfirmationViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GenericFormView(viewModel: self.viewModel)
            .withFloatingActionView {
                VStack(spacing: 20) {
                    PrimaryButton(buttonData: ButtonData(label: Labels.confirmButtonTitle,
                                                         action: self.viewModel.didTapApplyButton),
                                  isLoading: self.viewModel.isSaving)
                    Text(Labels.confirmButtonSubtitle)
                        .style("body")
                        .padding(.horizontal)
                }.padding(.horizontal)
            }
    }
}
