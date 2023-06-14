// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import Combine
import StylableSwiftUI

struct EditAppointmentView: View {

    private enum Labels {
        static let deleteButtonTitle = MKLocalizedString("edit-appointment.delete-button.title",
                                                         comment: "Title for delete appointment button in edit appointment screen")
    }

    @ObservedObject private var viewModel: EditAppointmentViewModel

    init(viewModel: EditAppointmentViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GenericFormView(viewModel: self.viewModel)
            .withFloatingActionView {
                if self.viewModel.isDeletable {
                    self.buildDeleteButton()
                }
            }
    }

    @ViewBuilder
    private func buildDeleteButton() -> some View {
        AlertButton(buttonData: ButtonData(label: Labels.deleteButtonTitle,
                                           action: self.viewModel.presentDeleteConfirmation))
        .padding(.horizontal)
        .padding(.vertical, 20)
    }
}
