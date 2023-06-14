//  Copyright © 2022 LVMH. All rights reserved.

import Combine
import Biodag

final class TimelineClientEventViewModel: GenericFormViewModel<AnyFormData> {

    private enum Labels {
        static let deleteConfirmationAlertTitle = MKLocalizedString("timeline-client-event.delete-confirmation-alert.title",
                                                                    comment: "The title of the confirmation alert when taping to delete an event")
        static let deleteConfirmationAlertMessage = MKLocalizedString("timeline-client-event.delete-confirmation-alert.message",
                                                                      comment: "The message of the confirmation alert when taping to delete an event")
        static let deleteConfirmationAlertButton = MKLocalizedString("timeline-client-event.delete-confirmation-alert.button-title",
                                                                     comment: "The button title of the confirmation alert when taping to delete an event")
    }

    private let router: TimelineClientEventRouter
    let mode: TimelineClientEventSceneMode
    private let eventType: TimelineClientEventType
    private var clientIDResult: ResultState<String, Never> = .waiting
    let onDismiss: (() -> Void)?

    @Inject private var adapter: TimelineClientEventAdapter
    private var fetchTask: Task<Void, Never>?
    @Published private(set) var isDeleting = false
    @Published private(set) var isDeleted = false

    var pageTitle: String {
        self.eventType.title
    }

    var isDeletable: Bool {
        if case .edit(_, let allowDelete, _, _) = self.mode {
            return allowDelete
        } else {
            return false
        }
    }

    init(mode: TimelineClientEventSceneMode,
         eventType: TimelineClientEventType,
         router: TimelineClientEventRouter,
         onDismiss: (() -> Void)?) {
        self.mode = mode
        self.eventType = eventType
        self.router = router
        self.onDismiss = onDismiss
        super.init(data: AnyFormData(data: [:]), isReadOnly: !mode.isEditMode, router: router)
    }

    func fetchEventFields() {
        self.sections = .loading(nil)
        let stream = self.adapter.getTimelineClientEventFields(mode: self.mode,
                                                               eventTypeID: self.eventType.id).values
        let task = Task { @MainActor [weak self] in
            do {
                for try await result in stream {
                    let displayable = try result.getValue()
                    self?.sections = .found(displayable.form.sections)
                    self?.data = displayable.form.data
                    self?.clientIDResult = .found(displayable.clientID)
                }
            } catch {
                let errorDisplayable = error as? ErrorDisplayable ?? ErrorDisplayable(error)
                self?.sections = .failed(errorDisplayable)
            }
        }
        self.fetchTask = task
    }

    func didTapEdit() {
        if case .read(let eventID, let allowDelete, _) = self.mode {
            self.router.presentEditEvent(
                eventID: eventID,
                eventType: self.eventType,
                allowDelete: allowDelete,
                onEditSuccess: self.fetchEventFields,
                onDeleteSuccess: { [weak self] in
                    self?.isDeleted = true
                })
        }
    }

    func didTapSave() {
        guard let clientID = self.clientIDResult.value else { return }
        let publisher: AnyPublisher<Result<Void, ErrorDisplayable>, Error>? = {
            switch self.mode {
            case .create:
                return self.adapter.createTimelineClientEvent(clientID: clientID,
                                                              eventTypeID: self.eventType.id,
                                                              data: self.data)
            case .edit(let eventID, _, _, _):
                return self.adapter.updateTimelineClientEvent(eventID: eventID,
                                                              eventTypeID: self.eventType.id,
                                                              clientID: clientID,
                                                              data: self.data)
            case .read:
                return nil
            }
        }()
        guard let publisher else {
            return
        }
        self.isSaving = true
        Task { @MainActor [weak self] in
            do {
                _ = try await publisher.values.first { _ in true }
                if case .edit(_, _, let onEditSuccess, _) = self?.mode {
                    onEditSuccess()
                }
                self?.onDismiss?()
            } catch {
                self?.isSaving = false
                let errorDisplayable = error as? ErrorDisplayable ?? ErrorDisplayable(error)
                self?.showSavingError(errorDisplayable)
            }
        }
    }

    func presentDeleteConfirmation() {
        let button = AlertContext.Button(title: Labels.deleteConfirmationAlertButton,
                                         style: .destructive(action: self.deleteEvent))
        self.alertContext = AlertContext(
            title: Labels.deleteConfirmationAlertTitle,
            message: Labels.deleteConfirmationAlertMessage,
            primaryButton: button,
            secondaryButton: .cancel()
        )
    }

    private func deleteEvent() {
        guard let clientID = self.clientIDResult.value else { return }
        let publisher: AnyPublisher<Result<Void, ErrorDisplayable>, Error>? = {
            if case .edit(let eventID, _, _, _) = self.mode {
                return self.adapter.deleteTimelineClientEvent(eventID: eventID,
                                                              eventTypeID: self.eventType.id,
                                                              clientID: clientID)
            } else {
                return nil
            }
        }()
        guard let publisher else {
            return
        }
        self.isDeleting = true
        Task { @MainActor [weak self] in
            do {
                _ = try await publisher.values.first { _ in true }
                if case .edit(_, _, _, let onDeleteSuccess) = self?.mode {
                    onDeleteSuccess()
                }
                self?.onDismiss?()
            } catch {
                self?.isDeleting = false
                let errorDisplayable = error as? ErrorDisplayable ?? ErrorDisplayable(error)
                self?.showSavingError(errorDisplayable)
            }
        }
    }
}
