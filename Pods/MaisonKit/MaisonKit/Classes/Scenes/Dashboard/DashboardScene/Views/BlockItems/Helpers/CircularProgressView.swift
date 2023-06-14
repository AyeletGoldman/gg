// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A circular progress view.
public struct CircularProgressView: View {

    /// An object that holds the value and the color to show in the progress view.
    public struct Value: Identifiable {
        public let id: UUID
        /// The amount of progress of the value. This is a value between 0 and 1.
        public let value: Double
        /// The color to use to draw the progress amount in.
        public let color: Color

        /// Creates a progress view value.
        /// - Parameters:
        ///   - id: The ID for this object. Defaults to `UUID()`.
        ///   - value: The amount of progress of the value. This is a value between 0 and 1.
        ///   - color: The color to use to draw the progress amount in.
        public init(id: UUID = UUID(),
                    value: Double,
                    color: Color) {
            self.id = id
            self.value = value
            self.color = color
        }
    }

    /// Determines the way in which the circular progress view would show values.
    /// - `case single(CGFloat, Color = .clear)` is for a single value.
    /// - `case multiValue([Value])` is for several values to be shown on the same progress view filled relatively to the total.
    public enum Style {
        case single(CGFloat, Color = .clear)
        case multiValue([Value])
    }

    /// Defines the way to represent the title.
    /// - `case text`:  represents title with text.
    /// - `case icon`:  represents title with an image.
    public enum Title {
        case text(String)
        case icon(ImageSource)
    }

    /// An object to determine the way to show the data of the progress view.
    public struct Data {
        /// The width to use to draw the progress view. The default value for this is `5`.
        public let lineWidth: CGFloat
        /// The type of title to use in the progress view.
        public let title: Title?

        /// Creates a new instance of `CircularProgressView.Data`
        /// - Parameters:
        ///   - lineWidth: The width to use to draw the progress view. The default value for this is `5`.
        ///   - title: Optional. The type of title to use in the progress view. Defaults to `nil`.
        public init(lineWidth: CGFloat = 5, title: Title? = nil) {
            self.lineWidth = lineWidth
            self.title = title
        }
    }

    private struct MultiValueItem: Identifiable {
        let id: UUID = UUID()
        let valuePercent: CGFloat
        let color: Color
    }

    let style: Style
    let data: Data

    /// Creates a new `CircularProgressView`.
    /// - Parameters:
    ///   - style: Determines the way in which the circular progress view would show values.
    ///   - data: An object to determine the way to show the data of the progress view. Defaults to `Data()`.
    public init(style: Style, data: Data = Data()) {
        self.style = style
        self.data = data
    }

    public var body: some View {
        ZStack {
            switch self.style {
            case .single(let value, let color):
                self.buildSingleValue(value: value, color: color)
            case .multiValue(let values):
                self.buildMultiValue(values: values)
            }
            self.buildTitle()
            // Double the line width for padding, so it never overlaps
                .padding(.horizontal, self.data.lineWidth * 2)
        }
    }

    @ViewBuilder
    private func buildTitle() -> some View {
        if let title = self.data.title {
            switch title {
            case .text(let text):
                Text(verbatim: text)
                    .style("body")
            case .icon(let icon):
                MaisonKitImage(source: icon)
                    .scaledToFit()
                    .padding(.horizontal)
            }
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private func buildSingleValue(value: CGFloat, color: Color) -> some View {
        Group {
            StylableGroup("graph-item") {
                self.buildValue(valuePercent: 1)
            }
            StylableGroup("graph-item[accent]") {
                self.buildValue(valuePercent: value, color: color)
            }
        }
    }

    private func getMultiValueItems(values: [Value]) -> [MultiValueItem] {
        let total = values.map(\.value).reduce(0, +)
        var lastValue: Double = 0

        return values.reversed().map { value -> MultiValueItem in
            let valuePercent = CGFloat((total-lastValue) / total)
            lastValue += value.value
            return MultiValueItem(valuePercent: valuePercent, color: value.color)
        }
    }

    private func buildMultiValue(values: [Value]) -> some View {
        ForEach(self.getMultiValueItems(values: values)) { item in
            StylableGroup("graph-item[accent]") {
                self.buildValue(valuePercent: item.valuePercent, color: item.color)
            }
        }
    }

    @ViewBuilder
    private func buildValue(valuePercent: CGFloat, color: Color = .clear, from: CGFloat = 0) -> some View {
        color.style("background")
            .mask(Circle()
                .trim(from: from, to: valuePercent)
                .stroke(style: StrokeStyle(lineWidth: self.data.lineWidth,
                                           lineCap: .round,
                                           lineJoin: .round))
                    .rotationEffect(Angle(degrees: 270.0))
                    .padding(ceil(self.data.lineWidth/2)))
            .scaledToFit()
    }
}

#if DEBUG
struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircularProgressView(style: .single(0), data: .init(title: .text("87%")))
            CircularProgressView(style: .single(1), data: .init(title: .text("87%")))
            CircularProgressView(style: .single(0.4), data: .init(title: .text("87%")))
            CircularProgressView(style: .single(0.4, .yellow), data: .init(title: .text("87%")))
            CircularProgressView(style: .multiValue([
                .init(value: 0.4, color: Color.red),
                .init(value: 0.6, color: Color.yellow)
            ]))
        }
        .previewLayout(.fixed(width: 85, height: 85))
        .environmentObject(Stylist.circularProgressStylist)
    }
}

private extension Stylist {
    static var circularProgressStylist: Stylist {
        let stylist = Stylist()
        stylist.addStyle(identifier: "graph/background") { stylableView in
            stylableView.background(Color.blue.opacity(0.3))
        }
        stylist.addStyle(identifier: "graph-item[accent]/background") { stylableView in
            stylableView.background(Color.blue)
        }
        return stylist
    }
}
#endif
