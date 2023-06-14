// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

extension View {
    @ViewBuilder
    func addToolbar(shouldShow: Bool,
                    toolbarVariant: String?,
                    clearTitle: String,
                    onClear: @escaping () -> Void,
                    trailingTitle: ResultState<String, ErrorDisplayable>? = nil) -> some View {
        if shouldShow {
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    self
                    StylableGroup(StylistIdentifier.buildFullIdentifier(for: "toolbar", variant: toolbarVariant)) {
                        HStack {
                            Button(clearTitle, action: onClear)
                                .style("button-icon-left/title")
                                .padding(.horizontal, 7)
                            Spacer()
                            if let trailingTitle = trailingTitle {
                                self.buildTrailingTitle(value: trailingTitle)
                            }
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal)
                        .addStyledRowDivider(position: .top)
                        .padding(.bottom, proxy.safeAreaInsets.bottom)
                        .style("background")
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        } else {
            self
        }
    }

    private func buildTrailingTitle(value: ResultState<String, ErrorDisplayable>) -> some View {
        StylableGroup("button-icon-right") {
            ResultStateViewBuilder(result: value)
                .setLoadingView { title in
                    if let title = title {
                        HStack {
                            LoadingView().frame(width: 20, height: 20)
                            Text(title)
                                .style("title")
                        }.unredacted()
                    }
                }
                .setWaitingView {
                    EmptyView()
                }
                .setErrorView { error in
                    Text(error.localizedDescription)
                        .style("title")
                }
                .buildContent { title in
                    Text(title)
                        .style("title")
                }
        }
    }
}
