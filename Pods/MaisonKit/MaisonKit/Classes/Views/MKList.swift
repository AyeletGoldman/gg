// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// An abstraction around `List` to work around some quirks in different operating system versions and provide a unified experience.
public struct MKList<Content: View>: View {

    private let content: (ScrollViewProxy) -> Content

    /// Creates a new MKList with the given content
    /// - Parameter content: a closure that will create the views to put in the list
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = { _ in content() }
    }

    /// Creates a new MKList with the given content. The content passed in has access to a `ScrollViewProxy` that
    /// will allow the caller to scroll the list to the position they need.
    /// - Parameter content: a closure that will create the views to put in the list. Receives a `ScrollViewProxy` which
    /// can be used to scroll to a specific item of content.
    public init(@ViewBuilder content: @escaping (ScrollViewProxy) -> Content) {
        self.content = { scrollViewProxy in
            return content(scrollViewProxy)
        }
    }

    public var body: some View {
        ScrollViewReader { proxy in
            if #available(iOS 16.0, *) {
                // iOS 16 changed the backing view of `List` from `UITableView` to `UICollectionView` but
                // there is no way to remove the section header top padding as of iOS 16.0 so we have
                // to revert back to the original implementation of a scroll view + lazy v stack.
                self.buildScrollView(proxy: proxy)
            } else {
                // There is a problem to wrap `List` with a `ScrollView`.
                // This problem appears currently in client search, when adding the floating buttons to the existing clients list.
                // We can try to fix it and not have the both together but
                // anyway we don't use the standard `List` in the newest iOS version.
                // We decided to keep on the same behavior for iOS 15 and iOS 16.
                // If in iOS 17 we would like to use the standard `List` we will need to test this case again.
                self.buildScrollView(proxy: proxy)
            }
        }
    }

    @ViewBuilder
    private func buildScrollView(proxy: ScrollViewProxy) -> some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0, pinnedViews: .sectionHeaders) {
                self.content(proxy)
                    .style("background")
            }
        }
    }

    @ViewBuilder
    private func buildList(proxy: ScrollViewProxy) -> some View {
        List {
            self.content(proxy)
                .frame(maxWidth: .infinity, alignment: .leading)
                .style("background")
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 0)
        .environment(\.defaultMinListHeaderHeight, 0)
    }
}
