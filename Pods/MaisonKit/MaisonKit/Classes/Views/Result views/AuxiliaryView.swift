// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A generic view to show data status, such as data error, data empty, no stock to show.
public struct AuxiliaryView: View {

    private let viewModel: AuxiliaryViewModel
    private let automaticallyCenterInView: Bool
    private let topMargin: CGFloat?
    private let bottomMargin: CGFloat?

    public init(viewModel: AuxiliaryViewModel, automaticallyCenterInView: Bool = true) {
        self.viewModel = viewModel
        self.automaticallyCenterInView = automaticallyCenterInView
        self.topMargin = nil
        self.bottomMargin = nil
    }

    public init(viewModel: AuxiliaryViewModel, topMargin: CGFloat? = nil, bottomMargin: CGFloat? = nil) {
        self.viewModel = viewModel
        self.automaticallyCenterInView = false
        self.topMargin = topMargin
        self.bottomMargin = bottomMargin
    }

    public var body: some View {
        StylableGroup("message-view") {
            Group {
                if self.automaticallyCenterInView {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            self.buildContent()
                            Spacer()
                        }
                        Spacer()
                    }
                } else {
                    self.buildContent()
                        .frame(maxWidth: .infinity)
                        .padding(.top, self.topMargin)
                        .padding(.bottom, self.bottomMargin)
                }
            }.style("background")
        }
    }

    @ViewBuilder
    private func buildContent() -> some View {
        AuxiliaryViewContent(imageSource: self.viewModel.imageSource,
                             title: self.viewModel.title,
                             subtitle: self.viewModel.subtitle,
                             buttonData: self.viewModel.buttonData)
    }
}

private struct AuxiliaryViewContent: View {
    let title: String?
    let imageSource: ImageSource?
    let subtitle: String?
    let buttonData: ButtonData?

    public init(imageSource: ImageSource? = nil, title: String? = nil, subtitle: String? = nil, buttonData: ButtonData? = nil) {
        self.imageSource = imageSource
        self.title = title
        self.subtitle = subtitle
        self.buttonData = buttonData
    }

    public var body: some View {
        VStack(spacing: 0) {
            if let imageSource = self.imageSource {
                MaisonKitImage(source: imageSource)
                    .frame(width: 60, height: 60)
                    .scaledToFit()
                    .padding(.bottom, 6)
                    .accessibility(identifier: "auxiliary-image")
            }

            if let title = self.title {
                Text(verbatim: title)
                    .style("title")
                    .padding(.bottom, 8)
                    .accessibility(identifier: "auxiliary-text")
            }

            if let subtitle = self.subtitle {
                Text(verbatim: subtitle)
                    .style("subtitle")
                    .padding(.bottom, 17)
                    .accessibility(identifier: "auxiliary-subtitle")
            }

            if let buttonData = self.buttonData {
                TertiaryButton(buttonData: buttonData)
                    .accessibility(identifier: "auxiliary-button")
            }
        }.frame(maxWidth: 280)
    }
}

/// A view model to handle `AuxiliaryView` data
public struct AuxiliaryViewModel {
    let title: String?
    let imageSource: ImageSource?
    let subtitle: String?
    let buttonData: ButtonData?

    /// Creates an instance of `AuxiliaryViewModel`
    /// - Parameters:
    ///   - imageSource: The icon to show
    ///   - title: The message title
    ///   - subtitle: The message subtitle
    ///   - buttonData: An optional button next to the message
    public init(imageSource: ImageSource? = nil, title: String? = nil, subtitle: String? = nil, buttonData: ButtonData? = nil) {
        self.imageSource = imageSource
        self.title = title
        self.subtitle = subtitle
        self.buttonData = buttonData
    }

    /// Creates an instance of `AuxiliaryViewModel`, will be usually in use in ErrorView
    /// - Parameters:
    ///   - displayableError: The error to show
    public init(displayableError: ErrorDisplayable) {
        self.init(imageSource: displayableError.image, title: displayableError.localizedTitle, subtitle: displayableError.localizedDescription)
    }
}

public extension AuxiliaryViewModel {
    /// A static function to create `AuxiliaryViewModel` that handle empty data
    /// - Parameters:
    ///   - title: The empty data title
    ///   - subtitle: The empty data subtitle
    ///   - buttonData: An optional button next to the message
    /// - Returns: an `AuxiliaryViewModel` pre-configured to show for empty results. 
    static func emptyDataModel(title: String, subtitle: String, buttonData: ButtonData? = nil) -> AuxiliaryViewModel {
        self.init(imageSource: .styledImage(identifier: "icon-lrg-fail-results"), title: title, subtitle: subtitle, buttonData: buttonData)
    }
}

struct AuxiliaryView_Previews: PreviewProvider {
    static var previews: some View {
        AuxiliaryView(viewModel: AuxiliaryViewModel(
                        imageSource: .system(name: "wifi.exclamationmark"),
                        title: "Hello",
                        subtitle: "This is an auxiliary view",
                        buttonData: ButtonData(label: "With label", action: {}))
        )
    }
}
