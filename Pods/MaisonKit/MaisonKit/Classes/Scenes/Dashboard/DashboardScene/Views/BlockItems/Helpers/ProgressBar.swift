// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// View to show a progress bar
public struct ProgressBar: View {

    /// An object that holds the value and the color to show in the progress bar.
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

    /// Determines the way in which the progress bar view would show values
    public enum Style {
        /// Drawing a single value on the progress bar.
        /// - Parameter value: the value to show on the progress bar.
        case single(CGFloat)
        /// Drawing several values to be shown on the same progress bar filled relatively to the total
        /// - Parameter values: the array of values to stack on the axis to display a stacked progress bar.
        case multiValue([Value])
    }

    private struct MultiValueBarItem: Identifiable {
        let id: UUID = UUID()
        let valuePercent: CGFloat
        let color: Color
    }

    /// Creates a new `ProgressBar`  with a given `Style`
    /// - Parameter style: the style to use for this progress bar view. `.single` will show a single value,
    /// and `.multiValue` will stack values on the axis.
    public init(style: Style) {
        self.style = style
    }

    private let style: Style

    public var body: some View {
        StylableGroup("graph-bar") {
            GeometryReader { geometry in
                switch self.style {
                case .single(let value):
                    self.buildSingleValue(value: value, proxy: geometry)
                case .multiValue(let values):
                    self.buildMultiValue(values: values, proxy: geometry)
                }
            }
        }
    }

    @ViewBuilder
    private func buildSingleValue(value: CGFloat, proxy: GeometryProxy) -> some View {
        ZStack(alignment: .leading) {
            StylableGroup("graph-item") {
                self.buildValue(valuePercent: 1, proxy: proxy)
            }
            StylableGroup("graph-item[accent]") {
                self.buildValue(valuePercent: value, proxy: proxy)
            }
        }
    }

    private func getMultiValueBarItems(values: [Value]) -> [MultiValueBarItem] {
        let total = values.map(\.value).reduce(0, +)
        var lastValue: Double = 0

        return values.reversed().map { value -> MultiValueBarItem in
            let valuePercent = CGFloat((total-lastValue) / total)
            lastValue += value.value
            return MultiValueBarItem(valuePercent: valuePercent, color: value.color)
        }
    }

    private func buildMultiValue(values: [Value], proxy: GeometryProxy) -> some View {
        ZStack(alignment: .leading) {
            ForEach(self.getMultiValueBarItems(values: values)) { item in
                StylableGroup("graph-item[accent]") {
                    self.buildValue(valuePercent: item.valuePercent, color: item.color, proxy: proxy)
                }
            }
        }
    }

    private func fillWidth(valuePercent: CGFloat, proxy: GeometryProxy) -> CGFloat {
        return min(valuePercent*proxy.size.width, proxy.size.width)
    }

    @ViewBuilder
    private func buildValue(valuePercent: CGFloat, color: Color = .clear, proxy: GeometryProxy) -> some View {
        Rectangle()
            .stroke(lineWidth: 0)
            .frame(width: self.fillWidth(valuePercent: valuePercent, proxy: proxy))
            .overlay(color.style("background"))
    }
}

#if DEBUG
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressBar(style: .single(0)).frame(height: 5)
            ProgressBar(style: .single(0.3)).frame(height: 5)
            ProgressBar(style: .single(1)).frame(height: 5)
            ProgressBar(style: .single(0.4)).frame(height: 20)
            ProgressBar(style: .multiValue([
                .init(value: 100, color: .red),
                .init(value: 50, color: .yellow),
                .init(value: 50, color: .green)
            ])).frame(height: 5)
            ProgressBar(style: .multiValue([
                .init(value: 10, color: .red),
                .init(value: 5, color: .yellow),
                .init(value: 0, color: .green )
            ])).frame(height: 25)
        }.previewLayout(.sizeThatFits)
        .environmentObject(Stylist.progressBarStylist)
    }
}

extension Stylist {
    static var progressBarStylist: Stylist {
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
