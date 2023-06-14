// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct Client360ContactView: View {

    private enum Labels {
        static let contactButtonTitle = MKLocalizedString("client360.contact.button.title",
                                                          comment: "Title for the contact button in Client 360 view")
        static let disabledContactButtonTitle = MKLocalizedString("client360.contact.button-disabled.title",
                                                                  comment: "Title for the contact disabled button in Client 360 view")
    }

    private let action: () -> Void
    private let hasOutreachChannels: ResultState<Bool, ErrorDisplayable>

    init(hasOutreachChannels: ResultState<Bool, ErrorDisplayable>, action: @escaping () -> Void) {
        self.action = action
        self.hasOutreachChannels = hasOutreachChannels
    }

    var body: some View {
        ResultStateViewBuilder(result: self.hasOutreachChannels)
            .setLoadingView {
                self.buildMainView(hasChannels: true)
            }.setWaitingView {
                self.buildMainView(hasChannels: true)
            }.buildContent { hasChannels in
                self.buildMainView(hasChannels: hasChannels)
            }
    }

    @ViewBuilder
    private func buildMainView(hasChannels: Bool) -> some View {
        PrimaryButton(
            buttonData: ButtonData(
                label: hasChannels ? Labels.contactButtonTitle : Labels.disabledContactButtonTitle,
                isEnabled: hasChannels,
                action: self.action)
        )
        .accessibility(identifier: "contact")
    }
}
