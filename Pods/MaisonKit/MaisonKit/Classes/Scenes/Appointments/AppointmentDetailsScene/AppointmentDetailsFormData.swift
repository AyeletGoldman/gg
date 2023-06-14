// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct AppointmentDetailsFormData {

    var clientId: String = ""
    var clientName: String = ""
    var topic: String = ""
    var type: String = ""
    var store: String = ""
    var date: String = ""
    var notes: String = ""

    mutating func setData(displayable: AppointmentDetailsDisplayable) {
        self.clientId = displayable.clientId
        self.clientName = displayable.clientName
        self.topic = displayable.topic.title
        self.type = displayable.type.title
        self.store = displayable.store.title
        self.date = DateAndSlotFormatter().string(for: displayable.date) ?? ""
        self.notes = displayable.notes ?? ""
    }

    func getFields(shouldAllowClient360Navigation: Bool) -> [GFField<AppointmentDetailsFormData>] {
        var clientFields = [GFField<AppointmentDetailsFormData>]()

        if shouldAllowClient360Navigation {
            clientFields.append(
                .text(title: AppointmentFormLabels.clientFieldTitle,
                      value: self.clientName,
                      actionType: .routeDescriptorProvider(routeDescriptorFactory: { _ in
                          Client360RouteDescriptor(clientID: self.clientId, clientName: self.clientName)
                      }, preferredPresentationStyle: .push))
            )
        } else {
            clientFields.append(
                .text(title: AppointmentFormLabels.clientFieldTitle,
                      keyPath: \.clientName)
            )
        }

        clientFields.append(contentsOf: [
                .text(title: AppointmentFormLabels.topicFieldTitle,
                      keyPath: \.topic),
                .text(title: AppointmentFormLabels.typeFieldTitle,
                      keyPath: \.type),
                .text(title: AppointmentFormLabels.storeFieldTitle,
                      keyPath: \.store),
                .text(title: AppointmentFormLabels.dateFieldTitle,
                      keyPath: \.date),
                .textArea(title: AppointmentFormLabels.notesFieldTitle,
                          keyPath: \.notes)
            ]
        )

        return clientFields
    }
}
