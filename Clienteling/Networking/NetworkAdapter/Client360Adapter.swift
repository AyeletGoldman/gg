// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import MaisonKit
import StylableSwiftUI

extension NetworkAdapter: Client360Adapter {
    
    func confirmTimelineItem(interactionID: String, action: TimelineEntryConfirmationAction) -> VoidResultPublisher {
        return Just(.success(()))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getClientHeader(clientId: String) -> AnyPublisher<Result<Client360Displayable.Header, ErrorDisplayable>, Error> {
        return self.networking
            .clientsControllerFindHeaderOne(clientId: clientId)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response in
                return Client360Displayable.Header(response.data.result)
            }
    }
    
    func getClientDetails(clientId: String) -> AnyPublisher<Result<Client360Displayable.Details, ErrorDisplayable>, Error> {
        return self.networking
            .clientsControllerFindDetailsOne(clientId: clientId)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response in
                return Client360Displayable.Details(response.data.result)
            }
    }
    
    func getKpi(clientId: String) -> AnyPublisher<Result<Client360Displayable.KPI, ErrorDisplayable>, Error> {
        return self.networking
            .clientsControllerFindKpiOne(clientId: clientId)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response in
                return Client360Displayable.KPI(response.data.result)
            }
    }
    
    func getTimeline(clientId: String) -> AnyPublisher<Result<TimelineDisplayable, ErrorDisplayable>, Error> {
        let publisher = updateClientTimeline(for: clientId)
        return publisher
            .mapToResultViewModel { result in
                switch result {
                case .success(let timeline):
                    return TimelineDisplayable(timeline)
                case .failure(let error):
                    throw error
                }
            }
    }
    
    //this function is not used
    func getNotes(clientId: String) -> AnyPublisher<Result<Client360Displayable.Notes, ErrorDisplayable>, Error> {
        return self.networking.clientsControllerFindNotesOne(clientId: clientId)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response in
                return Client360Displayable.Notes(response.data.result)
            }
    }
    
    //this function is not used
    func getPreferences(clientId: String) -> AnyPublisher<Result<Client360Displayable.Preferences, ErrorDisplayable>, Error> {
        return self.networking.clientsControllerFindPreferencesOne(clientId: clientId)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response in
                return Client360Displayable.Preferences(response.data.result)
            }
    }
    
    func getAvailableTimelineActions(clientId: String) -> AnyPublisher<Result<[ContextualAction], ErrorDisplayable>, Error> {
//        return self.networking.clientsControllerFindTimelineActionsOne(clientId: clientId)
//            .mapToResultViewModel { response in
//                return response.data.result.actions.map { self.getTimelineAction($0, clientId: clientId) }
//            }
        
        return self.networking.clientsControllerFindTimelineActionsOne(clientId: clientId)
            .unwrapDefaultSuccessResponse()
            .mapToResultViewModel { response in
                return response.data.result.actions.map { action in
                        return ContextualAction.timelineVisitAction(clientId: clientId,
                                                                    actionType: TimlineActionType(title: action.translationKey,
                                                                                                  id: action.type.rawValue))
                }
            }

    }
    
    func getClientNavigationActions(clientId: String) -> AnyPublisher<[MenuAction], Never> {
        let actions: [MenuAction] = [
            .clientInfoAction(clientId: clientId),
            .noteAndPrefsAction(clientId: clientId)
        ]
        //        if Features.manager.isEnabled(.bookAnAppointment) {
        //            actions.append(.bookAppointmentAction(clientId: clientId))
        //        }
        
        return Just(actions).eraseToAnyPublisher()
    }
    
    func getClientDetailsNavigationActions(clientId: String) -> AnyPublisher<[MenuAction], Never> {
        
        let emptySceneAction = MenuAction(localizedTitle: "Open any screen",
                                          preferredPresentationStyle: .modal,
                                          sceneFactory: { _ in
            return EmptyScene()
        })
        
        let actions: [MenuAction] = [
            MenuAction(localizedTitle: "Apply any action") {
                ToastView.show(text: "Show toast", style: .success)
            },
            emptySceneAction
        ]
        
        return Just(actions).eraseToAnyPublisher()
    }
    
    func getClientIsContactable(clientID: String) -> AnyPublisher<Bool, Error> {
        return self.getClientOutreachChannels(clientID: clientID)
            .map {
                guard let entries = $0.value?.entries else { return false }
                return !entries.isEmpty
            }.eraseToAnyPublisher()
    }
}

