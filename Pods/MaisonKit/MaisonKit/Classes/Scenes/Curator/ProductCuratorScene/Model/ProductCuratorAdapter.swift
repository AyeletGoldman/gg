// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// An adapter for product curator
public protocol ProductCuratorAdapter {

    /// Asks the adapter to get a publisher that will emit changes to the products in the curator.
    /// - Returns: A publisher that, when resolved, will return `[ProductReference]`. This publisher cannot error.
    func getProductsPublisher() -> AnyPublisher<[ProductReference], Never>

    /// Asks the adapter whether product exists in the current curator or not
    /// - Parameter reference: the product reference
    /// - Returns: a boolean value indicating whether the current curator contains the given product reference.
    func contains(reference: ProductReference) -> Bool

    /// Asks the adapter to add a product to the current curator
    /// - Parameter reference: the product reference to add to the curator
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `Void` or an `ErrorDisplayable`.
    /// There is no value expected for the success response, as this is managed internally by listening to the publisher returned by `getProductsPublisher()`
    func addProduct(reference: ProductReference) -> VoidResultPublisher

    /// Asks the adapter to remove a product from the current curator
    /// - Parameter reference: the product reference to remove from the curator
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `Void` or an `ErrorDisplayable`.
    /// There is no value expected for the success response, as this is managed internally by listening to the publisher returned by `getProductsPublisher()`
    func removeProduct(reference: ProductReference) -> VoidResultPublisher

    /// Asks the adapter to clear the curator
    /// - Returns: A publisher with a result whether the method has passed successfully or not.
    func clear() -> VoidResultPublisher

    /// Retrieves the actions expected to be shown in the product curator.
    /// - Returns: an array of actions to display in the product curator scene
    func fetchProductCuratorActions() -> AnyPublisher<Result<[ButtonAction], ErrorDisplayable>, Error>

    /// Retrieves the list of products displayed in the curator.
    /// - Returns: an array of curated products by product refrences for showing in the curator screen
    func getProductDisplayables() -> AnyPublisher<Result<[CuratedProductDisplayable], ErrorDisplayable>, Error>

    /// Ask the adapter to get the product assets the user can choose to share
    /// - Parameter reference: the product reference to get the assets for
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `ChooseAssetsDisplayable` or an `ErrorDisplayable`.
    func getProductAssets(reference: ProductReference) -> AnyPublisher<Result<ChooseAssetsDisplayable, ErrorDisplayable>, Error>

    /// Ask the adapter to save the selected product assets the user selected
    /// - Parameters:
    ///   - reference: the product reference to set the selected assets for
    ///   - assetIds: the choosen asset IDs
    ///   - personalAssets: new assets data chosen by the user from their device library
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `Void` or an `ErrorDisplayable`.
    func updateSelectedProductAssets(reference: ProductReference,
                                     assetIds: [ChooseAssetsItemID],
                                     personalAssets: [UploadableAsset]) -> VoidResultPublisher

    /// Asks the adapter to retrieve the available channels for a given client ID.
    /// - Parameter clientID: the client ID whose available channels should be fetched
    /// - Returns: a publisher that, on success, will return a result containing either the required `OutreachSelectionDisplayable` or an error.
    func getCuratorClientOutreachChannels(clientID: String) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error>

    /// Asks the adapter to retrieve the curator templates available for a given curator client
    /// - Parameters:
    ///   - clientId: the client ID to get the templates
    /// - Returns: A publisher that will return either a result with some template data or an error
    func getCuratorTemplates(clientId: String) -> AnyPublisher<Result<TemplatesDisplayable, ErrorDisplayable>, Error>

    /// Tells the adapter to create a curator interaction with the given interaction creation data
    /// - Parameters:
    ///   - interaction: the data to use to create an interaction
    /// - Returns: A publisher that will return either a result with not data to indicate success or an error
    func createCuratorInteraction(interaction: OutreachInteractionCreation) -> VoidResultPublisher
}
