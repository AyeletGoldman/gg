// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct CuratorCellView: View {

    private enum Labels {
        static let editButtonTitle = MKLocalizedString("product-curator.cell.edit-assets.title",
                                                       comment: "The title of edit assets in curator cell")
    }

    var displayable: CuratedProductDisplayable
    var onTapDelete: () -> Void
    var onImagesEditTap: () -> Void

    var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "product", variant: "group")) {
            HStack(alignment: .top, spacing: 0) {
                StylableGroup(StylistIdentifier.buildFullIdentifier(for: "product", variant: "item")) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(self.displayable.title)
                            .style("title")
                        StylableGroup("info") {
                            LabeledValueView(values: self.displayable.properties)
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading)
                }
                Spacer()
                Button(action: self.onImagesEditTap) {
                    ZStack(alignment: .bottom) {
                        AssetsGroupView(assets: self.displayable.assets)
                            .padding(.bottom)
                        TertiaryButtonLabel(text: Labels.editButtonTitle, icon: "icon-grid")
                    }
                }
                .padding(10)
            }
            .style("background")
            .addSwipeToDelete(standardSwipe: false) {
                withAnimation {
                    self.onTapDelete()
                }
            }
        }
    }
}
