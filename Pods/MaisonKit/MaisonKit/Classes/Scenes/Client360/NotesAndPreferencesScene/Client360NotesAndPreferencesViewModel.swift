// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import Combine
import Biodag

/// A view model to handle the notes and preferences from the `Client360NotesAndPreferencesView`.
final class Client360NotesAndPreferencesViewModel: ObservableObject {

    enum Labels {
        static let defaultNavigationBarTitle =  MKLocalizedString("client360.notes-and-preferences.navigationBar.title",
                                                                  comment: "Title for the client 360 notes and preferences subview navigation bar")
    }

    /// List of various notes regarding the client
    @Published var notes: ResultState<Client360Displayable.Notes, ErrorDisplayable> = .waiting

    /// List of various informations related to the preferences of the client
    @Published var preferences: ResultState<Client360Displayable.Preferences, ErrorDisplayable> = .waiting

    let clientId: String
    let title: String

    @Inject private var client360Adapter: Client360Adapter

    /// Creates a new Client360NotesAndPreferencesViewModel to be used in `Client360NotesAndPreferencesView`
    /// - Parameters:
    ///   - clientId: the ID of the client to show the preferences for
    init(clientId: String) {
        self.title = Labels.defaultNavigationBarTitle
        self.clientId = clientId
    }

    func fetchNotes() {
        self.notes = .loading(nil)
        self.client360Adapter.getNotes(clientId: self.clientId)
            .map(ResultState.fromResult)
            .catch { error in
                return Just(.failed(ErrorDisplayable(error)))
            }
            .assign(to: &self.$notes)
    }

    func fetchPreferences() {
        self.preferences = .loading(nil)
        self.client360Adapter.getPreferences(clientId: self.clientId)
            .map(ResultState.fromResult)
            .catch { error in
                return Just(.failed(ErrorDisplayable(error)))
            }
            .assign(to: &self.$preferences)
    }

    func logViewAnalytics() {
        Analytics.log(NotesAndPreferencesViewedEvent())
    }
}
