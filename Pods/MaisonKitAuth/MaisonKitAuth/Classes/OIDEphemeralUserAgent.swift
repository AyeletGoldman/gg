// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import UIKit
import AuthenticationServices
import AppAuth

/// A custom implementation of OIDExternalUserAgent that uses ephemeral sessions.
/// This is done to work around the fact that we don't have a working `logout` endpoint
/// so there's no way for us to tell the backend to clear our session.
final class OIDEphemeralASWebAuthenticationUserAgent: NSObject, OIDExternalUserAgent {
    private let presentingViewController: UIViewController
    private var externalUserAgentFlowInProgress: Bool = false
    private var authenticationViewController: ASWebAuthenticationSession?

    private weak var session: OIDExternalUserAgentSession?

    init(with presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
        super.init()
    }

    func present(_ request: OIDExternalUserAgentRequest, session: OIDExternalUserAgentSession) -> Bool {
        if self.externalUserAgentFlowInProgress {
            return false
        }
        guard let requestURL = request.externalUserAgentRequestURL() else {
            return false
        }
        self.externalUserAgentFlowInProgress = true
        self.session = session

        // ASWebAuthenticationSession doesn't work with guided access (Search web for "rdar://40809553")
        // Make sure that the device is not in Guided Access mode "(Settings -> General -> Accessibility -> Enable Guided Access)"
        if UIAccessibility.isGuidedAccessEnabled == false {
            let redirectScheme = request.redirectScheme()
            let authenticationViewController = ASWebAuthenticationSession(url: requestURL, callbackURLScheme: redirectScheme) { (callbackURL, error) in
                self.authenticationViewController = nil
                if let url = callbackURL {
                    self.session?.resumeExternalUserAgentFlow(with: url)
                } else {
                    let webAuthenticationError = OIDErrorUtilities.error(with: OIDErrorCode.userCanceledAuthorizationFlow,
                                                              underlyingError: error,
                                                              description: nil)
                    self.session?.failExternalUserAgentFlowWithError(webAuthenticationError)
                }
            }
            authenticationViewController.presentationContextProvider = self
            // `prefersEphemeralWebBrowserSession` works around not having a logout endpoint to clear the session.
            authenticationViewController.prefersEphemeralWebBrowserSession = true
            self.authenticationViewController = authenticationViewController
            return authenticationViewController.start()
        } else {
            let webAuthenticationError = OIDErrorUtilities.error(with: OIDErrorCode.safariOpenError,
                                                                 underlyingError: nil,
                                                                 description: "ASWebAuthenticationSession does not support Guided Access")
            self.session?.failExternalUserAgentFlowWithError(webAuthenticationError)
            return false
        }
    }

    func dismiss(animated: Bool, completion: @escaping () -> Void) {
        // Ignore this call if there is no authorization flow in progress.
        guard self.externalUserAgentFlowInProgress else {
            return completion()
        }
        self.cleanUp()
        self.authenticationViewController?.cancel()
        completion()
    }
}

private extension OIDEphemeralASWebAuthenticationUserAgent {
    func cleanUp() {
        self.session = nil
        self.authenticationViewController = nil
        self.externalUserAgentFlowInProgress = false
    }
}

extension OIDEphemeralASWebAuthenticationUserAgent: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return self.presentingViewController.view.window!
    }
}
