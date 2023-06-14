// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

final class EditAppointmentFormData {

    var clientName: String = ""
    var topic: String = ""
    var type: String = ""
    var store: String = ""
    var date: DateAndSlot?
    var notes: String = ""

    @Published var fields: [GFField<EditAppointmentFormData>] = []
    @Published var availableSlotsStatus: AvailableSlotsStatus = .waiting

    private var cancellables = Set<AnyCancellable>()

    init() {
        self.setFields()
    }

    private func setFields() {
        self.fields = [
            .text(title: AppointmentFormLabels.clientFieldTitle,
                  editMode: .locked,
                  keyPath: \.clientName),
            .text(title: AppointmentFormLabels.topicFieldTitle,
                  editMode: .locked,
                  keyPath: \.topic),
            .text(title: AppointmentFormLabels.typeFieldTitle,
                  editMode: .locked,
                  keyPath: \.type),
            .text(title: AppointmentFormLabels.storeFieldTitle,
                  editMode: .locked,
                  keyPath: \.store),
            .dateAndSlot(title: AppointmentFormLabels.dateFieldTitle,
                         availableSlotsStatus: self.availableSlotsStatus,
                         keyPath: \.date),
            .textArea(title: AppointmentFormLabels.notesFieldTitle,
                      keyPath: \.notes)
        ]
    }
}
