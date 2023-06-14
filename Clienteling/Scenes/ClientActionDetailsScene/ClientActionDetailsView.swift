//
//  ClientActionDetailsView.swift
//  Zenith Clienteling
//

import SwiftUI
import StylableSwiftUI
import MaisonKit

struct ClientActionDetailsView: View {

    let actionContent: String

    var body: some View {
        ScrollView {
            Text(self.actionContent)
                .style("input/title")
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(nil)
                .padding()
                .padding(.top, 10)
        }
    }
}
