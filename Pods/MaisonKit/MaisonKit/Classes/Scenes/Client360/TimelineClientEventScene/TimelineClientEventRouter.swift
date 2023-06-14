//  Copyright © 2022 LVMH. All rights reserved.

public protocol TimelineClientEventRouter: GenericFormRouter {

    /// Presents edit timeline event screen
    /// - Parameters:
    ///   - eventID: the ID of the event to edit.
    ///   - eventType: the event type this event belong to.
    ///   - allowDelete: whether to allow to delete this item or not
    ///   - onEditSuccess: a closure to perform after editing the event.
    ///   - onDeleteSuccess: a closure to perform after deleting the event.
    func presentEditEvent(eventID: String,
                          eventType: TimelineClientEventType,
                          allowDelete: Bool,
                          onEditSuccess: @escaping () -> Void,
                          onDeleteSuccess: @escaping () -> Void)
}

final class DefaultTimelineClientEventRouter: Router<TimelineClientEventViewController>, TimelineClientEventRouter, DefaultGenericFormPresenterRouter {

    func presentEditEvent(eventID: String,
                          eventType: TimelineClientEventType,
                          allowDelete: Bool,
                          onEditSuccess: @escaping () -> Void,
                          onDeleteSuccess: @escaping () -> Void) {
        let descriptor = TimelineClientEventRouteDescriptor(mode: .edit(eventID: eventID,
                                                                        allowDelete: allowDelete,
                                                                        onEditSuccess: onEditSuccess,
                                                                        onDeleteSuccess: onDeleteSuccess),
                                                            eventType: eventType,
                                                            onDismiss: { controller in
            controller.dismiss(animated: true)
        })
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }

}
