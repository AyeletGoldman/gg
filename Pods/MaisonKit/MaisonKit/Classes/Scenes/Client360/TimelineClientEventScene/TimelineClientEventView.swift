// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

struct TimelineClientEventView: View {

    private enum Labels {
        static let deleteButtonTitle = MKLocalizedString("timeline-client-event.delete-button.title",
                                                         comment: "The title of the delete button in timeline client event")
        static let eventDeleted = MKLocalizedString("timeline-client-event.appointment-deleted.description",
                                                    comment: "The banner description showing after the timeline event has been deleted")
    }

    @ObservedObject private var viewModel: TimelineClientEventViewModel

    init(viewModel: TimelineClientEventViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GenericFormView(viewModel: self.viewModel)
            .withFloatingActionView {
                if self.viewModel.isDeletable {
                    self.buildDeleteButton()
                }
            }
            .withNoticeText(text: self.viewModel.isDeleted ? Labels.eventDeleted : nil,
                            variant: "alert")
    }

    @ViewBuilder
    private func buildDeleteButton() -> some View {
        AlertButton(buttonData: ButtonData(label: Labels.deleteButtonTitle,
                                           action: self.viewModel.presentDeleteConfirmation),
                    isLoading: self.viewModel.isDeleting)
        .disabled(self.viewModel.isSaving)
        .padding(.horizontal)
        .padding(.vertical, 20)
    }
}
