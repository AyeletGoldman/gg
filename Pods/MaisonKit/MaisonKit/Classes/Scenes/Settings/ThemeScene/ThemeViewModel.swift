//  Copyright © 2021 LVMH. All rights reserved.

import Combine
import SwiftUI
import Biodag

final class ThemeViewModel: ObservableObject {

    @Published var selectedTheme: ThemeIdentifier?

    private(set) var availableThemes: [ThemeDisplayable.Theme]
    private let onSelectionChanged: (ThemeIdentifier) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(themes: ThemeDisplayable,
         onSelectionChanged: @escaping (ThemeIdentifier) -> Void) {
        self.availableThemes = themes.availableThemes
        self.selectedTheme = themes.selectedThemeIdentifier
        self.onSelectionChanged = onSelectionChanged
        self.observeSelectedTheme()
    }

    private func observeSelectedTheme() {
        self.$selectedTheme
            .compactMap { $0 }
            .dropFirst() // Ignore the initial value
            .sink { [weak self] newTheme in
                self?.onSelectionChanged(newTheme)
        }.store(in: &self.cancellables)
    }
}
