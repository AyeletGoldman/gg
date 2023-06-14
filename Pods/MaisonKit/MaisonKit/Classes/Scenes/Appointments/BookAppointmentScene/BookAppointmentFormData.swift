// Copyright © 2021 LVMH. All rights reserved.

import Combine

/// The appointment data for building book an appointment form
final class BookAppointmentFormData {

    private enum Labels {
        static let selectClientPageTitle = MKLocalizedString("appointment-form.field.client.select-page-title",
                                                             comment: "The navigation bar title for selecting a client in appointment form client field")
    }

    /// Optional. The client this appointment is booked for.
    var clientId: String?
    /// The client name this appointment is booked for
    var clientName: String?
    /// The appoinement topic
    @Published var topic: SelectionListItem?
    /// The appointment type
    var type: SelectionListItem?
    /// The store this appointment is assosiated for
    @Published var store: SelectionListItem?
    /// The date and slot time this appointment is booked on
    var date: DateAndSlot?
    /// Additional comments for this appointment
    var notes: String = ""

    @Published var fields: [GFField<BookAppointmentFormData>] = []
    @Published var dataOptions: AppointmentFormDataOptions = .init()

    private var cancellables = Set<AnyCancellable>()
    private let disableClientField: Bool

    init(clientId: String? = nil) {
        self.clientId = clientId
        self.disableClientField = clientId != nil
        self.setFields()

        self.$dataOptions
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { _ in
                self.setFields()
            }).store(in: &self.cancellables)
    }

    func setFields() {
        var formFields: [GFField<BookAppointmentFormData>] = [
            .inlineSingleSelection(title: AppointmentFormLabels.topicFieldTitle,
                                   placeHolder: AppointmentFormLabels.topicFieldPlaceholder,
                                   items: self.dataOptions.topicOptions,
                                   validator: .required,
                                   keyPath: \.topic),
            .inlineSingleSelection(title: AppointmentFormLabels.typeFieldTitle,
                                   placeHolder: AppointmentFormLabels.typeFieldPlaceholder,
                                   items: self.dataOptions.typeOptions,
                                   validator: .required,
                                   keyPath: \.type),
            .inlineSingleSelection(title: AppointmentFormLabels.storeFieldTitle,
                                   placeHolder: AppointmentFormLabels.storeFieldPlaceholder,
                                   items: self.dataOptions.storeOptions,
                                   validator: .required,
                                   keyPath: \.store),
            .dateAndSlot(title: AppointmentFormLabels.dateFieldTitle,
                         placeHolder: AppointmentFormLabels.dateFieldPlaceholder,
                         availableSlotsStatus: self.dataOptions.availableSlotsStatus,
                         validator: .required,
                         editMode: self.store != nil ? .editable : .disabled,
                         keyPath: \.date),
            .textArea(title: AppointmentFormLabels.notesFieldTitle,
                      placeHolder: AppointmentFormLabels.notesFieldPlaceholder,
                      keyPath: \.notes)
        ]

        if !self.disableClientField {
            formFields.insert(self.getClientField(), at: 0)
        }

        self.fields = formFields
    }

    private func getClientField() -> GFField<BookAppointmentFormData> {
        return .selectClient(fieldTitle: AppointmentFormLabels.clientFieldTitle,
                             searchPageTitle: Labels.selectClientPageTitle,
                             clientName: self.clientName ?? "",
                             placeHolder: AppointmentFormLabels.clientFieldPlaceholder) { selectedClient in
            if let selectedClient = selectedClient {
                self.clientId = selectedClient.id
                self.clientName = selectedClient.name
                self.setFields()
            }
        }
    }
}

/// The appointment data field options for building book an appointment form
struct AppointmentFormDataOptions {
    /// The selection options for topic field
    var topicOptions: PicklistOptionsStatus
    /// The selection options for appointment type field
    var typeOptions: PicklistOptionsStatus
    /// The selection options for store field
    var storeOptions: PicklistOptionsStatus
    /// The available slots data options status
    var availableSlotsStatus: AvailableSlotsStatus

    /// Create a new AppointmentFormDataOptions
    /// - Parameters:
    ///   - topicOptions: The selection options for topic field
    ///   - typeOptions: The selection options for appointment type field
    ///   - storeOptions: The selection options for store field
    ///   - availableSlotsStatus: The available slots data options status
    init(topicOptions: PicklistOptionsStatus,
         typeOptions: PicklistOptionsStatus,
         storeOptions: PicklistOptionsStatus,
         availableSlotsStatus: AvailableSlotsStatus) {
        self.topicOptions = topicOptions
        self.typeOptions = typeOptions
        self.storeOptions = storeOptions
        self.availableSlotsStatus = availableSlotsStatus
    }

    init() {
        self.topicOptions = .waiting
        self.typeOptions = .waiting
        self.storeOptions = .waiting
        self.availableSlotsStatus = .waiting
    }
}
