//
//  NoteAndPrefsViewModel.swift
//  Zenith Clienteling Dev

import MaisonKit
import Combine
import SwiftUI
import Biodag

struct Note {
    let id: String
    let dateTime: String
    let content: String
    let store: String
    let advisorName: String
    let allowDelete: Bool
    let allowEdit: Bool
}

struct NotesAndPrefs {
    let notes: [Note]
    let preferences: [TypedValue]
    let allowCreateNote: Bool
    let allowEditPreferences: Bool
}

class NoteAndPrefsViewModel: GenericFormViewModel<NoteAndPrefsData> {
    
    private enum Labels {
        static let editNoteTitle = MKLocalizedString("button.edit-note.title", comment: "Title for edit note button")
        static let createNoteTitle = MKLocalizedString("button.create-note.title", comment: "Title for create note action")
        static let deleteErrorAlertTitle = MKLocalizedString("client360.note-form.delete.error.title",
                                                             comment: "Title for alert shown when deleting a note fails")
        static let deleteErrorAlertMessageFormat = MKLocalizedString("client360.note-form.delete.error.message",
                                                                     comment: "Message for alert shown when deleting a note fails")
        static let deleteConfirmationTitle = MKLocalizedString("client360.note-form.delete.confirmation.title",
                                                               comment: "Title for confirmation dialog for deleting a note")
        static let deleteConfirmationtMessage = MKLocalizedString("client360.note-form.delete.confirmation.message",
                                                                  comment: "Message for alert shown when deleting a note fails")
        static let deleteConfirmationContinue = MKLocalizedString("client360.note-form.delete.continue.button.title",
                                                                  comment: "Continue delete")
    }
    
    private let router: NoteAndPrefsRouter
    let clientId : String
    private var cancellables = Set<AnyCancellable>()

    @Inject private var client360InfoAdapter: Client360InfoAdapter
    
    init(router: NoteAndPrefsRouter, clientId: String) {
        self.router = router
        self.clientId = clientId
        let data: NoteAndPrefsData = .init(clientId: self.clientId)
        super.init(
            resultFieldsDataSource: data.$fields.eraseToAnyPublisher(),
            data: data,
            isReadOnly: true,
            router: router
        )
    }

    override func onAppear() {
        self.featchClientInfo()
    }

    private func featchClientInfo() {
        self.data.setLoadingFields()
        self.fetchNotesAndPreferences()
    }

    private func fetchNotesAndPreferences() {
        self.client360InfoAdapter.getNotesAndPreferences(clientId: self.clientId)
            .catch { error in
                return Just(.failure(ErrorDisplayable(error)))
            }
            .sink(receiveValue: { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure(let error):
                    self.sections = .failed(error)
                case .success(let displayable):
                    self.buildDataActions(allowCreateNote: displayable.allowCreateNote,
                                          allowEditPreferences: displayable.allowEditPreferences)
                    self.data.setFields(prefsTypedValues: displayable.preferences,
                                        notes: displayable.notes,
                                        editNoteAction: self.editNote,
                                        deleteNoteAction: self.deleteNotePressed)
                }
            }).store(in: &self.cancellables)
    }
    
    private func buildDataActions(allowCreateNote: Bool, allowEditPreferences: Bool) {
        if allowCreateNote {
            self.data.createNoteAction = MenuAction(localizedTitle: Labels.createNoteTitle,
                                                    imageIdentifier: "icon-add",
                                                    preferredPresentationStyle: .modal,
                                                    sceneFactory: { onDone in
                return NoteEditScene(note: .create(clientId: self.clientId), onDone: { [weak self] didSave, controller in
                    if didSave {
                        self?.featchClientInfo()
                    }
                    controller.dismiss(animated: true)
                })
            })
        }
        if allowEditPreferences {
            self.data.editPrefsAction = MenuAction(localizedTitle: Labels.editNoteTitle,
                                                   imageIdentifier: "icon-edit",
                                                   preferredPresentationStyle: .modal,
                                                   sceneFactory: { onDone in
                return PrefsEditScene(data: self.data.copy(), onDone: { [weak self] didSave, controller in
                    if didSave {
                        self?.featchClientInfo()
                    }
                    controller.dismiss(animated: true)
                })
            })
        }
    }
    
    private func editNote(noteId: String, content: String) {
        self.router.presentEditNote(NoteContent.edit(noteId: noteId, content: content)) {didSave in
            self.fetchNotesAndPreferences()
        }
    }
    
    private func deleteNotePressed(noteId: String) {
        self.alertContext = AlertContext(
            title: Labels.deleteConfirmationTitle,
            message: Labels.deleteConfirmationtMessage,
            secondaryButton: AlertContext.Button(title: Labels.deleteConfirmationContinue,
                                                 style: .destructive(action: { [weak self] in
                                                     self?.deleteNote(noteId)
                                                 })))
    }
    
    private func deleteNote(_ noteId: String) {
        self.client360InfoAdapter.deleteNote(noteId: noteId)
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.isSaving = true
            })
            .sink(receiveCompletion: {[weak self] completion in
                self?.isSaving = false
                switch completion {
                case .failure(let error):
                    self?.showDeleteError(error)
                case .finished:
                    Analytics.log(DeleteNotesEvent())
                    self?.fetchNotesAndPreferences()
                }
            }, receiveValue: { _ in })
            .store(in: &self.cancellables)
    }
    
    
    private func showDeleteError(_ error: Error) {
        let format = Labels.deleteErrorAlertMessageFormat
        self.alertContext = AlertContext(
            title: Labels.deleteErrorAlertTitle,
            message: String(format: format, error.localizedDescription)
        )
    }
}
