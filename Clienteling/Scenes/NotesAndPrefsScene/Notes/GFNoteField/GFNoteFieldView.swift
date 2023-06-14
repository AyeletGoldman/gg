//
//  GFNoteFieldView.swift
//  Zenith Clienteling
//
//  Created by Noy Barak on 25/04/2022.
//

import SwiftUI
import StylableSwiftUI
import MaisonKit

struct GFNoteFieldView: View {
    
    let item: Note
    let editAction: () -> Void
    let deleteAction: () -> Void
    
    var body: some View {
        StylableGroup("input[notes]") {
            VStack(alignment: .leading) {
                HStack {
                    Text(item.dateTime).style("subtitle")
                    Spacer()
                    if self.item.allowDelete {
                        Button(action: self.deleteAction) {
                            MaisonKitImage(source: .styledImage(identifier: "icon-trash"))
                                .frame(width: 20, height: 20, alignment: .topTrailing)
                        }
                    }
                    if self.item.allowEdit {
                        Button(action: self.editAction) {
                            MaisonKitImage(source: .styledImage(identifier: "icon-edit"))
                                .frame(width: 16, height: 16, alignment: .topTrailing)
                        }
                    }
                }
                Text(item.content)
                    .lineLimit(nil)
                    .style("title")
                StylableGroup("info") {
                    HStack {
                        TypedFieldView(typedField: .init(value: .text(lines: [item.advisorName]), icon: iconsByFieldApiName["advisor"]))
                            .style("title")
                        TypedFieldView(typedField: .init(value: .text(lines: [item.store]), icon:  iconsByFieldApiName["store"]))
                            .style("title")
                        Spacer()
                    }
                }
            }
            .padding(.leading, 28)
            .padding(.trailing, 18)
            .padding(.vertical, 16)
            .style("background")
            .addStyledRowDivider()
        }
    }
}

struct NoteCellView_Previews: PreviewProvider {
    static var previews: some View {
        GFNoteFieldView(
            item: Note(
                id: "String",
                dateTime: "Walter White",
                content: "Paris Store",
                store: "September, 10th, 2019",
                advisorName: "Note content text",
                allowDelete: true,
                allowEdit: true
            ),
            editAction: { },
            deleteAction: { }
        ).environmentObject(Stylist())
    }
}
