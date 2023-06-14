// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public extension Button where Label == AnyView {

    /// Creates a new button with a title and no icon
    /// - Parameters:
    ///   - title: a string to use for the title. This should be localized.
    ///   - isLoading: A boolean value indicating whether or not this button is in a loading state.
    ///   - expandHorizontally: whether or not this button should expand to fill the parent's available width
    ///   - action: a closure to execute when the button is tapped
    init(title: String, isLoading: Bool = false, expandHorizontally: Bool = false, action: @escaping () -> Void) {
        self.init(title: title, imageSource: nil, isLoading: isLoading, expandHorizontally: expandHorizontally, action: action)
    }

    /// Creates a new button with an icon and no title
    /// - Parameters:
    ///   - icon: an image to show on a button. Usually this will be a `.styledImage(_)`.
    ///   - isLoading: A boolean value indicating whether or not this button is in a loading state.
    ///   - expandHorizontally: whether or not this button should expand to fill the parent's available width
    ///   - action: a closure to execute when the button is tapped
    init(icon: ImageSource, isLoading: Bool = false, expandHorizontally: Bool = false, action: @escaping () -> Void) {
        self.init(title: nil, imageSource: icon, isLoading: isLoading, expandHorizontally: expandHorizontally, action: action)
    }

    /// Creates a new button with a title and and icon
    /// - Parameters:
    ///   - title: a string to use for the title. This should be localized.
    ///   - icon: an image to show on a button. Usually this will be a `.styledImage(_)`.
    ///   - isLoading: A boolean value indicating whether or not this button is in a loading state.
    ///   - expandHorizontally: whether or not this button should expand to fill the parent's available width
    ///   - action: a closure to execute when the button is tapped
    init(title: String, icon: ImageSource, isLoading: Bool = false, expandHorizontally: Bool = false, action: @escaping () -> Void) {
        self.init(title: title, imageSource: icon, isLoading: isLoading, expandHorizontally: expandHorizontally, action: action)
    }

    private init(title: String?, imageSource: ImageSource?, isLoading: Bool = false, expandHorizontally: Bool = false, action: @escaping () -> Void) {
        self.init(action: action, label: {
            HStack(spacing: 7) {
                if let title {
                    Text.title(text: title)
                }
                if let imageSource {
                    MaisonKitImage(source: imageSource)
                        .frame(width: 20, height: 20)
                }
                if isLoading {
                    ProgressView().progressViewStyle(.circular)
                }
            }.frame(maxWidth: expandHorizontally ? .infinity : nil).eraseToAnyView()
        })
    }
}

private extension Text {
    static func title(text: String) -> some View {
        return Text(text).style("title")
    }
}
