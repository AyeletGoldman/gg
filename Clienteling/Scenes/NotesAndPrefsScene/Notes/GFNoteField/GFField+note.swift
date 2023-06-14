//
//  GFField+note.swift
//  Zenith Clienteling
//
//  Created by Noy Barak on 25/04/2022.
//

import SwiftUI
import MaisonKit

extension GFField {
    
    static func note(note: Note,
                     editAction: @escaping () -> Void,
                     deleteAction: @escaping () -> Void) -> GFField {

        return GFField(validationClosure: nil) { object, _ in
            GFNoteFieldView(item: note, editAction: editAction, deleteAction: deleteAction)
        }
    }
}
