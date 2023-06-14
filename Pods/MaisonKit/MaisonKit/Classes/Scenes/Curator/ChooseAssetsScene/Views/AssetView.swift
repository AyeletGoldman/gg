// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct AssetView: View {

    let item: ChooseAssetsItem
    let isSelected: Bool
    let contentMode: ContentMode
    let onTap: () -> Void

    private var checkboxIdentifier: StylistIdentifier {
        self.isSelected ? "icon-checkbox-selected" : "icon-checkbox"
    }

    private var backgroundMedia: some View {
        MediaTypeView(source: self.item.asset)
            .aspectRatio(contentMode: self.contentMode)
    }

    private var mainBody: some View {
        VStack {
            HStack {
                Spacer()
                MaisonKitImage(source: .styledImage(identifier: self.checkboxIdentifier))
                    .frame(width: 20, height: 20)
                    .padding(10)
            }
            Spacer()
        }.contentShape(Rectangle())
    }

    var body: some View {
        Button(action: self.onTap, label: {
            self.mainBody
        })
        .buttonStyle(.plain)
        .background(self.backgroundMedia)
    }
}
