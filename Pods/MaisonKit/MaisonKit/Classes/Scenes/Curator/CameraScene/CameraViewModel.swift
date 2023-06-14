// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import UniformTypeIdentifiers
import Photos

final class CameraViewModel {

    private let onMediaSaved: (String) -> Void
    private let onCancel: () -> Void

    init(onMediaSaved: @escaping (String) -> Void, onCancel: @escaping () -> Void) {
        self.onMediaSaved = onMediaSaved
        self.onCancel = onCancel
    }

    func didTapClose() {
        self.onCancel()
    }

    func didFinishTakingMedia(info: [UIImagePickerController.InfoKey: Any]) {
        guard let type = info[.mediaType] as? String,
              let utType = UTType(type) else { return self.onCancel() }

        self.saveMedia(type: utType, info: info) { localIdentifier in
            self.onMediaSaved(localIdentifier)
        }
    }

    private func saveMedia(type: UTType, info: [UIImagePickerController.InfoKey: Any], onDone: @escaping (String) -> Void) {
        let onError: () -> Void = { [weak self] in
            DispatchQueue.main.async {
                self?.onCancel()
            }
        }
        var localID: String?
        PHPhotoLibrary.shared().performChanges({ [weak self] in
            guard let request = self?.createRequest(for: type, info: info) else { return onError() }
            localID = request.placeholderForCreatedAsset?.localIdentifier
        }, completionHandler: { success, _ in
            guard success else { return onError() }
            guard let localID = localID else { return onError() }
            DispatchQueue.main.async {
                onDone(localID)
            }
        })
    }

    private func createRequest(for type: UTType, info: [UIImagePickerController.InfoKey: Any]) -> PHAssetChangeRequest? {
        if type.conforms(to: .image), let image = self.getImage(from: info) {
            return PHAssetChangeRequest.creationRequestForAsset(from: image)
        }
        if type.conforms(to: .movie), let videoURL = info[.mediaURL] as? URL {
            return PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: videoURL)
        }
        return nil
    }

    private func getImage(from info: [UIImagePickerController.InfoKey: Any]) -> UIImage? {
        if let image = info[.editedImage] as? UIImage {
            return image
        }
        if let image = info[.originalImage] as? UIImage {
            return image
        }
        return nil
    }
}
