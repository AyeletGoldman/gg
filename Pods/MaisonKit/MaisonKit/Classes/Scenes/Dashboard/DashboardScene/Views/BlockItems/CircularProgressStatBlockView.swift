// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct CircularProgressStatBlockView: View {

    public struct Value: Identifiable {
        public let id = UUID()
        let value: Double // no restrictions on range
        let color: Color
        let title: String
        let subtitle: String

        public init(value: Double, color: Color, title: String, subtitle: String) {
            self.value = value
            self.color = color
            self.title = title
            self.subtitle = subtitle
        }

        var category: CategoryDetailStatView.Data {
            return CategoryDetailStatView.Data(color: self.color, title: self.title, subtitle: self.subtitle)
        }

        var circularProgressValue: CircularProgressView.Value {
            return CircularProgressView.Value(value: self.value, color: self.color)
        }
    }

    public struct Data {
        let title: String
        let value: String
        let subtitle: String
        let categories: [Value]

        public init(title: String, value: String, subtitle: String, categories: [Value]) {
            self.title = title
            self.value = value
            self.subtitle = subtitle
            self.categories = categories
        }
    }

    let data: Data

    public var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 3) {
                TitleStatView(text: self.data.title)
                BodyStatView(text: self.data.value)
                Spacer().frame(height: 7)
                SubtitleStatView(text: self.data.subtitle)
            }
            Spacer()
            HStack {
                CategoriesStatView(data: .init(categories: self.data.categories.map(\.category)))
                    .fixedSize()
                CircularProgressView(style: .multiValue(self.data.categories.map(\.circularProgressValue)))
                    .frame(width: 75, height: 75)
            }
        }.wrappedInStatView(variant: .circle2)
    }
}

#if DEBUG
struct CircularProgressStatBlockView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressStatBlockView(
            data: .init(
                title: "Number of clients",
                value: "124",
                subtitle: "Total clients",
                categories: [
                    CircularProgressStatBlockView.Value(
                        value: 0.80, color: .blue, title: "Locals", subtitle: "86"),
                    CircularProgressStatBlockView.Value(
                        value: 0.13, color: .yellow, title: "Tourist", subtitle: "381"),
                    CircularProgressStatBlockView.Value(
                        value: 0.13, color: .red, title: "Pleasure", subtitle: "2")
                ]
            ))
            .previewLayout(.fixed(width: 400, height: 150))
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
