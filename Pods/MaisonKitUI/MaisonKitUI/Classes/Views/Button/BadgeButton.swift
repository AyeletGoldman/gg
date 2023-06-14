// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A stylish button with a badge, title and subtitle.
public struct BadgeButton: View {

    private enum Constants {
        static let iconSize: CGFloat = 40
    }

    let title: String
    let subtitle: String
    let icon: ImageSource
    let variant: BadgeButtonVariant?
    let onTap: () -> Void

    /// Creates a new `BadgeButton`
    /// - Parameters:
    ///   - title: The title to show for the button. This is displayed between the icon and the subtitle.
    ///   Usually, this will be a number.
    ///   - subtitle: The subtitle to show for the button. This is displayed beneath the title.
    ///   Usually, this will be a string to explain a section the button represents.
    ///   - icon: An image to show in the button
    ///   - variant: A variant for this badge; usually this will be whether or not this button is in `selected` state.
    ///   - onTap: a closure to invoke when the button is tapped
    public init(title: String,
                subtitle: String,
                icon: ImageSource,
                variant: BadgeButtonVariant? = nil,
                onTap: @escaping () -> Void) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.variant = variant
        self.onTap = onTap
    }

    private var maskView: some View {
        GeometryReader { proxy in
            Circle()
                .offset(x: (proxy.size.width-Constants.iconSize)/2,
                        y: -proxy.size.height/2)
                .frame(width: Constants.iconSize)
        }
    }

    private var background: some View {
        Rectangle()
            .fill(.clear)
            .style("background")
            .inverseMask(self.maskView)
    }

    private var buttonLabel: some View {
        VStack {
            Spacer().frame(height: 25)
            ZStack {
                self.background
                VStack(spacing: 0) {
                    MaisonKitImage(source: self.icon)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.iconSize,
                               height: Constants.iconSize)
                        .offset(y: -Constants.iconSize/2)
                    Group {
                        Text(verbatim: self.title).style("title")
                        Text(verbatim: self.subtitle).style("subtitle")
                        MaisonKitImage(source: .styledImage(identifier: "icon-up"))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)

                    }.offset(y: -10)
                }
                .padding(.horizontal)
            }
        }
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "button-badge",
                                                            variant: self.variant)) {
            Button(action: self.onTap,
                   label: { self.buttonLabel })
                .buttonStyle(.plain)
        }
    }
}

#if DEBUG
struct BadgeButton_Previews: PreviewProvider {
    static var previews: some View {
        BadgeButton(title: "00",
                    subtitle: "label",
                    icon: .system(name: "square.and.arrow.up"), onTap: { })
        .fixedSize()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
