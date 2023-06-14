// Copyright © 2022 LVMH. All rights reserved.

/// The route descriptor that is linked to choose assets Scene.
public struct ChooseAssetsRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ChooseAssetsRouteDescriptor"

    /// A closure to get a publisher with assets to choose in Choose Assets screen
    public let getAssetsClosure: GetAssetsClosure

    /// A closure for saving the selected assets in Choose Assets screen
    public let saveSelectedAssetsClosure: SaveSelectedAssetsClosure

    /// A closure to invoke Choose Asset screen on cancel and on success
    public let onClose: (UIViewController) -> Void

    /// Creates a new `ChooseAssetsRouteDescriptor`
    /// - Parameters:
    ///   - getAssetsClosure: A closure to get a publisher with assets to choose in Choose Assets screen
    ///   - saveSelectedAssetsClosure: A closure for saving the selected assets in Choose Assets screen
    ///   - onClose: A closure to invoke Choose Asset screen on cancel and on success
    public init(getAssetsClosure: @escaping GetAssetsClosure,
                saveSelectedAssetsClosure: @escaping SaveSelectedAssetsClosure,
                onClose: @escaping (UIViewController) -> Void) {
        self.getAssetsClosure = getAssetsClosure
        self.saveSelectedAssetsClosure = saveSelectedAssetsClosure
        self.onClose = onClose
    }
}
