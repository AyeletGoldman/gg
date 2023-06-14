// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import AVFoundation
import Combine

extension AVCaptureDevice {
    static func requestAccess(for mediaType: AVMediaType) -> AnyPublisher<Bool, Never> {
        return Deferred {
            Future { promise in
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    promise(.success(granted))
                }
            }
        }.eraseToAnyPublisher()
    }
}
