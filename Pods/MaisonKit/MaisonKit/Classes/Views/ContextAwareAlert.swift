// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI

public struct AlertContext: Identifiable {

    private enum Labels {
        static let cancelButtonTitle = MKLocalizedString("alert.buttons.cancel.title",
                                                         comment: "The default 'cancel' button title")
        static let okButtonTitle = MKLocalizedString("alert.buttons.ok.title",
                                                     comment: "The default 'OK' button title")
    }

    public typealias ButtonAction = (() -> Void)

    public enum ButtonStyle {
        case cancel(action: ButtonAction?)
        case `default`(action: ButtonAction)
        case destructive(action: ButtonAction)
    }

    public struct Button {
        let title: String
        let style: ButtonStyle

        public init(title: String, style: ButtonStyle) {
            self.title = title
            self.style = style
        }

        public static func cancel(action: ButtonAction? = nil) -> Button {
            return Button(title: Labels.cancelButtonTitle,
                          style: .cancel(action: action))
        }

        public static func ok(action: ButtonAction? = nil) -> Button {
            return Button(title: Labels.okButtonTitle,
                          style: .default(action: { action?() }))
        }

        func makeButton() -> Alert.Button {
            switch self.style {
            case .cancel(let action):
                if let action = action {
                    return .cancel(Text(verbatim: self.title),
                                   action: action)
                } else {
                    return .cancel(Text(verbatim: self.title))
                }
            case .default(let action):
                return .default(Text(verbatim: self.title), action: action)
            case .destructive(let action):
                return .destructive(Text(verbatim: self.title), action: action)
            }
        }
    }

    public let id = UUID()

    let title: String
    let message: String?
    let primaryButton: Button
    let secondaryButton: Button?

    public init(title: String,
                message: String? = nil,
                primaryButton: Button = .cancel(),
                secondaryButton: Button? = nil) {
        self.title = title
        self.message = message
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
    }
}

extension AlertContext {
    func createAlert() -> Alert {
        guard let secondaryButton = self.secondaryButton else {
            return Alert(title: Text(verbatim: self.title),
                         message: self.message.map { Text(verbatim: $0) },
                         dismissButton: self.primaryButton.makeButton())
        }
        return Alert(title: Text(verbatim: self.title),
                     message: self.message.map { Text(verbatim: $0) },
                     primaryButton: self.primaryButton.makeButton(),
                     secondaryButton: secondaryButton.makeButton())
    }
}

struct ContextAwareAlert: ViewModifier {

    @Binding private var alertContext: AlertContext?

    init(alertContext: Binding<AlertContext?>) {
        self._alertContext = alertContext
    }

    func body(content: Content) -> some View {
        content.alert(item: self.$alertContext) { context in
            context.createAlert()
        }
    }
}

extension View {
    /// Present an alert on the current view with the date in the binding
    /// Use this method when you need to show an alert that contains information from a binding to an optional data source that you provide.
    /// - Parameters:
    ///   - alertContext: The binding that controls whether the alert is presented. If the value in the binding is not `nil` the alert will be shown.
    ///   If value changes, the system dismisses the currently displayed alert and replaces it with a new one using the same presentation process.
    /// - Returns: a modified view that will present the alert with
    public func alert(alertContext: Binding<AlertContext?>) -> some View {
        self.modifier(ContextAwareAlert(alertContext: alertContext))
    }
}
