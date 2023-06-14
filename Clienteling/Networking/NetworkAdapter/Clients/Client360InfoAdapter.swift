// Zenith Clienteling
// 27/02/2022

import Combine
import MaisonKit

protocol Client360InfoAdapter {
    func getClientDetails(clientId: String) -> AnyPublisher<Result<ClientDetailsDisplayable, ErrorDisplayable>, Error>
    func saveClientDetails(clientId: String, clientInfo: GeneralInfoData) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error>
    func getNotesAndPreferences(clientId: String) -> AnyPublisher<Result<NotesAndPrefs, ErrorDisplayable>, Error>
    func savePreferences(clientId: String, preferences: GeneralInfoData) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error>
    func createNote(clientId: String, content: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error>
    func editNote(noteId: String, content: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error>
    func deleteNote(noteId: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error>
    func saveTimelineItem(clientId: String, actionType: TimlineActionType, date: Date, comment: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error>
}

extension NetworkAdapter: Client360InfoAdapter {
    func getClientDetails(clientId: String) -> AnyPublisher<Result<ClientDetailsDisplayable, ErrorDisplayable>, Error> {
        return self.networking.clientsControllerFindDetailsOne(clientId: clientId)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response in
               let ArrayWithoutOptin = response.data.result.clientDetails.filter {$0.title != "client.details.section.optin"}
                return ClientDetailsDisplayable(
                    sections: ArrayWithoutOptin.map {
                             FieldsSection(title: $0.title, typedValues: $0.items)
                    },
                    allowEdit: false)
            }
    }
    func getNotesAndPreferences(clientId: String) -> AnyPublisher<Result<NotesAndPrefs, ErrorDisplayable>, Error> {
        let preferencesPublisher = self.networking.clientsControllerFindPreferencesOne(clientId: clientId)
            .unwrapDefaultSuccessResponse()
        let notesPublisher = self.networking.clientsControllerFindNotesOne(clientId: clientId)
            .unwrapDefaultSuccessResponse()
        let dateFormatter = DateFormatter.default
        return Publishers.Zip(preferencesPublisher, notesPublisher)
            .map { (preferencesResponse, notesResponse) -> NotesAndPrefs in
                let notes = notesResponse.data.result.notes.map{ Note(id: $0.id,
                                                                      dateTime: dateFormatter.string(from: $0.datetime.value),
                                                                      content: $0.content,
                                                                      store: $0.storeName,
                                                                      advisorName: $0.advisorName,
                                                                      allowDelete: $0.editable,
                                                                      allowEdit: $0.deleteable) }
                let preferences = preferencesResponse.data.result.preferences
                
                return .init(notes: notes,
                             preferences: preferences,
                             allowCreateNote: true,
                             allowEditPreferences: true)
            }
            .eraseToAnyPublisher()
            .mapToResultViewModel { response in
                return response
            }
    }
    
    func saveTimelineItem(clientId: String,
                          actionType: TimlineActionType,
                          date: Date,
                          comment: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        
        let action: InteractionOutreachActionCreationMetadata.InteractionOutreachActionCreationMetadataAction? = .init(from: .init(rawValue: actionType.id))
        guard let action = action else {
            return Just(.failure(ErrorDisplayable(localizedDescription: "No action found")))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
            
        }
//        let interactionSource = source.map({
//            InteractionOutreachActionCreationMetadata.InteractionOutreachActionCreationMetadataSource(rawValue: $0)
//        })
        
        let interaction = CreateInteractionV2(channel: .action,
                                               clientId: clientId,
                                               datetime: ISO8601DateTime(value: date),
                                               metadata: .interactionOutreachActionCreationMetadata(.init(action: action,
                                                                                                          context: .outreachAction ,
                                                                                                          subject: comment)))
        return self.networking.interactionsControllerCreate(body: interaction)
            .unwrapDefaultSuccessResponse()
            .handleEvents(receiveOutput: { [weak self] _ in
                self?.updateClientTimeline(for: clientId)
            })
            .mapToResultViewModel { _ in }
    }

    func editNote(noteId: String, content: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        networking.notesControllerUpdate(noteId: noteId,
                                         body: ClientNoteEdit(advisorId: MaisonKitUser.currentLoggedInUser?.id ?? "",
                                                              content: content,
                                                              storeId: MaisonKitUser.currentLoggedInUser?.store?.id ?? ""))
        .unwrapDefaultSuccessResponse()
        .mapToResultViewModel { _ in
        }
    }
    
    func createNote(clientId: String, content: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        networking.clientsControllerCreateClient360NotesByClientId(clientId: clientId,
                                                                   body: ClientNoteEdit(advisorId: MaisonKitUser.currentLoggedInUser?.id ?? "",
                                                                                        content: content,
                                                                                        storeId: MaisonKitUser.currentLoggedInUser?.store?.id ?? ""))
        .unwrapDefaultSuccessResponse()
        .mapToResultViewModel(responseMap: { _ in })
    }
    
    func deleteNote(noteId: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        networking.notesControllerDelete(noteId: noteId)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { _ in }
    }
    
    func savePreferences(clientId: String, preferences: GeneralInfoData) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        let preferencesFields = self.getCustomFieldValues(from: preferences)
        return self.networking.clientsControllerPatchOne(clientId: clientId,
                                                         body: CreateClientData(customFields: preferencesFields))
        .unwrapDefaultSuccessResponse()
        .mapToResultViewModel { _ in }
    }
    
    func saveClientDetails(clientId: String, clientInfo: GeneralInfoData) -> AnyPublisher<Result<Void, ErrorDisplayable>, Error> {
        let clientInfoFields = self.getCustomFieldValues(from: clientInfo)
        return self.networking.clientsControllerPatchOne(clientId: clientId , body: CreateClientData(customFields: clientInfoFields))
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { _ in }
    }
}

private extension NetworkAdapter {
    func getCustomFieldValues(from data: GeneralInfoData) -> [CreateClientData.CreateClientDataCustomFields] {
        var clientCustomFields = [CreateClientData.CreateClientDataCustomFields]()
        data.stringValues.forEach { stringValue in
            clientCustomFields.append(.createClientCustomFieldString(CreateClientCustomFieldString(
                name: stringValue.key,
                type: .string,
                value: stringValue.value)))
        }
        data.singleSelectionValues.forEach { singleSelection in
            clientCustomFields.append(.createClientCustomFieldString(CreateClientCustomFieldString(
                name: singleSelection.key,
                type: .string,
                value: singleSelection.value?.id ?? "")))
        }
        data.multiSelectionValues.forEach { multiSelection in
            let ids = multiSelection.value.map { $0.id }.joined(separator: ";")
            clientCustomFields.append(.createClientCustomFieldString(CreateClientCustomFieldString(
                name: multiSelection.key,
                type: .string,
                value: ids)))
        }
        data.booleanValues.forEach { booleanSelection in
            clientCustomFields.append(.createClientCustomFieldBoolean(CreateClientCustomFieldBoolean(
                name: booleanSelection.key,
                type: .boolean,
                value: booleanSelection.value)))
        }
        data.dateValues.forEach { dateSelection in
            guard let date = dateSelection.value else { return }
            clientCustomFields.append(.createClientCustomFieldDate(CreateClientCustomFieldDate(
                name: dateSelection.key,
                type: .date,
                value: UTCDate(value: date))))
        }
        return clientCustomFields
    }
}

extension InteractionOutreachActionCreationMetadata.InteractionOutreachActionCreationMetadataAction {
    init?(from: ClientTimelineActionsContent.ClientTimelineActionsContentType?) {
        switch from {
        case .visit:
            self = .visit
        case .alterationsTailoring:
            self = .alterationsTailoring
        case .preOrder:
            self = .preOrder
        case .booking:
            self = .booking
        case .gift:
            self = .gift
        case .afterSales:
            self = .afterSales
        case .instorePickup:
            self = .instorePickup
        case .delivery:
            self = .delivery
        case .none:
            return nil
        }
    }
}
