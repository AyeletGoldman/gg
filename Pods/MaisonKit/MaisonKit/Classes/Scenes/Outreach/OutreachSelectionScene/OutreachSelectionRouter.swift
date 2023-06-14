// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The router for the outreach message form scene
public protocol OutreachSelectionRouter: ActionScenePresenterRouter {
    /// Presents the template selection scene
    /// - Parameters:
    ///   - outreachFlowItem: An object that contains the selected outreach method and recipient
    ///   - assetURLs: The assets to share
    ///   - getTemplates: a function to perform to get the templates to show
    ///   - onDone: a closure to invoke when the user has finished performing outreach
    func presentTemplateSelection(outreachFlowItem: OutreachFlowItem,
                                  assetURLs: [URL],
                                  getTemplates: @escaping GetTemplatesMethod,
                                  onDone: @escaping (OutreachResult) -> Void)
}

final class DefaultOutreachSelectionRouter: Router<OutreachSelectionViewController>, OutreachSelectionRouter, DefaultActionScenePresenterRouter {
    func presentTemplateSelection(outreachFlowItem: OutreachFlowItem,
                                  assetURLs: [URL],
                                  getTemplates: @escaping GetTemplatesMethod,
                                  onDone: @escaping (OutreachResult) -> Void) {
        let scene = self.factory.retrieveScene(with: TemplateSelectionRouteDescriptor(
            outreachFlowItem: outreachFlowItem,
            assetURLs: assetURLs,
            getTemplates: getTemplates,
            onDone: { controller, result in
                controller.dismiss(animated: true, completion: nil)
                onDone(result)
            }
        ))
        let controller = self.factory.createViewController(scene)
        self.controller?.sheetPresentationController?.animateChanges {
            self.controller?.sheetPresentationController?.detents = [.large()]
            self.controller?.sheetPresentationController?.prefersGrabberVisible = false
        }
        self.push(controller)
    }
}
