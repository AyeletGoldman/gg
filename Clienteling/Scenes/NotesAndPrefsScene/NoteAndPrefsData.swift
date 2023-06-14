//
//  MoreInformationData.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 29/12/2021.
//

import Foundation
import MaisonKit

class NoteAndPrefsData: GeneralInfoData {
    
    private enum Labels{
        static let preferencesSectionTitle = MKLocalizedString("client-information.section.preferences.title",
                                                               comment: "The title for the preferences section in more information form")
        static let clientMoreInfoSectionTitle = MKLocalizedString("client-information.section.additional-information.title",
                                                                  comment: "The title for notes section in notes and preferences form")
    }
    @Published var fields: ResultState<[GFField<NoteAndPrefsData>], ErrorDisplayable> = .waiting
    @Published private(set) var prefsFields: ResultState<[GFField<NoteAndPrefsData>], ErrorDisplayable> = .waiting
    @Published private(set) var notesFields: ResultState<[GFField<NoteAndPrefsData>], ErrorDisplayable> = .waiting
    
    var createNoteAction: ContextualAction?
    var editPrefsAction: ContextualAction?

    var stringValue: String = ""
    let clientId: String
    
    init(clientId: String) {
        self.clientId = clientId
    }
    
    public func setFields(prefsTypedValues: [TypedValue] ,
                          notes: [Note],
                          editNoteAction: @escaping (_ noteId: String, _ content: String) -> Void,
                          deleteNoteAction: @escaping (_ noteId: String) -> Void) {
        let sectionPrefs: GFField<NoteAndPrefsData> = .section(title: Labels.preferencesSectionTitle,
                                                               actions: editPrefsAction.map { [$0] } ?? [])
//        let prefsTypedValues: [IClientDetailsContentItem] = prefsTypedValues.map { .init(editeable: true, field: $0, mandatory: false) }
        let preferencesFields: [GFField<NoteAndPrefsData>] = GeneralInfoData.getFields(typedValues: prefsTypedValues, data: self)
        
        let sectionNotes: GFField<NoteAndPrefsData> = .section(title: Labels.clientMoreInfoSectionTitle,
                                                              actions: createNoteAction.map { [$0] } ?? [])
        let notesFields: [GFField<NoteAndPrefsData>] = notes.map { note in
            GFField.note(note: note, editAction: {
                editNoteAction(note.id, note.content)
            }, deleteAction: {
                deleteNoteAction(note.id)
            })
        }
        
        let allFields = [sectionPrefs] + preferencesFields + [sectionNotes] + notesFields
        self.prefsFields = .found(preferencesFields)
        self.notesFields = .found(notesFields)
        self.fields = .found(allFields)
    }
    
    func setLoadingFields()  {
        self.fields = .loading([
            .section(title: Labels.clientMoreInfoSectionTitle, buttonsData: [.init(label: "Edit", action: { })]),
            .textArea(title: "", keyPath: \NoteAndPrefsData.stringValue),
            .section(title: Labels.preferencesSectionTitle, buttonsData: [.init(label: "Edit", action: { })]),
            .text(title: "Mock title", keyPath: \NoteAndPrefsData.stringValue),
            .text(title: "Mock title", keyPath: \NoteAndPrefsData.stringValue),
            .text(title: "Mock title", keyPath: \NoteAndPrefsData.stringValue),
            .text(title: "Mock title", keyPath: \NoteAndPrefsData.stringValue),
            .text(title: "Mock title", keyPath: \NoteAndPrefsData.stringValue),
            .text(title: "Mock title", keyPath: \NoteAndPrefsData.stringValue),
            .text(title: "Mock title", keyPath: \NoteAndPrefsData.stringValue)
        ])
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = NoteAndPrefsData(clientId: self.clientId)
        copy.setData(from: self)
        copy.prefsFields = self.prefsFields
        copy.notesFields = self.notesFields
        return copy
    }
    
    func copy() -> NoteAndPrefsData {
        return self.copy(with: nil) as! NoteAndPrefsData
    }
}

