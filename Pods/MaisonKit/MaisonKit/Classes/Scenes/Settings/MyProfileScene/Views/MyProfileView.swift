// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI
import MessageUI

/// A view that shows the different informations of the logged in user
/// Also gives the ability to contact someone to update the informations.
struct MyProfileView: View {

    @ObservedObject private var viewModel: MyProfileViewModel

    init(viewModel: MyProfileViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        FormView(
            fields: self.viewModel.items,
            footer: self.buildFooter
        )
    }

    private func buildFooter() -> some View {
        VStack(alignment: .center, spacing: 10) {
            if let textDetails = self.viewModel.crmTextDetails {
                Text(verbatim: textDetails)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .style("subtitle")
            }
            if let email = self.viewModel.crmEmail {
                self.buildEmailLink(email: email)
            }
        }.frame(maxWidth: .infinity)
    }

    private func buildEmailLink(email: String) -> some View {
        Button(action: {
            self.viewModel.didTapCRMContactButton()
        }, label: {
            Text(verbatim: email)
                .style("subtitle")
        })
        .buttonStyle(PlainButtonStyle())
    }
}
