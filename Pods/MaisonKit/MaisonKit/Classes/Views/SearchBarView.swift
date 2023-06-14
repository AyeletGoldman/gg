// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    var placeholder: String = "Search"
    var onCommit: (() -> Void)?

    var body: some View {
        // Search view
        StylableGroup(self.groupStylableName()) {
            HStack {
                MaisonKitImage(source: .styledImage(identifier: "icon-search"))
                    .frame(width: 20, height: 20)
                    .accessibility(identifier: "search-icon")

                TextField(self.$searchText, onEditingChanged: { _ in }, onCommit: {
                    self.onCommit?()
                }).placeHolder(Text(self.placeholder),
                               shouldShow: self.searchText.isEmpty)
                    .style("title")

                Button(action: {
                    self.searchText = ""
                }, label: {
                    MaisonKitImage(source: .styledImage(identifier: "icon-clear"))
                        .opacity(self.searchText == "" ? 0 : 1)
                        .frame(width: 20, height: 20)
                })
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .style("background")
        }
    }

    private func groupStylableName() -> String {
        if self.searchText.isEmpty {
            return "search"
        } else {
            return "search[highlighted]"
        }
    }
}

extension View {
    @ViewBuilder
    func wrapSearchViewToNavigationBar() -> some View {
        StylableGroup("searchbar") {
            self.frame(height: 36)
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 15, trailing: 16))
                .style("background")
        }.zIndex(20) // Make sure this bar is above all other content.
    }
}
