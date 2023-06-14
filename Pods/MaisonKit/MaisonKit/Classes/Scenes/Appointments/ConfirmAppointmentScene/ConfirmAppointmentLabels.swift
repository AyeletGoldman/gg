// Copyright © 2022 LVMH. All rights reserved.

import Foundation

extension ConfirmAppointmentActionType {

    var pageTitle: String {
        switch self {
        case .create:
            return BookAppointmentLabels.pageTitle
        case .delete:
            return DeleteAppointmentLabels.pageTitle
        }
    }

    var title: String {
        switch self {
        case .create:
            return BookAppointmentLabels.title
        case .delete:
            return DeleteAppointmentLabels.title
        }
    }

    var subtitle: String {
        switch self {
        case .create:
            return BookAppointmentLabels.subtitle
        case .delete:
            return DeleteAppointmentLabels.subtitle
        }
    }

    var instructionsTitle: String {
        return BookAppointmentLabels.instructionsTitle
    }

    var buttonTitle: String {
        switch self {
        case .create:
            return BookAppointmentLabels.buttonTitle
        case .delete:
            return DeleteAppointmentLabels.buttonTitle
        }
    }

}

private enum BookAppointmentLabels {
    static let pageTitle = MKLocalizedString("appointments.confirm.navigation-bar.title",
                                         comment: "The title for the confirm appointment screen to be displayed in the navigation bar.")
    static let title = MKLocalizedString("confirm-appointment.title", comment: "The title for the confirm appointment view")
    static let subtitle = MKLocalizedString("confirm-appointment.subtitle", comment: "The subtitle for the confirm appointment view")
    static let instructionsTitle = MKLocalizedString("confirm-appointment.instructions.title", comment: "The title for the instructions to confirm an appointment")
    static let buttonTitle = MKLocalizedString("confirm-appointment.button.title", comment: "The title for the button in the instructions to confirm an appointment")
}

private enum DeleteAppointmentLabels {
    static let pageTitle = MKLocalizedString("confirm-delete-appointment.navigation-bar.title",
                                         comment: "The title for the confirm delete appointment screen to be displayed in the navigation bar.")
    static let title = MKLocalizedString("confirm-delete-appointment.title",
                                         comment: "The title for the confirm delete appointment view")
    static let subtitle = MKLocalizedString("confirm-delete-appointment.subtitle",
                                            comment: "The subtitle for the confirm delete appointment view")
    static let buttonTitle = MKLocalizedString("confirm-delete-appointment.button.title",
                                               comment: "The title for the button in the instructions to confirm delete an appointment")
}
