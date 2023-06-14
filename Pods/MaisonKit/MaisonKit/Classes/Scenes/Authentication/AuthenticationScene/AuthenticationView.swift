// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI
import SwiftUI
import Combine

/// A view that shows a loading spinner while we do authentication and a button to initialise authentication.
struct AuthenticationView: View {

    @ObservedObject private var viewModel: AuthenticationViewModel

    private enum Constants {
        static let bottomSpacerHeight: CGFloat = 60
        static let titleAndIconSpacer: CGFloat = 20
        static let iconAndButtonSpacer: CGFloat = 41
        static let iconSize: CGSize = CGSize(width: 36, height: 36)
    }

    private enum Labels {
        // String constants
        static let loginError = MKLocalizedString("login.error.title", comment: "The text to show when an error occures when logging in")
        static let loginProcessing = MKLocalizedString("login.processing.title", comment: "The text to show while we are getting the user's data after logging in")
        static let loginButton = MKLocalizedString("login.button.title", comment: "The title of the login button in the login screen")
    }

    /// Creates a new `AuthenticationView`.
    /// - Parameter viewModel: an `AuthenticationViewModel` that will handle the heavy lifting of the authentication.
    ///     When this view appears, it calls the view model's `startAuthentication` method.
    init(viewModel: AuthenticationViewModel) {
        self.viewModel = viewModel
    }

    /// The main body of the `AuthenticationView`. Returns a loading view that on appearing will call the
    /// view model's `startAuthentication` method.
    var body: some View {
        GeometryReader { proxy in
            StylableGroup("login") {
                SplashView {
                    self.buildCurrentView(proxy: proxy)
                }
            }
        }
    }

    @ViewBuilder
    private func buildCurrentView(proxy: GeometryProxy) -> some View {
        switch self.viewModel.authenticationStatus {
        case .notStarted:
            self.buildLoginButtonView(geometryProxy: proxy)
        case .loggingIn:
            VStack {
                self.buildTitleView()
                    .style("title")
                    .padding(.horizontal)
                Spacer().frame(height: Constants.titleAndIconSpacer)
                LoadingView()
                Spacer().frame(height: Constants.bottomSpacerHeight)
            }
        case .errored:
            VStack {
                self.buildTitleView()
                    .style("title")
                    .padding(.horizontal)
                Spacer().frame(height: Constants.titleAndIconSpacer)
                MaisonKitImage(source: .styledImage(identifier: "icon-fail"))
                    .frame(width: Constants.iconSize.width, height: Constants.iconSize.height)
                Spacer().frame(height: Constants.iconAndButtonSpacer)
                self.buildLoginButtonView(geometryProxy: proxy)
            }
        }
    }

    @ViewBuilder
    private func buildTitleView() -> some View {
        Group {
            if case .errored = self.viewModel.authenticationStatus {
                Text(verbatim: Labels.loginError)
            } else if case .loggingIn = self.viewModel.authenticationStatus {
                Text(verbatim: Labels.loginProcessing)
            }
        }.fixedSize(horizontal: false, vertical: true)
    }

    private func buildLoginButtonView(geometryProxy: GeometryProxy) -> some View {
        PrimaryButton(buttonData: ButtonData(label: Labels.loginButton,
                                             action: self.viewModel.didTapLogin))
        .accessibility(identifier: "login-button")
        .padding(.horizontal)
    }
}

#if DEBUG
struct AuthenticationViewPreviews: PreviewProvider {
    static var previews: some View {
        return AuthenticationView(viewModel: AuthenticationViewModel(performLogin: { _ in }))
    }

    static private var authenticationURL: URL {
        URL(string: "https://www.example.com")!
    }
}
#endif
