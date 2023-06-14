// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class AppointmentsRoutes: NSObject, RouteRegistering {
    /// Registers all appointments routes.
    /// - Parameter registry: a `SceneRegistry` to register the routes onto.
    static func registerRoutes(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: BookAppointmentRouteDescriptor) in
            return BookAppointmentScene(clientId: descriptor.clientId, onDone: descriptor.onDone)
        }

        registry.registerScene { (descriptor: ConfirmBookAppointmentRouteDescriptor) in
            return ConfirmAppointmentScene(appointment: descriptor.appointment,
                                           actionType: .create,
                                           onDone: descriptor.onDone)
        }

        registry.registerScene { (descriptor: ConfirmDeleteAppointmentRouteDescriptor) in
            return ConfirmAppointmentScene(appointment: descriptor.appointment,
                                           actionType: .delete,
                                           onDone: descriptor.didCancel)
        }

        registry.registerScene { (descriptor: AppointmentDetailsRouteDescriptor) in
            return AppointmentDetailsScene(appointmentId: descriptor.appointmentId, shouldAllowClient360Navigation: descriptor.shouldAllowClient360Navigation)
        }

        registry.registerScene { (_: AppointmentsRouteDescriptor) in
            return AppointmentsScene()
        }

        registry.registerScene { (descriptor: EditAppointmentRouteDescriptor) in
            return EditAppointmentScene(appointmentId: descriptor.appointmentId,
                                        didCancel: descriptor.didCancel)
        }

        registry.registerScene { (descriptor: AppointmentsFiltersRouteDescriptor) in
            return FiltersScene(selectedFilters: descriptor.selectedFilters,
                                filters: descriptor.filters,
                                title: MKLocalizedString("appointments.filters.navigation-bar.title",
                                                         comment: "The title for the navigation bar in the filters screen for appointments"),
                                doneButtonTitle: MKLocalizedString("appointments.filters.navigation-bar.done.title",
                                                                   comment: "The title for the done button in the navigation bar"),
                                onDone: descriptor.onDone)
        }
    }
}
