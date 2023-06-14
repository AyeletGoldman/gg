// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Photos
import Combine

extension PHPhotoLibrary {
    static func requestAuthorization(for accessLevel: PHAccessLevel) -> AnyPublisher<PHAuthorizationStatus, Never> {
        return Deferred {
            Future { promise in
                PHPhotoLibrary.requestAuthorization(for: accessLevel) { status in
                    promise(.success(status))
                }
            }
        }.eraseToAnyPublisher()
    }
}
