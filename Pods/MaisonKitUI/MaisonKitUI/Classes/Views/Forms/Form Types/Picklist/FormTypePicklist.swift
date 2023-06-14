// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A form type that shows an inline picklist which uses a `Menu` to display its options.
public struct FormTypePicklist<Selection: Identifiable>: View {

    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.picklistStyle) private var style

    @Binding private(set) var selection: Selection?
    private let options: [Selection]
    private let title: String
    private let titleForSelection: (Selection) -> String
    private let icon: ImageSource?
    private let badge: String?

    /// Creates a new `FormTypePicklist` with the given parameters
    /// - Parameters:
    ///   - selection: a binding of the selected option
    ///   - options: An array of options for selecting.
    ///   - titleForSelection: a closure to get the title to display in the trailing edge of the field for the selected value.
    ///   - title: The title to display in the leading edge of the field.
    ///   - icon: Optional. An icon to display on the leading edge of the label. Defaults to `nil`.
    ///   - badge: Optional. A badge displayed next to the title. Defaults to `nil`.
    public init(selection: Binding<Selection?>,
                options: [Selection],
                titleForSelection: @escaping (Selection) -> String,
                title: String,
                icon: ImageSource? = nil,
                badge: String? = nil) {
        self._selection = selection
        self.options = options
        self.title = title
        self.titleForSelection = titleForSelection
        self.icon = icon
        self.badge = badge
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "form-type-picklist",
                                                            variant: self.isEnabled ? nil : FormTypeState.disabled)) {

            HStack(spacing: 0) {
                if let icon {
                    MaisonKitImage(source: icon)
                        .frame(width: 30, height: 30)
                    Spacer().frame(width: 8)
                }
                PulldownMenu(options: self.options,
                             titleForOption: self.titleForSelection,
                             iconForOption: { option in
                    return self.selection?.id == option.id ? .styledImage(identifier: "icon-check") : nil
                }, onSelectedOption: { option in
                    self.selection = self.selection?.id == option.id ? nil : option
                }, label: {
                    self.menuLabel
                })
            }.padding(.vertical, 2)
        }
    }

    @ViewBuilder
    private var menuLabel: some View {
        self.style.makeBody(configuration: FormTypePicklistStyleConfiguration(
            title: FormTypePicklistStyleConfiguration.Title(text: self.title),
            subtitle: self.selection.map {
                return FormTypePicklistStyleConfiguration.Subtitle(text: self.titleForSelection($0))
            },
            badge: self.badge.map {
                return FormTypePicklistStyleConfiguration.BadgeView(text: $0)
            }))
        .eraseToAnyView()
    }
}

#if DEBUG

struct Option: Identifiable, Hashable {
    let id = UUID()
    let title: String
}

struct FormTypePicklist_Previews: PreviewProvider {

    final class ViewModel: ObservableObject {
        let options = [
            Option(title: "Hello"),
            Option(title: "World"),
            Option(title: "Hello 2"),
            Option(title: "World 2")
        ]
    }

    struct ParentView: View {

        @State private var selection1: Option?
        @State private var selection2: Option?
        @State private var selection3: Option?
        @StateObject private var viewModel = ViewModel()

        var body: some View {
            VStack {
                FormTypePicklist(selection: self.$selection1,
                                 options: self.viewModel.options,
                                 titleForSelection: { selection in
                                     return selection.title
                                 },
                                 title: "Title",
                                 icon: .system(name: "star"),
                                 badge: nil)
                FormTypePicklist(selection: self.$selection2,
                                 options: self.viewModel.options,
                                 titleForSelection: { selection in
                                     return selection.title
                                 },
                                 title: "Title",
                                 icon: .system(name: "star"),
                                 badge: "(2)")
                FormTypePicklist(selection: self.$selection3,
                                 options: self.viewModel.options,
                                 titleForSelection: { selection in
                                     return selection.title
                                 },
                                 title: "Title",
                                 icon: .system(name: "star"),
                                 badge: "2").formTypePicklistStyle(.stacked)
            }
        }
    }

    static var previews: some View {
        ParentView()
            .padding(.horizontal)
            .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
