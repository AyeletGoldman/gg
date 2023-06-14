// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

struct InstructionsDisplayView<Footer: View>: View {

    @Environment(\.isModalPresentationStyle) private var isPresentedModally

    let icon: ImageSource?
    let title: String
    let subtitle: String?

    let footerView: (() -> Footer)?
    let buttonTitle: String
    let onButtonTapped: () -> Void
    let buttonIsLoading: Bool
    let buttonIdentifier: ButtonIdentifier
    let instructionsDisplayable: InstructionsDisplayable?
    let instructionsVariant: String?

    init(icon: ImageSource?,
         title: String,
         subtitle: String?,
         instructionsDisplayable: InstructionsDisplayable?,
         instructionsVariant: String? = nil,
         buttonTitle: String,
         buttonIsLoading: Bool,
         buttonIdentifier: ButtonIdentifier = .primary,
         onButtonTapped: @escaping () -> Void,
         footerView: (() -> Footer)? = nil) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.footerView = footerView
        self.buttonTitle = buttonTitle
        self.onButtonTapped = onButtonTapped
        self.buttonIsLoading = buttonIsLoading
        self.buttonIdentifier = buttonIdentifier
        self.instructionsDisplayable = instructionsDisplayable
        self.instructionsVariant = instructionsVariant
    }

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 0) {
                    Spacer(minLength: 10)
                    AuxiliaryView(viewModel: AuxiliaryViewModel(imageSource: self.icon,
                                                                title: self.title,
                                                                subtitle: self.subtitle),
                                  automaticallyCenterInView: false)

                    if let instructionsDisplayable = self.instructionsDisplayable {
                        Spacer().frame(minHeight: 10, maxHeight: 20)
                        InstructionItemBlockView(displayable: instructionsDisplayable, variant: self.instructionsVariant)
                            .padding(.horizontal) // Designs show this as having a double padding
                    }
                    Spacer()
                }
            }
            self.footerView?().padding(.bottom, 20)
            self.buildContinueButton()
        }
    }

    @ViewBuilder
    private func buildContinueButton() -> some View {
        StyledButton.fullWidthPaddedButton(data: ButtonData(label: self.buttonTitle,
                                                            action: self.onButtonTapped),
                                           style: self.buttonIdentifier,
                                           isLoading: self.buttonIsLoading)
    }
}

extension InstructionsDisplayView where Footer == Never {
    init(icon: ImageSource?,
         title: String,
         subtitle: String?,
         instructionsDisplayable: InstructionsDisplayable?,
         instructionsVariant: String? = nil,
         buttonTitle: String,
         buttonIsLoading: Bool,
         buttonIdentifier: ButtonIdentifier = .primary,
         onButtonTapped: @escaping () -> Void) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
        self.onButtonTapped = onButtonTapped
        self.buttonIsLoading = buttonIsLoading
        self.buttonIdentifier = buttonIdentifier
        self.instructionsDisplayable = instructionsDisplayable
        self.footerView = nil
        self.instructionsVariant = instructionsVariant
    }
}
