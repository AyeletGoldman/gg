//  Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

struct NotificationsPermissionsView: View {

    private enum Labels {
        static let getNotifiedTitle = MKLocalizedString("notifications.permission-modal.not-determined.title",
                                                        comment: "The title for the permissions modal view when we don't know if permissions have been granted.")
        static let getNotifiedBody = MKLocalizedString("notifications.permission-modal.not-determined.body",
                                                       comment: "The body for the permissions modal view when we don't know if permissions have been granted.")
        static let enableTitle = MKLocalizedString("notifications.permission-modal.not-permitted.title",
                                                        comment: "The title for the permissions modal view when the user has previously declined permissions for notifications.")
        static let enableBody = MKLocalizedString("notifications.permission-modal.not-permitted.body",
                                                       comment: "The body for the permissions modal view when the user has previously declined permissions for notifications")
        static let enableNotificationsButtonTitle = MKLocalizedString("notifications.permission-modal.enable-button.title",
                                                                      comment: "The title of the button to enable notifications")
        static let continueWithoutNotificationsButtonTitle = MKLocalizedString("notifications.permission-modal.continue-button.title",
                                                                      comment: "The title of the button to continue without notifications")
        static let goToSettingsButtonTitle = MKLocalizedString("notifications.permission-modal.settings-button.title",
                                                                      comment: "The title of the button to open the settings app")
    }

    @ObservedObject private var viewModel: NotificationsPermissionsViewModel
    @Environment(\.isModalPresentationStyle) private var isPresentedModally

    init(viewModel: NotificationsPermissionsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            AuxiliaryView(viewModel: AuxiliaryViewModel(imageSource: .styledImage(identifier: "icon-lrg-notifications"),
                                                        title: Labels.getNotifiedTitle,
                                                        subtitle: Labels.getNotifiedBody,
                                                        buttonData: nil), automaticallyCenterInView: false)
            Spacer()
            if self.viewModel.mode.isDeclined {
                PrimaryButton(buttonData: ButtonData(label: Labels.goToSettingsButtonTitle,
                                                     action: self.viewModel.didTapGoToSettings))
            } else {
                PrimaryButton(buttonData: ButtonData(label: Labels.enableNotificationsButtonTitle,
                                                     action: self.viewModel.didTapEnableNotifications))
            }
            SecondaryButton(buttonData: ButtonData(label: Labels.continueWithoutNotificationsButtonTitle,
                                                   action: self.viewModel.didTapContinueWithoutNotifications))
        }
        .padding()
        .padding(.bottom, if: self.isPresentedModally)
        .style("background")
        .edgesIgnoringSafeArea(.bottom, if: self.isPresentedModally)
    }
}
