// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import Photos

struct PersonalAssetsCarousel: View {

    private enum Constants {
        static let personalAssetsSize = CGSize(width: 86, height: 86)
    }

    let shouldShowCameraPreview: Bool
    let onCameraPreviewTapped: () -> Void
    let assets: [PHAsset]
    let fetchItemForAsset: (PHAsset) -> ChooseAssetsItem
    let isAssetSelected: (ChooseAssetsItem) -> Bool
    let onTapAsset: (ChooseAssetsItem) -> Void

    @ViewBuilder
    private var cameraOverlay: some View {
        MaisonKitImage(source: .styledImage(identifier: "icon-camera"))
            .frame(width: 40, height: 40)
            .unredacted()
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top) {
                if self.shouldShowCameraPreview {
                    Button(action: self.onCameraPreviewTapped,
                           label: {
                        CameraPreviewView()
                            .frame(width: Constants.personalAssetsSize.width, height: Constants.personalAssetsSize.height)
                            .overlay(self.cameraOverlay)
                            .asImageBackground()
                    })
                }
                ForEach(self.assets, id: \.localIdentifier) { asset in
                    let item = self.fetchItemForAsset(asset)
                    AssetView(item: item,
                              isSelected: self.isAssetSelected(item),
                              contentMode: .fill,
                              onTap: { self.onTapAsset(item) })
                    .frame(width: Constants.personalAssetsSize.width,
                           height: Constants.personalAssetsSize.height)
                    .asImageBackground()
                }
            }.padding(.horizontal)
        }
    }
}
