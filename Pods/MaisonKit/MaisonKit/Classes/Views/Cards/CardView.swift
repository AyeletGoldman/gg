// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view resembling a "card" with a background image, a text view at the top
/// and two text views at the bottom.
///
/// All properties of this view are configured via its `viewModel` property.
///
/// Styling:
/// This view is grouped in a `card` style and has a `background` style for the whole group.
/// The top text view has the `topText` style.
/// The bottom texts can be styled with the `title` and `subtitle` styles.
/// The image can be styled with the `image` style.

public struct CardView: View {

    public var viewModel: CardViewModel
    private let alignment: HorizontalAlignment
    private let width: CGFloat

    public init(viewModel: CardViewModel, alignment: HorizontalAlignment = .leading, width: CGFloat = 130) {
        self.viewModel = viewModel
        self.alignment = alignment
        self.width = width
    }

    public var body: some View {
        return self.buildBody()
    }

    @ViewBuilder
    private func buildBody() -> some View {
        StylableGroup("tile") {
            VStack(alignment: self.alignment) {
                ZStack {
                    MaisonKitImage(source: self.viewModel.imageSource)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.width, height: 130)
                        .style("image/background")
                        .contentShape(Rectangle())
                        .unredacted()
                        .clipped()
                    if self.viewModel.topText != nil {
                        self.tag(text: self.viewModel.topText!)
                    }
                }
                self.titleAndSubtitle()
                    // TODO: In SwiftUI, it doesn't appear we can set _just_ the maxWidth and maintain the
                    // alignment from some other view. So we set both the width and alignment here, although
                    // the alignment should be inherited from the style of the title and subtitle views.
                    .frame(maxWidth: self.width, alignment: .leading)
            }
            .style("background")
            .padding(.bottom, 26)
        }
    }

    private func titleAndSubtitle() -> some View {
        let subtitleTopSpacerHeight: CGFloat = self.viewModel.hasTitle ? 5 : 8
        return VStack(alignment: self.alignment) {
            if let title = self.viewModel.title {
                Spacer().frame(height: 8)
                Text(verbatim: title)
                    .style("title")
            }
            if let subtitle = self.viewModel.subtitle {
                Spacer().frame(height: subtitleTopSpacerHeight)
                Text(verbatim: subtitle)
                    .style("subtitle")
            }
        }
    }

    private func tag(text: String) -> some View {
        VStack {
            HStack {
                BadgeView(title: text)
                    .badgeViewStyle(SecondaryBadgeViewStyle())
                    .padding(10)
                Spacer()
            }
            Spacer()
        }
    }
}

///
/// View model to configure a CardView.
///
public struct CardViewModel: Identifiable {
    public let id: String
    public let imageSource: ImageSource
    public let topText: String?
    public let title: String?
    public let subtitle: String?

    var hasTitle: Bool {
        guard let title = self.title else {
            return false
        }
        return !title.isEmpty
    }

    var hasSubtitle: Bool {
        guard let subtitle = self.subtitle else {
            return false
        }
        return !subtitle.isEmpty
    }

    public init(id: String,
                imageSource: ImageSource,
                topText: String? = nil,
                title: String? = nil,
                subtitle: String? = nil) {
        self.id = id
        self.imageSource = imageSource
        self.topText = topText
        self.title = title
        self.subtitle = subtitle
    }
}
