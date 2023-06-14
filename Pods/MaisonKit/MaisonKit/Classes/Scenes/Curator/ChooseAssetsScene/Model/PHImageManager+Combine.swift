// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine
import Photos

extension PHImageManager {
    func requestImage(for asset: PHAsset) -> AnyPublisher<Data?, Never> {
        return Deferred {
            return Future { promise in
                DispatchQueue.global().async {
                    let options = PHImageRequestOptions()
                    options.isSynchronous = true
                    self.requestImage(for: asset,
                                      targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                      contentMode: .default,
                                      options: options,
                                      resultHandler: { image, _ in
                        DispatchQueue.main.async {
                            promise(.success(image?.jpegData(compressionQuality: 1)))
                        }
                    })
                }
            }
        }.eraseToAnyPublisher()
    }

    func requestVideoData(forVideo asset: PHAsset) -> AnyPublisher<Data?, Never> {
        return Deferred {
            return Future { promise in
                DispatchQueue.global().async {
                    let options = PHVideoRequestOptions()
                    options.isNetworkAccessAllowed = true
                    options.deliveryMode = .mediumQualityFormat
                    self.requestExportSession(forVideo: asset,
                                              options: options,
                                              exportPreset: AVAssetExportPresetMediumQuality) { session, _ in
                        let url = FileManager.default.temporaryDirectory.appendingPathComponent(asset.localIdentifier.replacingOccurrences(of: "/", with: "_"))
                        session?.outputURL = url
                        session?.outputFileType = .mov
                        session?.exportAsynchronously {
                            let data = try? Data(contentsOf: url)
                            DispatchQueue.main.async {
                                promise(.success(data))
                            }
                        }
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}
