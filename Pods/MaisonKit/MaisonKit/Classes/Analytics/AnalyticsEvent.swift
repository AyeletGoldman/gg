// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// A set of analytics events. They are all structs to preserve backwards compatibility when we add new events.

struct LoginFailedEvent: EventType {
    var error: Error

    func name(for provider: ProviderType) -> String? {
        return "loginFailed"
    }

    func parameters(for provider: ProviderType) -> [String: Any]? {
        return ["error": self.error.localizedDescription]
    }
}

struct LoginSuccessEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "loginSuccess"
    }
}

struct LogoutEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "logout"
    }
}

struct CreatedClientListEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "clientListCreated"
    }
}

struct ViewedClientListEvent: EventType {
    var listType: String

    func name(for provider: ProviderType) -> String? {
        return "clientListViewed"
    }

    func parameters(for provider: ProviderType) -> [String: Any]? {
        return ["listType": self.listType]
    }
}

struct EditedClientListEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "clientListEdited"
    }
}

struct DeletedClientListEvent: EventType {

    enum Source: String {
        case membersList
        case list
    }

    var source: Source
    func name(for provider: ProviderType) -> String? {
        return "clientListDeleted"
    }

    func parameters(for provider: ProviderType) -> [String: Any]? {
        return ["source": self.source.rawValue]
    }
}

struct SearchPerformedEvent: EventType {

    enum Source: String {
        case clients
        case catalog
        case productCategoryItems
    }

    var source: Source
    var query: String

    func name(for provider: ProviderType) -> String? {
        return "search"
    }

    func parameters(for provider: ProviderType) -> [String: Any]? {
        return ["source": self.source.rawValue, "query": self.query]
    }
}

struct RecentSearchTappedEvent: EventType {

    enum Source: String {
        case clients
        case catalog
    }

    var source: Source
    var query: String

    func name(for provider: ProviderType) -> String? {
        return "recentSearchTapped"
    }

    func parameters(for provider: ProviderType) -> [String: Any]? {
        return ["source": self.source.rawValue, "query": self.query]
    }
}

struct Client360ViewedEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "client360Viewed"
    }
}

struct PersonalInformationViewedEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "clientPersonalInformationViewed"
    }
}

struct NotesAndPreferencesViewedEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "clientNotesAndPreferencesViewed"
    }
}

struct TimelineFilteredEvent: EventType {

    var filters: [String]

    func name(for provider: ProviderType) -> String? {
        return "timelineFiltered"
    }

    func parameters(for provider: ProviderType) -> [String: Any]? {
        return ["filters": self.filters]
    }
}

struct TransactionDetailsViewedEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "clientTimelineTransactionDetailsViewed"
    }
}

struct OutreachActionInvokedEvent: EventType {
    var type: OutreachType

    func name(for provider: ProviderType) -> String? {
        return "outreachActionStarted"
    }

    func parameters(for provider: ProviderType) -> [String: Any]? {
        return ["outreachActionType": self.type.rawValue]
    }
}

struct OutreachActionPerformedEvent: EventType {
    var type: OutreachType
    var templateUsed: String?

    func name(for provider: ProviderType) -> String? {
        return "outreachActionCompleted"
    }

    func parameters(for provider: ProviderType) -> [String: Any]? {
        var params = ["outreachActionType": self.type.rawValue]
        if let template = self.templateUsed {
            params["templateName"] = template
        }
        return params
    }
}
