// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine
import MaisonKit

extension NetworkAdapter: ProductCuratorAdapter {
    func getProductsPublisher() -> AnyPublisher<[ProductReference], Never> {
        return Just([]).eraseToAnyPublisher()
    }
    
    func contains(reference: ProductReference) -> Bool {
        fatalError()
    }
    
    func addProduct(reference: ProductReference) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        fatalError()
    }
    
    func removeProduct(reference: ProductReference) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        fatalError()
    }
    
    func clear() -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        fatalError()
    }
    
    func fetchProductCuratorActions() -> AnyPublisher<Result<[ButtonAction], ErrorDisplayable>, Error> {
        fatalError()
    }
    
    func getProductDisplayables() -> AnyPublisher<Result<[CuratedProductDisplayable], ErrorDisplayable>, Error> {
        fatalError()
    }
    
    func getProductAssets(reference: ProductReference) -> AnyPublisher<Result<ChooseAssetsDisplayable, ErrorDisplayable>, Error> {
        fatalError()
    }
    
    func updateSelectedProductAssets(reference: ProductReference, assetIds: [ChooseAssetsItemID], personalAssets: [UploadableAsset]) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        fatalError()
    }
    
    func getCuratorClientOutreachChannels(clientID: String) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error> {
        fatalError()
    }
    
    func getCuratorTemplates(clientId: String) -> AnyPublisher<Result<TemplatesDisplayable, ErrorDisplayable>, Error> {
        fatalError()
    }
    
    func createCuratorInteraction(interaction: OutreachInteractionCreation) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        fatalError()
    }
    

}
