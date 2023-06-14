// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public extension ToastViewStyle where Self == DefaultToastViewStyle {
    /// The default "success" toast notification
    static var success: DefaultToastViewStyle {
        return DefaultToastViewStyle(status: .success)
    }

    /// The default "error" toast notification
    static var error: DefaultToastViewStyle {
        return DefaultToastViewStyle(status: .error)
    }

    /// The default "info" toast notification
    static var info: DefaultToastViewStyle {
        return DefaultToastViewStyle(status: .info)
    }
}

/// This is the default implementation of the `ToastViewStyle`. It creates a toast message with some text.
/// This style does not use the image in the configuration.
public struct DefaultToastViewStyle: ToastViewStyle {

    private var toastIcon: StylistIdentifier {
        switch self.status {
        case .error:
            return StylistIdentifier("icon-fail")
        case .success:
            return StylistIdentifier("icon-success")
        case .info:
            return StylistIdentifier("icon-message")
        }
    }

    private var toastVariant: String? {
        switch self.status {
        case .error:
            return "fail"
        case .success:
            return "success"
        case .info:
            return nil
        }
    }

    private let status: Status

    enum Status {
        case info
        case success
        case error
    }

    init(status: Status = .info) {
        self.status = status
    }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "toast", variant: self.toastVariant)) {
            ZStack {
                HStack(spacing: 10) {
                    MaisonKitImage(source: .styledImage(identifier: self.toastIcon))
                        .frame(width: 20, height: 20)
                    configuration.title
                        .style("title")
                }
                .padding()
                .style("background")
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}
