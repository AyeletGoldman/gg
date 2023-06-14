// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI
import Photos

struct ChooseAssetsView: View {

    private enum Constants {
        static let itemsSpacing: CGFloat = 10
        static let personalAssetsSize = CGSize(width: 86, height: 86)
        static let personalAssetsSectionHeight = 198.0
    }

    private enum Labels {
        static let personalAssetsSectionTitle = MKLocalizedString("choose-assets.personal-assets.section.title",
                                                                  comment: "The title for the section where the user's library's photos appear")
    }

    @ObservedObject private var viewModel: ChooseAssetsViewModel

    init(viewModel: ChooseAssetsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ResultStateViewBuilder(result: self.viewModel.assetsDisplayable)
            .setLoadingView {
                self.buildMainView(displayable: ChooseAssetsDisplayable.loadingDisplayable)
            }
            .buildContent { displayable in
                self.buildMainView(displayable: displayable)
            }
            .alert(alertContext: self.$viewModel.alertContext)
    }

    @ViewBuilder private func buildMainView(displayable: ChooseAssetsDisplayable) -> some View {
        VStack(spacing: 0) {
            self.buildAssets(displayable: displayable)
            StyledDivider().padding(.horizontal)
            self.buildPersonalAssetsSection()
        }
    }

    @ViewBuilder
    private func buildPersonalAssetsSection() -> some View {
        VStack(spacing: 0) {
            SectionHeaderView(title: Labels.personalAssetsSectionTitle)
                .padding(.horizontal)
            switch self.viewModel.authorisationState {
            case .unknown, .denied:
                AssetPermissionRequestView {
                    self.viewModel.handlePermissionsRequest()
                }.padding(.horizontal)
            case .permitted(let assets):
                self.buildPersonalAssetsPermittedSection(assets: assets)
            }
        }
        .frame(height: Constants.personalAssetsSectionHeight)
        .unredacted()
    }

    @ViewBuilder
    private func buildPersonalAssetsPermittedSection(assets: [PHAsset]) -> some View {
        PersonalAssetsCarousel(shouldShowCameraPreview: self.viewModel.shouldShowCameraPreview,
                               onCameraPreviewTapped: self.viewModel.didTapCameraPreview,
                               assets: assets,
                               fetchItemForAsset: { self.viewModel.getItem(for: $0, size: Constants.personalAssetsSize) },
                               isAssetSelected: { self.viewModel.selectedAssetIds.contains($0.id) },
                               onTapAsset: { self.viewModel.didTapItem(item: $0) })
    }

    @ViewBuilder
    private func buildAssets(displayable: ChooseAssetsDisplayable) -> some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                let smallItemWidth = (proxy.size.width-Constants.itemsSpacing*2)/3
                let smallItemHeight = smallItemWidth*0.78
                let smallAssetSize = CGSize(width: smallItemWidth, height: smallItemHeight)
                Group {
                    if let heroAsset = displayable.heroAsset {
                        VStack(spacing: Constants.itemsSpacing) {
                            self.buildHeroAssetSection(heroAsset: heroAsset,
                                                       smallAssets: Array(displayable.assets.prefix(2)),
                                                       smallAssetSize: smallAssetSize)
                            self.buildSmallAssetsSection(smallAssets: Array(displayable.assets.dropFirst(2)),
                                                         smallAssetSize: smallAssetSize)
                        }
                    } else {
                        self.buildSmallAssetsSection(smallAssets: displayable.assets, smallAssetSize: smallAssetSize)

                    }
                }.padding(.vertical)
            }
        }.padding(.horizontal)
    }

    @ViewBuilder
    private func buildHeroAssetSection(heroAsset: ChooseAssetsItem,
                                       smallAssets: [ChooseAssetsItem],
                                       smallAssetSize: CGSize) -> some View {
        HStack(alignment: .top, spacing: Constants.itemsSpacing) {
            self.buildAsset(item: heroAsset,
                            width: smallAssetSize.width*2+Constants.itemsSpacing,
                            height: smallAssetSize.height*2+Constants.itemsSpacing)
            VStack(spacing: Constants.itemsSpacing) {
                ForEach(smallAssets) { item in
                    self.buildAsset(item: item, width: smallAssetSize.width, height: smallAssetSize.height)
                }
            }
        }
    }

    @ViewBuilder
    private func buildSmallAssetsSection(smallAssets: [ChooseAssetsItem], smallAssetSize: CGSize) -> some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
        LazyVGrid(columns: columns, spacing: Constants.itemsSpacing) {
            ForEach(smallAssets) { item in
                self.buildAsset(item: item, width: smallAssetSize.width, height: smallAssetSize.height)
            }
        }
    }

    @ViewBuilder
    private func buildAsset(item: ChooseAssetsItem, width: Double, height: Double) -> some View {
        AssetView(item: item,
                  isSelected: self.viewModel.selectedAssetIds.contains(item.id),
                  contentMode: .fit,
                  onTap: { self.viewModel.didTapItem(item: item) })
        .frame(width: width, height: height)
        .asImageBackground()
    }
}

private extension ChooseAssetsDisplayable {
    static let loadingDisplayable = ChooseAssetsDisplayable(
        assets: (0..<9).map { _ in
            ChooseAssetsItem(id: UUID().uuidString, asset: .image(source: .loadingPlaceholder))
        },
        heroAsset: nil,
        selectedAssetsIds: [])
}
