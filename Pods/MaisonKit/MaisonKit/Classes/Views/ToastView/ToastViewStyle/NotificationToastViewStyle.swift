// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public extension ToastViewStyle where Self == NotificationToastViewStyle {

    /// A toast view style of type notification.
    static var notification: NotificationToastViewStyle {
        return NotificationToastViewStyle()
    }
}

/// A "notification" style toast. This is a more feature-rich toast type that includes an image and some text.
public struct NotificationToastViewStyle: ToastViewStyle {

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        StylableGroup("notification") {
            HStack {
                if let image = configuration.image {
                    image
                        .frame(width: 50, height: 50)
                        .asImageBackground()
                }
                configuration.title
                    .frame(minHeight: 50)
                    .minimumScaleFactor(0.8)
                    .style("title")
                Spacer()
                MaisonKitImage(source: .styledImage(identifier: "icon-right"))
                    .frame(width: 20, height: 20)
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .style("background")
            .padding(.horizontal)
        }
    }
}
