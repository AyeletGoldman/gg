// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import CoreSpotlight
import CoreServices
import Kingfisher

/// An entry point for saving items on the global iOS search (Core Spotlight)
public final class SearchIndex {

    private let spotlightIndex = CSSearchableIndex.default()
    /// An image resizer that will make images smaller before we save them to Core Spotlight
    private let imageDownsampler = DownsamplingImageProcessor(size: CGSize(width: 300, height: 300))

    private let queue = DispatchQueue(label: "maisonkit.search-index.queue", qos: .background)

    /// The default search index
    public static let `default` = SearchIndex()

    /// Adds an item to the search index
    /// - Parameters:
    ///   - item: The `SearchableItem` to add to Core Spotlight
    ///   - onDone: a closure invoked when the we have finished addiing the items to CS.
    ///   Contains a result parameter that will inform you if the adding was successful or not.
    public func add(item: SearchableItem, onDone: ((Result<Void, Error>) -> Void)?) {
        return self.add(items: [item], onDone: onDone)
    }

    /// Adds an array of items to the search index
    /// - Parameters:
    ///   - items: The `SearchableItem`s to add to Core Spotlight
    ///   - onDone: a closure invoked when the we have finished addiing the items to CS.
    ///   Contains a result parameter that will inform you if the adding was successful or not.
    public func add(items: [SearchableItem], onDone: ((Result<Void, Error>) -> Void)?) {
        self.getAllRecords(from: items) { [weak self] records in
            self?.spotlightIndex.indexSearchableItems(records) { error in
                if let error = error {
                    DispatchQueue.main.async {
                        onDone?(.failure(error))
                    }
                } else {
                    DispatchQueue.main.async {
                        onDone?(.success(()))
                    }
                }
            }
        }
    }

    // Asynchronously creates records from `SearchableItem`s
    // It's done asynchronously to try and keep the UI smooth
    private func getAllRecords(from items: [SearchableItem], onDone: @escaping ([CSSearchableItem]) -> Void) {
        self.queue.async {
            let group = DispatchGroup()
            var records: [CSSearchableItem] = []
            for item in items {
                group.enter()
                self.createAttributeSet(for: item) { attributeSet in
                    let record = CSSearchableItem(uniqueIdentifier: item.id.value,
                                                  domainIdentifier: item.domain,
                                                  attributeSet: attributeSet)
                    record.expirationDate = Date.distantFuture // don't let items expire
                    records.append(record)
                    group.leave()
                }
            }

            group.notify(queue: DispatchQueue.main) {
                onDone(records)
            }
        }
    }

    private func createAttributeSet(for item: SearchableItem, onDone: @escaping (CSSearchableItemAttributeSet) -> Void) {
        let attributeSet = CSSearchableItemAttributeSet(contentType: .text)
        attributeSet.displayName = item.localizedName
        attributeSet.title = item.localizedName
        attributeSet.contentDescription = item.localizedDescription
        if let thumbnail = item.thumbnailURL {
            // Image is in the cache, so use the path on the device to grab it
            if ImageCache.default.isCached(forKey: thumbnail.cacheKey) {
                let path = ImageCache.default.cachePath(forKey: thumbnail.cacheKey)
                attributeSet.thumbnailURL = URL(fileURLWithPath: path)
                onDone(attributeSet)
            } else {
                // The image isn't in the cache, download it and use the data from the request.
                _ = KingfisherManager.shared.retrieveImage(with: .network(thumbnail)) { [imageDownsampler, queue] result in
                    queue.async {
                        switch result {
                        case .failure:
                            onDone(attributeSet)
                        case .success(let retrievalResult):
                            // Try to resize the image, if we can, to save space
                            if let resizedImage = imageDownsampler.process(item: ImageProcessItem.image(retrievalResult.image),
                                                                           options: KingfisherParsedOptionsInfo(nil)) {
                                attributeSet.thumbnailData = resizedImage.pngData()
                            } else {
                                attributeSet.thumbnailData = retrievalResult.image.pngData()
                            }
                            onDone(attributeSet)
                        }
                    }
                }
            }
        }
    }
}
