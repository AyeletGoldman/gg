// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

struct ClientListHeaderView: View {

    private let listInfo: ClientListDisplayable.ListInfo
    private let proxy: GeometryProxy

    init(listInfo: ClientListDisplayable.ListInfo, proxy: GeometryProxy) {
        self.listInfo = listInfo
        self.proxy = proxy
    }

    var body: some View {
        StylableGroup("navbar-list") {
            ZStack {
                if let image = self.listInfo.backgroundImage {
                    MaisonKitImage(source: image).aspectRatio(contentMode: .fill)
                    Color.clear.style("overlay")
                }
            }
            .frame(height: self.proxy.safeAreaInsets.top)
            .clipped()
        }.allowsHitTesting(false)
    }
}

#if DEBUG
struct ClientListHeaderView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            GeometryReader { proxy in
                ClientListHeaderView(listInfo:
                                        ClientListDisplayable.ListInfo(title: "List title",
                                                                       subtitle: "List subtitle",
                                                                       backgroundImage: nil,
                                                                       tag: "Some tag"),
                                     proxy: proxy)
            }
            GeometryReader { proxy in
                ClientListHeaderView(listInfo:
                                        ClientListDisplayable.ListInfo(title: "List title",
                                                                       subtitle: nil,
                                                                       backgroundImage: nil,
                                                                       tag: "Some tag"),
                                     proxy: proxy)
            }
            GeometryReader { proxy in
                ClientListHeaderView(listInfo:
                                        ClientListDisplayable.ListInfo(title: "List title",
                                                                       subtitle: "List subtitle",
                                                                       backgroundImage: nil,
                                                                       tag: nil),
                                     proxy: proxy)
            }
        }.previewLayout(.sizeThatFits)
        .environmentObject(Stylist.unstyled)
    }
}
#endif
