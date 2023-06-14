// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import CoreGraphics

// FramePreferenceKey used for getting the size for image generation
struct FramePreferenceKey: PreferenceKey, Equatable {
    static var defaultValue: CGRect = .zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

struct SignatureView: View {

    private enum Constants {
        static let signatureStrokeLineWidth = 3.0
    }

    struct Stroke {
        var points: [CGPoint] = [CGPoint]()
    }

    @Binding var image: UIImage?
    @Binding var strokes: [Stroke]

    @State private var drawingBounds: CGRect = .zero
    @State private var currentStroke = Stroke()

    let readOnly: Bool

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if self.isNotDrawable {
                if let image {
                    Image(uiImage: image)
                }
            } else {
                Rectangle()
                    .fill(Color.clear)
                    .style("background")

                // Use a GeometryReader to infer the view size that will then be used for the generated image
                    .background(GeometryReader { geometry in
                        Color.clear.preference(key: FramePreferenceKey.self, value: geometry.frame(in: .local))
                    })
                    .onPreferenceChange(FramePreferenceKey.self) { bounds in
                        self.drawingBounds = bounds
                    }
                    .gesture(
                        DragGesture(minimumDistance: 1)
                            .onChanged({ value in
                                let currentPoint = value.location
                                if self.drawingBounds.contains(currentPoint) {
                                    self.currentStroke.points.append(currentPoint)
                                } else if !self.currentStroke.points.isEmpty {
                                    self.endCurrentStroke()
                                }
                            })
                            .onEnded({ _ in
                                self.endCurrentStroke()
                            })
                    )

                self.signature

                Divider()
                    .padding(.bottom, 5)
            }
        }
    }

    private var signature: some View {
        Path { path in
            for stroke in self.strokes {
                self.addStroke(stroke, toPath: &path)
            }

            self.addStroke(self.currentStroke, toPath: &path)
        }
        .stroke(.primary, style: StrokeStyle(lineWidth: Constants.signatureStrokeLineWidth, lineCap: .round))
    }

    // MARK: - Helpers

    private var isNotDrawable: Bool {
        self.readOnly || (self.strokes.isEmpty && self.image != nil)
    }

    var isEmpty: Bool {
        self.strokes.isEmpty && self.image == nil
    }

    // MARK: - Stroke management

    private func addStroke(_ stroke: Stroke, toPath path: inout Path) {
        guard stroke.points.count > 1 else { return }

        path.move(to: stroke.points[0])

        for index in 1..<stroke.points.count {
            path.addLine(to: stroke.points[index])
        }
    }

    private func endCurrentStroke() {
        self.strokes.append(self.currentStroke)
        self.currentStroke = Stroke()

        self.image = self.bakeImage()
    }

    // MARK: - Resulting image generation

    private func bakeImage() -> UIImage {
        UIGraphicsBeginImageContext(self.drawingBounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
        defer { UIGraphicsEndImageContext() }

        context.setLineWidth(Constants.signatureStrokeLineWidth)
        context.setLineCap(.round)
        context.setStrokeColor(UIColor.black.cgColor)

        for stroke in self.strokes where stroke.points.count > 1 {
            context.move(to: stroke.points[0])

            for index in 1..<stroke.points.count {
                context.addLine(to: stroke.points[index])
            }
        }

        context.strokePath()

        guard let resultImage = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }

        return resultImage
    }
}
