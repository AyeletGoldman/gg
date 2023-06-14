// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import Combine

struct ToastViewWrapper: View {
    @State private var text: String = ""
    private let titlePublisher: AnyPublisher<String, Never>
    private let imageSource: ImageSource?
    private let onTap: (() -> Void)?
    private let edge: ToastViewPresenter.Edge

    init(titlePublisher: AnyPublisher<String, Never>, imageSource: ImageSource?, edge: ToastViewPresenter.Edge = .bottom, onTap: (() -> Void)?) {
        self.titlePublisher = titlePublisher
        self.imageSource = imageSource
        self.edge = edge
        self.onTap = onTap
    }

    private var toastView: some View {
        ToastView(text: self.text, imageSource: self.imageSource)
            .onTapGesture {
                self.onTap?()
            }.onReceive(self.titlePublisher) { newText in
                self.text = newText
            }
    }

    var body: some View {
        GeometryReader { proxy in
            VStack {
                switch self.edge {
                case .bottom:
                    Spacer().layoutPriority(1)
                    self.toastView
                    Spacer(minLength: 45)
                case .top:
                    // 44 for navigation bar height + then some padding
                    // we also take into account the max of either the status bar height (phones without a notch) or the safe area insets (phones with notch)
                    // note that this might have to be revisited if we show this notification from areas that
                    // have a bigger navigation bar, for example: a navigation bar with a search bar, or a large style nav bar.
                    // at that point we might have to re-think how we present notifications/toasts
                    Spacer(minLength: self.getTopPadding(with: proxy) + 44)
                    self.toastView
                        .padding(.top)
                    Spacer().layoutPriority(1)
                }
            }
        }
    }

    private func getTopPadding(with proxy: GeometryProxy) -> CGFloat {
        let notchless = abs(proxy.frame(in: .global).origin.y) + 20
        let notch = abs(proxy.safeAreaInsets.top)
        return max(notchless, notch)
    }
}
