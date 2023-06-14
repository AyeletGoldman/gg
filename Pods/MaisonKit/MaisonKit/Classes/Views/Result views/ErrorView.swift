// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

/// A custom error view to display errors in MaisonKit
struct ErrorView<CustomView: View>: View {

    /// A custom error view to display instead of the default
    private let customErrorView: CustomView

    /// Creates an ErrorView with a custom error view to display
    /// - Parameter customErrorView: The view that will be shown
    init(customErrorView: CustomView) {
        self.customErrorView = customErrorView
    }

    /// Creates an ErrorView with a custom error view to display from the closure that's passed in
    /// - Parameter customErrorView: A closure that will return the custom error view to be shown
    init(@ViewBuilder customErrorView: () -> CustomView) {
        self.init(customErrorView: customErrorView())
    }

    var body: some View {
        self.customErrorView
    }
}

/// Convenience to create an ErrorView with an `Error` and display that error in a default view
extension ErrorView where CustomView == AuxiliaryView {
    init(error: Error, actionButtonData: ButtonData?) {

        let displayableError: ErrorDisplayable = {
            if let errorDisplayable = error as? ErrorDisplayable {
                return errorDisplayable
            } else {
                return ErrorDisplayable(error)
            }
        }()

        self.init(customErrorView: {
            AuxiliaryView(viewModel: AuxiliaryViewModel(
                imageSource: displayableError.image ?? .styledImage(identifier: "icon-lrg-fail-data"),
                title: displayableError.localizedTitle ?? Labels.errorTitle,
                subtitle: displayableError.localizedDescription,
                buttonData: actionButtonData
            ))
        })
    }
}

private enum Labels {
    static let errorTitle = MKLocalizedString("error-view.title",
                                              comment: "Title for a general error view")
}
