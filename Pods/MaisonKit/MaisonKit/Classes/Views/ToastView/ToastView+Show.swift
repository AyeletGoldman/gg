// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

extension NotificationKey {
    static let toastMessage = "toastMessage"
    static let toastCloseSubject = "toastCloseSubject"
    static let toastStyle = "toastStyle"
    static let toastEntryEdge = "toastEntryEdge"
    static let toastImageSource = "toastImageSource"
    static let toastAction = "toastAction"
}

public extension ToastView {

    /// Convenience method to show a `ToastView` with the given properties.
    /// The toast view shown from this function auto-dismisses after a set amount of time.
    /// - Parameters:
    ///   - text: the text to display on the view
    ///   - imageSource: an optional image to display in the toast message.
    ///   Note that whether or not the image is displayed is also controlled by the style applied to the `ToastView` via the `style` parameter.
    ///   Defaults to `nil`.
    ///   - onTap: an action to perform when this toast view is tapped.
    ///   - style: the style to show for the given toast message.
    ///   - edge: the edge to present from. Defaults to `.bottom`.
    static func show<TVS: ToastViewStyle>(text: String,
                                          imageSource: ImageSource? = nil,
                                          onTap: ActionType? = nil,
                                          style: TVS,
                                          edge: ToastViewPresenter.Edge = .bottom) {
        self.show(subject: CurrentValueSubject(text), imageSource: imageSource, onTap: onTap, style: style, edge: edge)
    }

    /// Convenience method to show a `ToastView` with the given properties
    /// If you pass in a `closeSubject` you are responsible for dismissing the `ToastView` presented by this function.
    /// - Parameters:
    ///   - subject: the publisher that will publish values to show as the text in the toast view
    ///   - imageSource: an optional image to display in the toast message.
    ///   Note that whether or not the image is displayed is also controlled by the style applied to the `ToastView` via the `style` parameter.
    ///   Defaults to `nil`.
    ///   - onTap: an action to perform when this toast view is tapped.
    ///   - style: the style to show for the given toast message.
    ///   - edge: the edge to present from. Defaults to `.bottom`.
    ///   - closeSubject: Optional. A subject to control when the toast view is dismissed.
    static func show<TVS: ToastViewStyle>(subject: CurrentValueSubject<String, Never>,
                                          imageSource: ImageSource? = nil,
                                          onTap: ActionType? = nil,
                                          style: TVS,
                                          edge: ToastViewPresenter.Edge = .bottom,
                                          closeSubject: PassthroughSubject<DispatchTime, Never>? = nil) {
        var userInfo: [AnyHashable: Any] = [
            NotificationKey.toastMessage: subject,
            NotificationKey.toastStyle: AnyToastViewStyle(style: style),
            NotificationKey.toastEntryEdge: edge
        ]

        if let imageSource = imageSource {
            userInfo[NotificationKey.toastImageSource] = imageSource
        }

        if let onTap = onTap {
            userInfo[NotificationKey.toastAction] = onTap
        }

        if let closeSubject = closeSubject {
            userInfo[NotificationKey.toastCloseSubject] = closeSubject
        }

        NotificationCenter.default.post(name: .showToastNotification, object: nil, userInfo: userInfo)
    }
}
