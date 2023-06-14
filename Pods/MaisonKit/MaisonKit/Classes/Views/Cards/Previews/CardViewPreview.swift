// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(viewModel: CardViewModel(id: UUID().uuidString,
                                              imageSource: .disk(name: "bw-bg", bundle: Bundle.maisonKit),
                                              topText: "12.01.2019 - 03.31.2020",
                                              title: "WRTW",
                                              subtitle: "54/503 Contacted in this campaign"))
                .previewLayout(.fixed(width: 200, height: 300))
                .environmentObject(Stylist.unstyled)

            CardView(viewModel: CardViewModel(id: UUID().uuidString,
                                              imageSource: .disk(name: "color-bg", bundle: Bundle.maisonKit),
                                              topText: "12.01.2019 - 03.31.2020",
                                              title: "Title",
                                              subtitle: "Subtitle"))
                .frame(width: 200, height: 300)
                .previewLayout(.fixed(width: 200, height: 300))
                .environmentObject(Stylist.cardStylist)
        }
    }
}

private extension Stylist {
    static let cardStylist: Stylist = {
        let stylist = Stylist()

        stylist.addStyle(identifier: "tag/label") {
            $0.font(Font.custom("AvenirNext-Regular", size: 10))
                .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
        }

        stylist.addStyle(identifier: "tag/background") {
            $0.background(Color.blue)
                .frame(alignment: .leading)
                .cornerRadius(2)
        }

        stylist.addStyle(identifier: "title") {
            $0.font(.title)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }

        stylist.addStyle(identifier: "subtitle") {
            $0.font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }

        stylist.addStyle(identifier: "image") {
            $0.cornerRadius(4)
        }

        return stylist
    }()
}
