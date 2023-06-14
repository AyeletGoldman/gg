// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Photos
import Combine

protocol PhotoLibraryAuthorizationProvider {
    func authorizationStatus(for accessLevel: PHAccessLevel) -> PHAuthorizationStatus
    func requestAuthorization() -> AnyPublisher<PHAuthorizationStatus, Never>
}

final class LibraryAuthorizationProvider: PhotoLibraryAuthorizationProvider {
    func authorizationStatus(for accessLevel: PHAccessLevel) -> PHAuthorizationStatus {
        return PHPhotoLibrary.authorizationStatus(for: accessLevel)
    }

    func requestAuthorization() -> AnyPublisher<PHAuthorizationStatus, Never> {
        return Future { promise in
            PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
                promise(.success(status))
            }
        }.eraseToAnyPublisher()
    }
}