extension NetworkAdapter {
    func getTimelineAction(_ timelineAction: ClientTimelineActionsContent, clientId: String) -> ContextualAction {
        let action = ContextualAction(localizedTitle: MKLocalizedString(timelineAction.translationKey,
                                                                        comment: "The translation for a client timeline event's title"),
                                      action: { [weak self] in
            guard let self = self, let type = InteractionPostalCreationMetadata.InteractionPostalCreationMetadataActionType(rawValue: timelineAction.type.rawValue) else { return }
            let createInteractionData = CreateInteractionV2(channel: .email,
                                                            clientId: clientId,
                                                            datetime: ISO8601DateTime(value: Date()),
                                                            metadata: .interactionPostalCreationMetadata(InteractionPostalCreationMetadata(actionType: type, context: .postal)))
            self.networking.interactionsControllerCreate(body: createInteractionData)
                .unwrapDefaultSuccessResponse()
                .mapToViewModel { return $0 }
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        ToastView.show(text: MKLocalizedString("client360.timeline.action.postal.error",
                                                               comment: "The error title for adding postal to client360 timeline"),
                                       style: .error)
                    case .finished:
                        break
                    }
                }, receiveValue: { _ in
                    NotificationCenter.default.post(name: .outreachCompletedSuccessfullyNotification, object: clientId)
                })
                .store(in: &self.cancellables)
        })
        return action
    }
}

// MARK: - Client 360

extension Client360Displayable.Header {
    fileprivate init(_ clientHeaderModel: ClientHeader) {
        self.init(
            clientName: clientHeaderModel.clientName,
            segments: clientHeaderModel.labels?.map { Client360Displayable.HeaderTag(title: $0.value,
                                                                                     variant: $0.type == .primary ? .primary : .secondary) } ?? [],
            additionalInformation: clientHeaderModel.basicInfo?.map {
                TypedField(from: $0, currencyFormatter: .short(withPercision: 1))
            } ?? [],
            isMyCustomer: false)
    }
}

extension Client360Displayable.KPI {
    init(_ kpi: ClientKPI) {
        let items: [KPIDisplayable] = kpi.kpis.compactMap {
            switch $0 {
            case .nPSScoreKPI(let npsScore):
                return .nps(value: npsScore.value.score,
                            maximumValue: npsScore.value.maximumValue,
                            stylistVariant: nil)
            case .typedValue(let value):
                return .typedField(TypedField(from: value, dateFormatter: .short, currencyFormatter: .short))
            }
        }
        self.init(kpiDisplayables: items)
    }
}

extension Client360Displayable.Notes {
    init(_ note: ClientNotes) {
        let notes = note.notes.map { NoteDisplayable(
            id: $0.id,
            advisorNameField: TypedField(value: .text(lines: [$0.advisorName]), icon: "icon-associate"),
            storeNameField: TypedField(value: .text(lines: [$0.storeName]), icon: "icon-location"),
            dateField: MaisonKit.TypedValue.getDateValue(dateString: $0.datetime.value.iso8601withFractionalSeconds, formatter: .default),
            content: $0.content)
        }
        self.init(items: notes)
    }
}

extension Client360Displayable.Preferences {
    init(_ preference: ClientPreferences) {
        let preferences = preference.preferences.map { TypedField(from: $0) }
        self.init(items: preferences)
    }
}

extension Client360Displayable.Details {
    init(_ iClient: ClientDetails) {
            self.init(items: iClient.clientDetails.map {
                let typedFields = $0.items.map { TypedField(from: $0) }
                return FormTypedFieldSection(title: MKLocalizedString($0.title, comment: "Client details section title"), fields: typedFields)
            })
        }
}

extension TimelineDisplayable {
    init(_ timeline: ClientTimelineV2) {
        let sections = Section.buildSections(from: timeline.timeline)
        self = TimelineDisplayable(sections: sections,
                                   filters: Filter.buildFilters(from: sections))
    }
}

extension TimelineDisplayable.Filter {
    // TODO: How do we localize this?
    static func buildFilters(from sections: [TimelineDisplayable.Section]) -> [Self] {
        // Run through all timeline items
        // get the unique types
        // return an array of them
        return sections.flatMap { $0.items }
            .map { $0.filterId }
            .unique()
            .map { id -> TimelineDisplayable.Filter in
                switch id {
                case .outreach:
                    return .outreach
                case .newsletter:
                    return .newsletter
                case .transaction:
                    return .transaction
                case .consultation:
                    return .consultation
                case .importantDate:
                    return .importantDate
                case .action:
                    return .action
                default:
                    return TimelineDisplayable.Filter(id: id,
                                                      name: MKLocalizedString(id.value,
                                                                              comment: "Timeline filter name"))
                }
            }
    }
}

