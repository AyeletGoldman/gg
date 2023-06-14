// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

private extension Notification.Name {
    static let resetSwipeCell = Notification.Name("fr.lvmh.maisonkit.notification.swipe-cell-reset")
}

struct SwipeActionModifier: ViewModifier {

    @State private var resetNotice = NotificationCenter.default.publisher(for: .resetSwipeCell)
    @State private var isDragging = false

    struct SwipeActionButtonData {

        fileprivate let id = UUID()
        let action: () -> Void
        let label: AnyView
        let variant: String?

        init<Label: View>(action: @escaping () -> Void, @ViewBuilder label: () -> Label, variant: String? = nil) {
            self.action = action
            self.label = AnyView(label())
            self.variant = variant
        }
    }

    private enum Constants {
        static let minimumValue: CGFloat = 80
    }

    @State private var amountToTranslate: CGFloat = 0
    @State private var isEditing: Bool = false

    private let buttonData: SwipeActionButtonData

    init(buttonData: SwipeActionButtonData) {
        self.buttonData = buttonData
    }

    @ViewBuilder
    private var button: some View {
        HStack {
            Spacer()
            ZStack(alignment: .trailing) {
                StylableGroup(StylistIdentifier.buildFullIdentifier(for: "button-swipe",
                                                                    variant: self.buttonData.variant)) {
                    Color.clear
                        .style("background")
                    Button(action: {
                        self.buttonData.action()
                        self.reset()
                    }, label: {
                        self.buttonData.label.frame(minWidth: Constants.minimumValue,
                                                    maxWidth: Constants.minimumValue,
                                                    maxHeight: .infinity)
                    }).frame(maxHeight: .infinity)
                }
            }
        }.style("background")
    }

    func body(content: Content) -> some View {
        ZStack {
            self.button
                .padding(1)
            content
                .disabled(self.isEditing)
                .offset(x: self.amountToTranslate)
                .highPriorityGesture(self.dragGesture)
                .simultaneousGesture(self.tapGesture)
        }
        .onReceive(self.resetNotice) { notice in
            // Check the notification and see if we need to reset/disable our cell
            let editingID = notice.object as? UUID
            // 1. if there is no cell id, we are not in edit mode and we should swipe back the cell
            if editingID == nil {
                self.isEditing = false
                self.reset()
            } else {
                // 2. if there is a cell id, we are not in edit mode, so the cell should be disabled
                self.isEditing = true
                // 3. if there is a cell id but it's not the currecnt cell id, we should swipe back this cell
                if editingID != self.buttonData.id {
                    self.reset()
                }
            }
        }.applyBackgroundIfNeeded()
    }

    private func reset() {
        withAnimation(.spring(), {
            self.amountToTranslate = 0
        })
    }
}

private extension View {
    @ViewBuilder
    func applyBackgroundIfNeeded() -> some View {
        // I have no idea why this happens, but when we use a LazyVStack (like we do in iOS 16)
        // the view does not update itself when the read/unread status is toggled.
        // Careful!
        if #available(iOS 16, *) {
            self.style("background")
        } else {
            self
        }
    }
}

private extension SwipeActionModifier {
    var dragGesture: some Gesture {
        // Set a minimum distance because `onEnded` doesn't always get called so when you
        // are scrolling a list you will sometimes get a little peek at the background color
        DragGesture(minimumDistance: 20).onChanged { value in
            if !self.isDragging {
                // Tell all other cells that this is the cell that is now active
                NotificationCenter.default.post(name: .resetSwipeCell, object: self.buttonData.id)
            }
            self.isDragging = true

            guard value.translation.width < 0 else {
                self.reset()
                return
            }

            self.amountToTranslate = value.translation.width
        }.onEnded { value in
            self.isDragging = false
            guard value.translation.width < 0 else {
                NotificationCenter.default.post(name: .resetSwipeCell, object: nil)
                return
            }
            withAnimation(.spring(), {
                self.amountToTranslate = (abs(value.translation.width) > Constants.minimumValue) ? -Constants.minimumValue : 0
            })
        }
    }

    var tapGesture: some Gesture {
        TapGesture().onEnded {
            NotificationCenter.default.post(name: .resetSwipeCell, object: nil)
        }
    }
}
