// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct ConfirmAppointmentInstruction: InstructionItemDisplayable {

    var appointment: BookAppointmentDisplayable

    func getIcon() -> StylistIdentifier {
        return "icon-lrg-appointment-booking"
    }

    func getTitle() -> String {
        let date = self.appointment.date.date.toString()
        let theme = self.appointment.topic.title
        let dateInterval = DateInterval(start: self.appointment.date.slot.startTime, end: self.appointment.date.slot.endTime)
        guard let appointmentTimeInterval = DateFormatter.shortTimeRangeFormatter.string(from: dateInterval) else {
            return ""
        }

        // swiftlint:disable line_length
        let format = MKLocalizedString("confirm-appointment.instructions.format",
                                       comment: "The format for the instructions in the appointment. The first placeholder is the date of an appointment, the second placeholder is the time of the appointment and the third placeholder is a theme for the appointment. For example, in English: '12th June at 13:00\nCustomer Care'.")
        // swiftlint:enable line_length
        return String(format: format,
                      date,
                      appointmentTimeInterval,
                      theme)
    }

    func getSubtitle() -> String? {
        return self.appointment.clientName
    }
}

struct ConfirmAppointmentView: View {

    @ObservedObject var viewModel: ConfirmAppointmentViewModel

    var body: some View {
        InstructionsDisplayView(icon: .styledImage(identifier: "icon-lrg-appointment"),
                                title: self.viewModel.actionType.title,
                                subtitle: self.viewModel.actionType.subtitle,
                                instructionsDisplayable: InstructionsDisplayable(
                                    title: self.viewModel.actionType.instructionsTitle,
                                    instructions: [ConfirmAppointmentInstruction(appointment: self.viewModel.appointment)]),
                                instructionsVariant: "appointment",
                                buttonTitle: self.viewModel.actionType.buttonTitle,
                                buttonIsLoading: self.viewModel.isLoading,
                                buttonIdentifier: self.viewModel.actionType == .delete ? .alert : .primary,
                                onButtonTapped: self.viewModel.didTapConfirm)
        .padding(.horizontal)
        .padding(.bottom)
    }
}
