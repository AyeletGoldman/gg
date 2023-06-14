// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct MediaTypeView: View {
    let source: MediaType
    let enableImageZoom: Bool
    let isPreviewMode: Bool

    init(source: MediaType, enableImageZoom: Bool = false, isPreviewMode: Bool = false) {
        self.source = source
        self.enableImageZoom = enableImageZoom
        self.isPreviewMode = isPreviewMode
    }

    var body: some View {
        Group {
            if self.isPreviewMode {
                self.buildThumbnail()
            } else {
                switch self.source {
                case .image(let image):
                    MaisonKitImage(source: image)
                        .pinchToZoom(if: self.enableImageZoom)
                case .video(let video, _):
                    MaisonKitVideo(source: video, isMuted: true)
                }
            }
        }
        .clipped()
    }

    @ViewBuilder
    private func buildThumbnail() -> some View {
        switch source {
        case .video(_, let thumbnailSource):
            self.videoThumbnailView(thumbnailSource: thumbnailSource)
                .overlay(self.videoOverlayView())
        case .image(let thumbnailSource):
            MaisonKitImage(source: thumbnailSource)
        }
    }

    @ViewBuilder
    private func videoThumbnailView(thumbnailSource: ImageSource?) -> some View {
        if let thumbnail = thumbnailSource {
            MaisonKitImage(source: thumbnail)
        } else {
            Color.clear
        }
    }

    @ViewBuilder
    private func videoOverlayView() -> some View {
        MaisonKitImage(source: .styledImage(identifier: "icon-play-video"))
            .frame(width: 40, height: 40)
    }
}

private extension View {
    @ViewBuilder
    func pinchToZoom(if condition: Bool) -> some View {
        if condition {
            self.modifier(PinchToZoom())
        } else {
            self
        }
    }
}
