// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct InstructionsSceneView: View {

    private enum Labels {
        static let dontForgetTitle = MKLocalizedString("outreach.instructions.dont-forget.title",
                                                       comment: "The title for the don't forget part of the instructions")
        static let toggleTitle = MKLocalizedString("outreach.instructions.toggle.title",
                                                   comment: "The title for the toggle button in the instructions view")
        static let savingAssetsTitle = MKLocalizedString("outreach.instructions.saving-pictures.title",
                                                           comment: "The title for the bottom button when download and saving product pictures")
    }

    @Environment(\.isModalPresentationStyle) private var isPresentedModally

    @StateObject private var viewModel: InstructionsViewModel

    init(viewModel: InstructionsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        InstructionsDisplayView(icon: .styledImage(identifier: "icon-lrg-next-steps"),
                                title: Labels.dontForgetTitle,
                                subtitle: self.viewModel.instructionsSubtitle,
                                instructionsDisplayable: self.viewModel.instructionsDisplayable,
                                buttonTitle: self.viewModel.picturesDownload.isLoading ? Labels.savingAssetsTitle : self.viewModel.instructionsButtonTitle,
                                buttonIsLoading: self.viewModel.picturesDownload.isLoading,
                                onButtonTapped: self.viewModel.didTapOpenAppButton,
                                footerView: self.viewModel.showSaveImagesToggle ? {
                                    StylableGroup("input[radio-box]") {
                                        Toggle(isOn: self.$viewModel.isToggleOn, label: {
                                            Text(verbatim: Labels.toggleTitle).style("title")
                                        })
                                    }
                                    .padding(.bottom)
                                    .padding(.horizontal, 12)
                                    .addStyledRowDivider()
                                } : nil)
            .padding([.horizontal, .bottom])
            .style("background")
            .alert(alertContext: self.$viewModel.alertContext)
    }
}
