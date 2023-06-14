// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A definition of a media type; usually an image or a video. But perhaps in the future something like audio too.
public enum MediaType {
    /// An image media type, defined by the associated `ImageSource`
    case image(source: ImageSource)
    /// A video media type, defined by a source (`VideoSource`) and a preview/thhumbnail defined by an `ImageSource`
    case video(source: VideoSource, preview: ImageSource?)
}

extension MediaType {
    var thumbnailSource: ImageSource? {
        switch self {
        case .image(let source):
            return source
        case .video(_, let preview):
            return preview
        }
    }
}
