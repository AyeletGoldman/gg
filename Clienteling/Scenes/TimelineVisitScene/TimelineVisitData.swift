// Kenzo Clienteling
// 20/01/2022

import MaisonKit
import SwiftUI

struct TimelineVisitData {
    
    private enum Labels {
        static let comment = MKLocalizedString("timeline-visit.fields.comment.title",
                                               comment: "The title for the comment field in timeline visit form")
        
        static let commentPlaceholder = MKLocalizedString("timeline-visit.fields.comment.placeHolder",
                                                          comment: "The placeHolder for the comment in timeline visit form")
        
        static let date = MKLocalizedString("timeline-visit.fields.date.title",
                                            comment: "The title for the date field in timeline visit form")
        
        static let datePlaceholder = MKLocalizedString("timeline-visit.fields.date.placeHolder",
                                                       comment: "The placeHolder for the date field in timeline visit form")
    }
    
    var date: Date? = Date()
    var comment: String = ""
    let clientId: String
    
    init(clientId: String) {
        self.clientId = clientId
    }
    
    func getFields() -> [GFField<TimelineVisitData>] {
        return [.dateCalendar(title: Labels.date,
                              placeHolder: Labels.datePlaceholder,
                              validator: .required,
                              keyPath: \TimelineVisitData.date),
                .textArea(title: Labels.comment,
                          placeHolder: Labels.commentPlaceholder,
                          validator: .required,
                          keyPath: \TimelineVisitData.comment)
        ]
    }
}
