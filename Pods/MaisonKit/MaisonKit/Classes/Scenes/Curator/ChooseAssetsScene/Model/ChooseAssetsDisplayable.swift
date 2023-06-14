// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The asset id type in Choose Assets screen
public typealias ChooseAssetsItemID = String

/// The asset item in `ChooseAssetsDisplayable`
public struct ChooseAssetsItem: Identifiable {
    /// The asset identifier to identify the selected assets
    public let id: ChooseAssetsItemID
    /// The asset image source
    public let asset: MediaType

    /// Creates a new `ChooseAssetsItem`
    /// - Parameters:
    ///   - id: The asset identifier to identify the selected assets
    ///   - asset: The asset image source
    public init(id: ChooseAssetsItemID, asset: MediaType) {
        self.id = id
        self.asset = asset
    }
}

/// A representation of an object to be displayed in Choose Assets screen
public struct ChooseAssetsDisplayable {
    /// The assets options to choose
    public let assets: [ChooseAssetsItem]
    /// Optional. A prominent asset to display in the top-left corner of the asset selection.
    public let heroAsset: ChooseAssetsItem?
    /// The selected assets IDs.  If these are set, the assets that match the IDs in this array will be pre-selected when the scene appears.
    public let selectedAssetsIds: [String]

    /// Creates a new `ChooseAssetsDisplayable`
    /// - Parameters:
    ///   - assets: The assets options to choose
    ///   - heroAsset: Optional. A prominent asset to display in the top-left corner of the asset selection.
    ///   - selectedAssetsIds: The selected assets IDs.  If these are set, the assets that match the IDs in this array will be pre-selected when the scene appears.
    public init(assets: [ChooseAssetsItem], heroAsset: ChooseAssetsItem? = nil, selectedAssetsIds: [ChooseAssetsItemID]) {
        self.assets = assets
        self.heroAsset = heroAsset
        self.selectedAssetsIds = selectedAssetsIds
    }
}