extension ClientTimelineV2.ClientTimelineV2Timeline {
    var type: String? {
        switch self {
        case .timelineInteractionEntry(let interaction):
            return interaction.type.rawValue
        case .timelineTransactionEntry(let transaction):
            return transaction.type.rawValue
        case .timelineNewsletterEntry(let newsletter):
            return newsletter.type.rawValue
        case .timelineAppointmentEntry(let appointment):
            return appointment.type.rawValue
        case .timelineNpsEntry(let nps):
            return nps.type.rawValue
        case .timelineCaseEntry(let caseEntry):
            return caseEntry.type.rawValue
        }
    }
}

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: [Iterator.Element: Bool] = [:]
        return self.filter { seen.updateValue(true, forKey: $0) == nil }
    }
}

extension TimelineDisplayable.Section {
    static func buildSections(from json: [ClientTimelineV2.ClientTimelineV2Timeline]) -> [Self] {
        // Go through all items in the json array of timeline items and
        // for each item decide what section it belongs to, then insert it
        // into that section.
        let sections = json.reduce([Self]()) { acc, next in
            // First make sure the item is parseable, if it's not, skip it
            guard let item = TimelineItemDisplayable(item: next) else {
                return acc
            }
            // make the current accumulator mutable
            var current = acc
            // Create an entry
            let entry = TimelineDisplayable.Entry(item: item)
            // Find the section it's meant to go into if there is one
            if var section = self.getSection(for: next, from: acc) {
                // Add the item to the existing section at the end
                section.items.append(entry)
                // Replace the in the array of sections with the one we just updated
                let index = current.firstIndex(where: { $0.id == section.id })!
                current[index] = section
            } else {
                // If we coudn't find a section, create one with the item in it
                let section = TimelineDisplayable.Section(title: self.getSectionTitle(forItem: next),
                                                          items: [entry])
                current.append(section)
            }
            return current
        }
        return sections
    }
    
    // Get the section for the given item from the array of existing sections
    private static func getSection(for item: ClientTimelineV2.ClientTimelineV2Timeline, from existing: [Self]) -> Self? {
        return self.getSection(withTitle: Self.getSectionTitle(forItem: item), from: existing)
    }
    
    // Get a section from the given list of sections by name
    private static func getSection(withTitle title: String, from existing: [Self]) -> Self? {
        return existing.first {
            $0.title == title
        }
    }
    
    // Get the section title for a given item
    private static func getSectionTitle(forItem item: ClientTimelineV2.ClientTimelineV2Timeline) -> String {
        let datetime: Date = {
            switch item {
            case .timelineInteractionEntry(let interaction):
                return interaction.datetime.value
            case .timelineTransactionEntry(let transaction):
                return transaction.datetime.value
            case .timelineNewsletterEntry(let newsletter):
                return newsletter.datetime.value
            case .timelineAppointmentEntry(let appointment):
                return appointment.startTime.value
            case .timelineNpsEntry(let nps):
                return nps.datetime.value
            case .timelineCaseEntry(let entry):
                return entry.datetime.value
            }
        }()
        let year = Calendar.autoupdatingCurrent.dateComponents([.year], from: datetime).year!
        
        return "\(year)"
    }
}
struct EmptyScene: Scene {
    public func createViewController() -> UIViewController {
        let viewController = UIViewController()
        viewController.title = "Empty screen"
        viewController.view.backgroundColor = .white
        return viewController
    }
    
    public func configure(controller: UIViewController, using factory: SceneFactory) { }
}

struct EmptyRouteDescriptor: RouteDescriptor {
    static var identifier: Identifier = "emptyRouteDescriptor"
}

extension NetworkAdapter {
    @discardableResult
    func updateClientTimeline(for clientID: String) -> AnyPublisher<Result<ClientTimelineV2, ErrorDisplayable>, Never> {
        let publisher = self.networking
            .clientsControllerFindTimelineOne(clientId: clientID)
            .unwrapDefaultSuccessResponse()

        return self.clientTimelineStore.update(objectID: clientID, from: publisher)
    }
}
