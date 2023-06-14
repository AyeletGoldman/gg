// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct AssetsGroupView: View {

    private enum Labels {
        static let extraAssetsAmountTitle = MKLocalizedString("assets-group.extra-assets-amount.title",
                                                              comment: "The title of extra assets amount in assets group block")
    }

    private enum Constants {
        static let dividerWidth: Double = 3
    }

    let assets: [MediaType]
    let blockSize: CGFloat

    init(assets: [MediaType], blockSize: CGFloat = 120) {
        self.assets = assets
        self.blockSize = blockSize
    }

    var body: some View {
        StylableGroup("image") {
            self.buildAssetsBlock()
                .frame(width: self.blockSize, height: self.blockSize)
                .style("background")
        }
    }

    @ViewBuilder
    private func buildAssetsBlock() -> some View {
        if self.assets.count == 1 {
            self.build1AssetBlock(asset: self.assets[0], width: self.blockSize)
        } else if self.assets.count == 2 {
            self.build2AssetsBlock(asset1: self.assets[0], asset2: self.assets[1])
        } else if self.assets.count >= 3 {
            self.build3AssetsBlock(asset1: self.assets[0],
                                   asset2: self.assets[1],
                                   asset3: self.assets[2],
                                   extraAssetsAmount: self.assets.count - 3)
        } else {
            Spacer()
        }
    }

    private func build1AssetBlock(asset: MediaType, width: CGFloat, height: CGFloat? = nil) -> some View {
        MediaTypeView(source: asset)
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .clipped()
    }

    private func build2AssetsBlock(asset1: MediaType, asset2: MediaType) -> some View {
        HStack(spacing: 0) {
            self.build1AssetBlock(asset: asset1, width: (self.blockSize/2) - Constants.dividerWidth/2)
            self.buildSpacer()
            self.build1AssetBlock(asset: asset2, width: (self.blockSize/2) - Constants.dividerWidth/2)
        }
    }

    private func build3AssetsBlock(asset1: MediaType, asset2: MediaType, asset3: MediaType, extraAssetsAmount: Int) -> some View {
        HStack(spacing: 0) {
            self.build1AssetBlock(asset: asset1, width: self.blockSize * 0.4 - Constants.dividerWidth/2)
            self.buildSpacer()
            VStack(spacing: 0) {
                self.build1AssetBlock(asset: asset2,
                                      width: self.blockSize * 0.6 - Constants.dividerWidth/2,
                                      height: self.blockSize/2 - Constants.dividerWidth/2)
                self.buildSpacer(isVertical: false)
                ZStack {
                    self.build1AssetBlock(asset: asset3,
                                          width: self.blockSize * 0.6 - Constants.dividerWidth/2,
                                          height: self.blockSize/2 - Constants.dividerWidth/2)
                    if extraAssetsAmount > 0 {
                        Text(String(format: Labels.extraAssetsAmountTitle, String(extraAssetsAmount)))
                            .style("title")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .style("overlay")
                    }
                }.frame(height: self.blockSize/2 - Constants.dividerWidth/2)
            }
        }
    }

    private func buildSpacer(isVertical: Bool = true) -> some View {
        Group {
            if isVertical {
                Rectangle().fill(.clear)
                    .frame(width: Constants.dividerWidth)
            } else {
                Rectangle().fill(.clear)
                    .frame(height: Constants.dividerWidth)
            }
        }
        .style("line")
    }
}
