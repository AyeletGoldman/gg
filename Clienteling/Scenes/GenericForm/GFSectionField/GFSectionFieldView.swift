//
//  GFSectionFiledView.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 02/01/2022.
//

import SwiftUI
import MaisonKit
import StylableSwiftUI

struct GFSectionFieldView: View {
    
    private let title: String
    private let buttonsData: [ButtonData]
    
    init(title: String, buttonsData: [ButtonData]) {
        self.title = title
        self.buttonsData = buttonsData
    }
    
    var body: some View {
        SectionHeaderView(title: title, utilityViews: {
            ForEach(self.buttonsData) { buttonData in
                TertiaryButton(buttonData: buttonData)
            }
        })
            .addStyledRowDivider()
            .padding(.horizontal)
            .padding(.top, 15)
    }
}

struct GFSectionFieldView_Previews: PreviewProvider {
    static var previews: some View {
        GFSectionFieldView(title: "Preferences",
                           buttonsData: [ButtonData(label: "Edit", action: {})])
            .environmentObject(Stylist.unstyled)
    }
}
