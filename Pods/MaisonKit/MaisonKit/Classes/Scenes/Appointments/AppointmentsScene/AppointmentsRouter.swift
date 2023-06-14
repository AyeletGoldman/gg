// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public protocol AppointmentsRouter: ActionScenePresenterRouter {

    /// Presents the book an appointment scene
    func presentBookAppointment()

    /// Pushes the appointment details onto the navigation stack
    func pushAppointmentDetails()

    /// Presents a set of filters for the available appointments
    /// - Parameters:
    ///   - filters: The set of available filters.
    ///   - selectedFilters: A set of selected filters to initialise the scene with
    ///   - onDone: A closure to invoke when the user has finished filtering and wants to apply the newly selected filters
    func presentAppointmentsFilters(filters: [FilterData], selectedFilters: SelectedFilters, onDone: @escaping (SelectedFilters) -> Void)
}

final class DefaultAppointmentsRouter: Router<AppointmentsViewController>, AppointmentsRouter, DefaultActionScenePresenterRouter {

    func presentBookAppointment() {
        let scene = self.factory.retrieveScene(with: BookAppointmentRouteDescriptor(onDone: { didSave, controller in
            print(didSave)
            controller.dismiss(animated: true)
        }))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }

    func pushAppointmentDetails() {
        let scene = self.factory.retrieveScene(with: AppointmentDetailsRouteDescriptor(appointmentId: UUID().uuidString))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }

    func presentAppointmentsFilters(filters: [FilterData], selectedFilters: SelectedFilters, onDone: @escaping (SelectedFilters) -> Void) {
        let scene = self.factory.retrieveScene(with: AppointmentsFiltersRouteDescriptor(filters: filters,
                                                                                        selectedFilters: selectedFilters,
                                                                                        onDone: { controller, newFilters in
            controller.dismiss(animated: true)
            onDone(newFilters)
        }))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }
}
