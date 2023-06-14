// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import Combine
import StylableSwiftUI

// swiftlint:disable:next type_name
final class Client360NotesAndPreferencesViewController: StylableViewController<Client360NotesAndPreferencesView> {

    var viewModel: Client360NotesAndPreferencesViewModel! {
        didSet {
            self.childView = Client360NotesAndPreferencesView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "clients", variant: "profile")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.title
        self.viewModel.fetchNotes()
        self.viewModel.fetchPreferences()
        self.viewModel.logViewAnalytics()
    }
}
