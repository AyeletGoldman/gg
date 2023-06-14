// MH Private Clienteling
// 06/07/2022

import SwiftUI
import StylableSwiftUI

struct TitleStatView: View {
    var text: String
    var body: some View {
        Text(verbatim: self.text)
            .style("title")
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(1)
    }
}

struct SubtitleStatView: View {
    var text: String
    
    var body: some View {
        Text(verbatim: self.text)
            .lineLimit(3)
            .style("subtitle")
    }
}

struct BodyStatView: View {

    var text: String

    var body: some View {
        Text(verbatim: self.text)
            .style("body")
    }
}

struct TitleValueAndSubtitleStatView: View {
    
    struct Data {
        let title: String
        let value: String
        let subtitle: String?
    }
    
    let data: Data
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleStatView(text: self.data.title)
            HStack(alignment: .lastTextBaseline) {
                BodyStatView(text: self.data.value)
                if let subtitle = self.data.subtitle {
                    SubtitleStatView(text: subtitle)
                }
            }
        }
    }
}
