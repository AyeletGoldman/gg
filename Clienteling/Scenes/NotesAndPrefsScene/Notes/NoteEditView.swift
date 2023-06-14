//
//  NoteEditView.swift
//  Zenith Clienteling
//
//  Created by Noy Barak on 25/04/2022.
//

import SwiftUI
import StylableSwiftUI
import MaisonKit
import UIKit

struct NoteEditView: View {
    @ObservedObject private var viewModel: NoteEditViewModel

    init(viewModel: NoteEditViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        StylableGroup("input") {
            VStack(spacing: 10) {
                Text(MKLocalizedString("client.notes.disclaimer.title", comment: "disclaimer title"))
                    .style("note[alert]/title")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(MKLocalizedString("client.notes.disclaimer.label", comment: "disclaimer description"))
                    .style("note[alert]/body")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(MKLocalizedString("note.instructions.subtitle", comment: "instructions for the user input"))
                    .style("input/subtitle")
                    .padding(.top, 25)
                    .frame(maxWidth: .infinity, alignment: .leading)
                MultilineTextField("", text: self.$viewModel.newContent)
                    .style("title")
            }
            .disabled(self.viewModel.isSaving)
            .style("background")
            .padding(20)
            .edgesIgnoringSafeArea(.bottom)
            .resignKeyboardOnTapGesture()
        }.alert(alertContext: self.$viewModel.alertContext)
    }
}

struct NoteEditView_Preview: PreviewProvider {
    static var previews: some View {
        NoteEditView(viewModel: .init(note: .create(clientId: ""), onDone: { _ in }))
        .environmentObject(Stylist.create())
    }
}
