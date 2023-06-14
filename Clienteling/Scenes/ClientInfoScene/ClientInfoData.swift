//
//  ClientInfoData.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 12/01/2022.
//

import Foundation
import MaisonKit

struct FieldsSection {
    let title:String?
    let typedValues: [TypedValue]
}

class ClientInfoData: GeneralInfoData {

    @Published var fields: ResultState<[GFField<ClientInfoData>], ErrorDisplayable> = .waiting
    let clientId: String
    private var mockString = ""

    init(clientId: String) {
        self.clientId = clientId
    }

    func setFields(fields: [FieldsSection]) {
        var allFields: [GFField<ClientInfoData>] = []
        for section in fields {
            if let title = section.title , title != "" {
                allFields.append(.section(title: MKLocalizedString(title,comment: "")))
            }
            allFields = allFields + Self.getFields(typedValues: section.typedValues, data: self)
        }
        self.fields = .found(allFields)
    }
    
    func setLoadingFields()  {
        self.fields = .loading([
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .section(title: ""),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .section(title: ""),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString),
            .text(title: "Mock title", keyPath: \.mockString)
        ])
    }
}
