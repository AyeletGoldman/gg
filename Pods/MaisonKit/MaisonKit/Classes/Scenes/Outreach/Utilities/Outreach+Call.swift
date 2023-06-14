// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// Protocol used to represent an object able to make a call
public protocol PhoneLine {
    /// Instructs the implementer to make a phone call to the given number. Once the call is made, the callback should be executed.
    /// - Parameter potentialNumber: the potential phone number to call
    /// - Parameter callback: a closure to execute after the call has been made
    func call(potentialNumber: String, callback: @escaping (CancellableResult) -> Void)
    /// Instructs the implementer to make a facetime call to the given number. Once the call is made, the callback should be executed.
    /// - Parameter potentialNumber: the potential phone number to call
    /// - Parameter callback: a closure to execute after the call has been made
    func faceTime(potentialNumber: String, callback: @escaping (CancellableResult) -> Void)
    /// Whether or not this device can use the tel scheme
    var isCallAvailable: Bool { get }
    /// Whether or not this device can use the facetime scheme
    var isFaceTimeAvailable: Bool { get }
}

enum CallError: Error {
    case couldNotBuildPhoneNumberURL(number: String)
    case couldNotOpenURL(url: URL)
}

extension CallError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .couldNotBuildPhoneNumberURL(let number):
            return MKLocalizedString("outreach.call.error.phoneNumberURL",
                                     defaultValue: "The specified phone number could not be called: \(number)",
                                     comment: "Error to show to a user when we can't build a phone number URL")
        case .couldNotOpenURL(let url):
            return MKLocalizedString("outreach.call.error.cannotOpenURL",
                                     defaultValue: "Could not open the phone application for the following URL: \(url.absoluteString)",
                                     comment: "Error to show to a user when we can't open the phone number URL")
        }
    }
}

extension UIApplication: PhoneLine {

    /// Make a call given a phone number. When we attempt to make a phone call, we receive success as that the URL has been opened,
    /// even though the call may not have happened. This is because iOS takes over and opens an action sheet with the phone number
    /// to call, and an option to cancel. However, the completion handler is called immediately because the URL was opened (even though the
    /// call hasn't taken place yet).
    /// To get around this, and only call success when the call has actually been made, we monitor some lifecycle notifications. Specifically:
    ///  - `UIApplication.willResignActiveNotification`
    ///  - `UIApplication.didEnterBackgroundNotification`
    ///  - `UIApplication.willEnterForegroundNotification`
    ///  - `UIApplication.didBecomeActiveNotification`
    ///  The order the notifications are fired is:
    ///  - Resign Active
    ///  - if cancel
    ///     - Become Active then END
    ///  - If not cancel
    ///     - Become Active
    ///     - Enter background -> This is when we assume the call was successful
    ///     - Enter foreground when call finished (we ignore this)
    /// - Parameters:
    ///   - potentialNumber: Phone number
    ///   - callback: Closure invoked with the result of the call
    public func call(potentialNumber: String, callback: @escaping (CancellableResult) -> Void) {
        guard let urlToOpen = self.buildPhoneNumberURL(from: potentialNumber) else {
            callback(.failure(CallError.couldNotBuildPhoneNumberURL(number: potentialNumber)))
            return
        }

        self.openURLIfPossible(url: urlToOpen, callback: callback)
    }

    public func faceTime(potentialNumber: String, callback: @escaping (CancellableResult) -> Void) {
        guard let urlToOpen = self.buildFacetimeURL(from: potentialNumber) else {
            callback(.failure(CallError.couldNotBuildPhoneNumberURL(number: potentialNumber)))
            return
        }

        self.openURLIfPossible(url: urlToOpen, callback: callback)
    }

    private func openURLIfPossible(url: URL, callback: @escaping (CancellableResult) -> Void) {
        guard self.canOpenURL(url) else {
            callback(.failure(CallError.couldNotOpenURL(url: url)))
            return
        }

        var didOpenURLSuccessfully = false

        self.negotiateNotifications { onSuccess in
            if onSuccess && didOpenURLSuccessfully {
                callback(.success)
            } else {
                callback(.failure(nil))
            }
        }

        self.open(url, options: [:], completionHandler: { success in
            didOpenURLSuccessfully = success
        })
    }

    private func negotiateNotifications(callback: @escaping (Bool) -> Void) {
        var didCallEnterBackground = false

        let didEnterBackgroundNotification: NSObjectProtocol?
        didEnterBackgroundNotification = NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification,
                                                                                object: nil,
                                                                                queue: nil) { _ in
            didCallEnterBackground = true
        }

        var didBecomeActiveNotification: NSObjectProtocol?
        // This warning is safe to ignore
        didBecomeActiveNotification = NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification,
                                                                             object: nil,
                                                                             queue: nil) { _ in
            // The notification for entering the background happens immediately after this one when the user taps "call"
            // so let's wait 1s and if we saw "didCallEnterBackground" we assume that the call is in progress.
            // If on the other hand, after 1s there was no `didCallEnterBackground` notification, we assume
            // the user pressed cancel
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                callback(didCallEnterBackground)
                if let didEnterBackgroundNotification {
                    NotificationCenter.default.removeObserver(didEnterBackgroundNotification)
                }
            }
            if let didBecomeActiveNotification {
                NotificationCenter.default.removeObserver(didBecomeActiveNotification)
            }
        }
    }

    public var isFaceTimeAvailable: Bool {
        guard let urlToOpen = self.buildFacetimeURL(from: "") else {
            return false
        }

        return self.canOpenURL(urlToOpen)
    }

    public var isCallAvailable: Bool {
        guard let urlToOpen = self.buildPhoneNumberURL(from: "") else {
            return false
        }

        return self.canOpenURL(urlToOpen)
    }

    private func buildPhoneNumberURL(from potentialNumber: String) -> URL? {
        return self.buildURL(forScheme: "tel", number: potentialNumber)
    }

    private func buildFacetimeURL(from potentialNumber: String) -> URL? {
        return self.buildURL(forScheme: "facetime", number: potentialNumber)
    }

    private func buildURL(forScheme scheme: String, number potentialNumber: String) -> URL? {
        let acceptableCharacterSet = CharacterSet.decimalDigits.union(CharacterSet(charactersIn: "+"))
        let cleanedNumber = potentialNumber.components(separatedBy: acceptableCharacterSet.inverted).joined()
        return URL(string: "\(scheme)://\(cleanedNumber)")
    }
}
