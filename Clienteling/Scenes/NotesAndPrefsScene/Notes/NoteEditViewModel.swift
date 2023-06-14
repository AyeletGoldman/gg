//
//  NotesEditViewModel.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 17/01/2022.
//

import MaisonKit
import Combine
import SwiftUI
import Biodag

public enum NoteContent {
    case create(clientId: String)
    case edit(noteId: String, content: String)
}

class NoteEditViewModel: ObservableObject {
    
    private enum Labels {
        static let saveErrorAlertTitle = MKLocalizedString("client360.note-form.save.error.title",
                                                           comment: "Title for alert shown when saving a note fails")
        static let saveErrorAlertMessageFormat = MKLocalizedString("client360.note-form.save.error.message",
                                                                   comment: "Message for alert shown when saving a note fails")
        static let navBarTitleEdit = MKLocalizedString("client360.note-form.edit.navigationBar.title",
                                                       comment: "Title for the edit note form")
        static let navBarTitleCreate = MKLocalizedString("client360.note-form.create.navigationBar.title",
                                                         comment: "Title for the create note form")
    }
    
    let note: NoteContent
    @Published private(set) var isSaving = false
    @Published public private(set) var isValidForm = false
    
    @Published var alertContext: AlertContext?
    @Published var newContent: String  = ""
    
    let onDone: (_ didSave: Bool) -> Void
    private var cancellables = Set<AnyCancellable>()
    
    @Inject private var client360InfoAdapter: Client360InfoAdapter
    
    var navBarTitle: String  {
        get {
            switch note {
            case .create:
                return Labels.navBarTitleCreate
            case .edit:
                return Labels.navBarTitleEdit
            }
        }
    }

    init(note: NoteContent, onDone: @escaping (_ didSave: Bool) -> Void){
        self.note = note
        self.onDone = onDone
        
        if case .edit(_, let content) = note {
            self.newContent = content
        }
        self.setupValidationSubscription()
    }
    
    func closeForm() {
        self.onDone(false)
    }
    
    func saveNote() {
        let result: AnyPublisher<Result<Void, ErrorDisplayable>, Error> = {
            switch self.note {
            case .edit(let noteId, _):
                return self.client360InfoAdapter.editNote(noteId: noteId, content: self.newContent)
            case .create(let clientId):
                return self.client360InfoAdapter.createNote(clientId: clientId,
                                                            content: self.newContent)
            }
        }()
        
        result.handleEvents(receiveSubscription: { [weak self] _ in
            self?.isSaving = true
        }).sink(receiveCompletion: { [weak self] completion in
            self?.isSaving = false
            switch completion {
            case .failure(let error):
                self?.showSavingError(error)
            case .finished:
                self?.onDone(true)
                switch self?.note {
                case .edit(_,_):
                    Analytics.log(EditNoteEvent())
                case .create(_):
                    Analytics.log(CreateNotesEvent())
                case .none:
                    break
                }
            }
        }, receiveValue: { _ in })
            .store(in: &self.cancellables)
    }

    
    private func showSavingError(_ error: Error) {
        let format = Labels.saveErrorAlertMessageFormat
        self.alertContext = AlertContext(
            title: Labels.saveErrorAlertTitle,
            message: String(format: format, error.localizedDescription)
        )
    }

    
    private func setupValidationSubscription() {
        self.$newContent
            .map { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
            .assign(to: &self.$isValidForm)
    }
}
