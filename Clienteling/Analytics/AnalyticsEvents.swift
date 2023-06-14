// Zenith Clienteling
// 14/07/2022

import MaisonKit

// MARK: - Preferences Events
struct EditPreferencesEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "NotesPreferences_EditPreferences"
    }
}

struct SavePreferencesEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "NotesPreferences_SavePreferences"
    }
}

struct DeleteNotesEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "NotesPreferences_DeleteNotes"
    }
}

// MARK: - Notes Events
struct CreateNotesEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        "NotesPreferences_CreateNotes"
    }
}

struct EditNoteEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "NotesPreferences_EditNotes"
    }
}

struct OpenMyProfileEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "openMyProfile"
    }
}

struct SaveClientInformationEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "saveClientInformation"
    }
}
 
struct EditClientInformationEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "editClientInformation"
    }
}
 
struct OpenClientInformationEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "openClientInformation"
    }
}
 
struct CreateClientSuccsesEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "createClientSuccses"
    }
}
 
struct CreateClientFailedEvent: EventType {
    func name(for provider: ProviderType) -> String? {
        return "createClientFailed"
    }
}

struct AddToTimelineEvent: EventType {
    var type: String
    func name(for provider: ProviderType) -> String? {
        return "addToTimelineType_\(self.type)"
    }
}
