// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct MultiCircularStatBlockView: View {

    public struct Value: Identifiable {
        public let id = UUID()
        let value: CGFloat
        let color: Color
        let title: String
        let body: String
        let icon: ImageSource?

        public init(value: CGFloat, color: Color, title: String, body: String, icon: ImageSource? = nil) {
            self.value = value
            self.color = color
            self.title = title
            self.body = body
            self.icon = icon
        }
    }

    public struct Data {
        let title: String
        let items: [Value]

        public init(title: String, items: [Value]) {
            self.title = title
            self.items = items
        }
    }

    let data: Data

    public var body: some View {
        Group {
            Text(verbatim: self.data.title)
                .style("title")
                .padding(.bottom, 12)
            HStack(alignment: .top) {
                ForEach(self.data.items) { item in
                    self.buildItem(item: item)
                }
            }
            .padding(.bottom, 4)
        }
        .wrappedInStatView(variant: .circle3)
    }

    @ViewBuilder
    private func buildItem(item: Value) -> some View {
        VStack(spacing: 10) {
            CircularProgressView(style: .single(item.value, item.color), data: .init(title: item.icon.flatMap {.icon($0)}))
                .frame(height: 60)
            VStack {
                Text(verbatim: item.title)
                    .style("subtitle")
                Text(verbatim: item.body)
                    .style("body")
            }
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(2)
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

#if DEBUG
struct MultiCircularStatBlockView_Previews: PreviewProvider {
    static var previews: some View {
        MultiCircularStatBlockView(
            data: .init(
                title: "Opt-in Completion rate",
                items: [
                    .init(value: 0.7, color: .red, title: "Phone & SMS", body: "22%", icon: nil),
                    .init(value: 0.4, color: .yellow, title: "IM", body: "32%", icon: nil),
                    .init(value: 0.25, color: .orange, title: "Postal", body: "24%", icon: nil),
                    .init(value: 0.8, color: .green, title: "Email", body: "16%", icon: nil)
                ]))
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
