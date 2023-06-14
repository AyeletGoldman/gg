// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import AVFoundation

/// Describes the source of a video. Supported sources are:
/// - A video downloaded from a URL.
public enum VideoSource {
    /// A video source that will allow the video to load from a URL
    case url(URL)
    /// A closure that will produce a video asset for a local file that is already loaded
    case closure((@escaping (AVPlayerItem?) -> Void) -> Void)
}
