// MH Private Clienteling
// 28/06/2022

import SwiftUI
import StylableSwiftUI
import MaisonKit

struct GaugeView: View {
    
    struct Value: Identifiable {
        let id = UUID()
        let value: Double // no restrictions on range
        let color: Color
        let title: String
        let subtitle: String
        
        init(value: Double, color: Color, title: String, subtitle: String) {
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
    
    struct Data {
        let title: String
        let value: String?
        let subtitle: String
        let categories: [Value]
        
        init(title: String, value: String?, subtitle: String, categories: [Value]) {
            self.title = title
            self.value = value
            self.subtitle = subtitle
            self.categories = categories.sorted(by: \.value)
        }
    }
    
    let data: Data
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            TitleStatView(text: data.title)
            if let value = data.value {
                BodyStatView(text: value)
            }
            HStack(alignment: .center, spacing: 46) {
                CategoriesStatView(data: .init(categories: self.data.categories.map(\.category)))
                CircularProgressView(style: .multiValue(self.data.categories.map(\.circularProgressValue)), data: .init(lineWidth: 10))
                    .frame(width: 150, height: 150)
                
            }
        }.wrappedInStatView(variant: .circle)
        
    }
}

// MARK: - Connecting GaugeView to AnyStatItemDisplayView
struct GaugeDisplayView: StatItemDisplayView {
    let data: GaugeView.Data
    var isSmallItem: Bool = false
    func makeBody() -> some View {
        GaugeView(data: data)
    }
}

// MARK: - Previews
struct GaugeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GaugeView(data: .init(title: "Colors", value: "Total Colors", subtitle: "sadsa", categories: [
                .init(value: 133, color: .blue, title: "Blue", subtitle: "133"),
                .init(value: 435, color: .red, title: "Red", subtitle: "435"),
                .init(value: 240, color: .yellow, title: "Yellow", subtitle: "240")
            ]))
        }
        .environmentObject(Stylist.create())
    }
}
