// Copyright © 2021 LVMH. All rights reserved.

import Combine
import Photos

private struct AssetDownload {
    let originalURL: URL
    let data: Data
}

final class AssetDownloader {

    enum AssetDownloaderError: Error {
        case accessDeniedToLibrary
    }

    private var cancellables = Set<AnyCancellable>()

    private let authorizationProvider: PhotoLibraryAuthorizationProvider
    private let dataTaskPublisherProvider: DataTaskPublisherProvider

    init(authorizationProvider: PhotoLibraryAuthorizationProvider = LibraryAuthorizationProvider(),
         dataTaskPublisherProvider: DataTaskPublisherProvider = URLSession.shared) {
        self.authorizationProvider = authorizationProvider
        self.dataTaskPublisherProvider = dataTaskPublisherProvider
    }

    func downloadAndSaveAssets(assetURLs: [URL]) -> AnyPublisher<Bool, Error> {
        return self.manageAuthorization()
            .flatMap { assetURLs.publisher }
            .compactMap { [weak self] url in
                self?.downloadAsset(assetURL: url)
            }
            .flatMap { $0 }
            .collect()
            .compactMap { [weak self] allData in
                return self?.saveAssetsToPhotoLibrary(allData: allData)
            }
            .flatMap { $0 }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    private func manageAuthorization(status: PHAuthorizationStatus? = nil) -> AnyPublisher<Void, Error> {
        let status = status ?? self.authorizationProvider.authorizationStatus(for: .addOnly)

        switch status {
        case .authorized:
            return Just(())
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        case .notDetermined:
            return self.authorizationProvider.requestAuthorization()
                .compactMap { [weak self] status in
                    self?.manageAuthorization(status: status)
                }
                .flatMap { $0 }
                .eraseToAnyPublisher()
        default:
            return Fail(error: AssetDownloaderError.accessDeniedToLibrary)
                .eraseToAnyPublisher()
        }
    }

    private func downloadAsset(assetURL: URL) -> AnyPublisher<AssetDownload, Error> {
        return self.dataTaskPublisherProvider.taskPublisher(for: assetURL)
            .map { AssetDownload(originalURL: assetURL, data: $0.data) }
            .mapError { $0 }
            .eraseToAnyPublisher()
    }

    private func saveAssetsToPhotoLibrary(allData: [AssetDownload]) -> AnyPublisher<Bool, Error> {
        return Future { promise in
            var images = [UIImage]()
            var videoLocalFiles = [URL]()

            do {
                for (index, download) in allData.enumerated() {
                    if let image = UIImage(data: download.data) {
                        images.append(image)
                    } else {
                        let pathExtension = download.originalURL.pathExtension.isEmpty ? "mp4" : download.originalURL.pathExtension
                        let filePath = FileManager.default.temporaryDirectory.appendingPathComponent("\(index).\(pathExtension)")
                        try download.data.write(to: filePath)
                        videoLocalFiles.append(filePath)
                    }
                }
            } catch {
                promise(.failure(error))
            }

            DispatchQueue.main.async {
                PHPhotoLibrary.shared().performChanges {
                    for image in images {
                        PHAssetChangeRequest.creationRequestForAsset(from: image)
                    }
                    for videoLocalFile in videoLocalFiles {
                        PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: videoLocalFile)
                    }
                } completionHandler: { [weak self] (succeeded, error) in
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(succeeded))
                    }
                    self?.deleteVideosFromTemporaryFolder(files: videoLocalFiles)
                }
            }
        }.eraseToAnyPublisher()
    }

    private func deleteVideosFromTemporaryFolder(files: [URL]) {
        for file in files {
            try? FileManager.default.removeItem(at: file)
        }
    }
}
