// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct AppointmentDetailsView: View {

    private enum Labels {
        static let joinMeetingButtonTitle = MKLocalizedString("appointment-details.join-virtual-meeting.button.title",
                                                              comment: "Title for the join virtual meeting button")
        static let joinMeetingDescription = MKLocalizedString("appointment-details.join-virtual-meeting.description",
                                                              comment: "The description for how long before the meeting the virtual link is availiable")
        static let appointmentCencelled = MKLocalizedString("appointment-details.appointment-cancelled.description",
                                                            comment: "The banner description showing after the appointment has been cancelled")
    }

    @ObservedObject private var viewModel: AppointmentDetailsViewModel

    init(viewModel: AppointmentDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GenericFormView(viewModel: self.viewModel)
            .withFloatingActionView {
                ResultStateViewBuilder(result: self.viewModel.displayable)
                    .setLoadingView {
                        self.buildJoinMeetingButton(displayable: AppointmentDetailsDisplayable.loadingDisplayable)
                    }.buildContent { displayable in
                        self.buildJoinMeetingButton(displayable: displayable)
                    }
            }
            .withNoticeText(text: self.viewModel.isCancelled ? Labels.appointmentCencelled : nil,
                            variant: "alert")
    }

    @ViewBuilder
    private func buildJoinMeetingButton(displayable: AppointmentDetailsDisplayable) -> some View {
        if let virtualMeeting = displayable.virtualMeeting, !displayable.isCancelled {
            VStack(spacing: 20) {
                PrimaryButton(buttonData: ButtonData(label: Labels.joinMeetingButtonTitle,
                                                     isEnabled: self.viewModel.joinVirtualMeetingAvailiable,
                                                     action: virtualMeeting.joinAction))
                if let minutes = self.viewModel.premeetingActiveMinutes {
                    Text(String(format: Labels.joinMeetingDescription, String(minutes)))
                        .style("body")
                        .padding(.horizontal)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}

private extension AppointmentDetailsDisplayable {
    static var loadingDisplayable: AppointmentDetailsDisplayable {
        AppointmentDetailsDisplayable(
            id: UUID().uuidString,
            clientId: UUID().uuidString,
            clientName: "Sarah Materazzo",
            topic: SelectionListItem(id: UUID().uuidString, title: "The topic"),
            type: SelectionListItem(id: UUID().uuidString, title: "The appointment type"),
            store: SelectionListItem(id: UUID().uuidString, title: "The appointment store"),
            date: DateAndSlot(date: Date(), slot: CalendarSlot(id: UUID().uuidString, startTime: Date(), endTime: Date())),
            notes: "The client is interested into the newesst collection, wants to buy a present for a relative.",
            virtualMeeting: nil,
            isEditable: true,
            isCancelled: false)
    }
}
