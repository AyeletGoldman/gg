//  Copyright © 2022 LVMH. All rights reserved.

public protocol NPSDetailsRouter: ActionScenePresenterRouter {

    /// Request the router to present the client profile from the given client ID.
    /// - Parameter clientID: the ID of the client to show the details for.
    func presentClientProfile(clientID: String)

    /// Request the router to present the detailed answers to the survey identified by the given survey ID.
    /// - Parameter surveyID: The ID of the survey to show the answers for.
    func presentSurveyDetails(surveyID: String)
}

final class DefaultNPSDetailsRouter: Router<NPSDetailsViewController>, NPSDetailsRouter, DefaultActionScenePresenterRouter {
    func presentClientProfile(clientID: String) {
        let descriptor = Client360RouteDescriptor(clientID: clientID)
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }

    func presentSurveyDetails(surveyID: String) {
        let descriptor = NPSSurveyDetailsRouteDescriptor(id: surveyID)
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }
}
