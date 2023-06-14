// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct SearchToolbarView<TitleView: View, UtilityViews: View>: View {

    private let titleView: AnyView
    private let utilityViews: UtilityViews?

    init(titleView: () -> TitleView, utilityViews: () -> UtilityViews) {
        self.titleView = titleView().eraseToAnyView()
        self.utilityViews = utilityViews()
    }

    var body: some View {
        StylableGroup("toolbar[search]") {
            HStack(spacing: 0) {
                self.titleView
                Spacer()
                if let utilityViews = self.utilityViews {
                    utilityViews
                }
            }
            .padding(.horizontal)
            .frame(minHeight: 52)
            .style("background")
        }
    }
}

extension SearchToolbarView where TitleView == Text {
    init(title: String, showSpinner: Bool = false, utilityViews: () -> UtilityViews) {
        self.titleView = {
            Group {
                if showSpinner {
                    LoadingView().frame(width: 20, height: 20)
                        .padding(.trailing, 5)
                }
                Text(verbatim: title).style("title")
            }
            .eraseToAnyView()
        }()
        self.utilityViews = utilityViews()
    }
}
