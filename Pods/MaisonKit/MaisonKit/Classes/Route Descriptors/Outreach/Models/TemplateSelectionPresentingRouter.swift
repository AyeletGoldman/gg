// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public protocol TemplateSelectionPresentingRouter: RouterProtocol {
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

public extension TemplateSelectionPresentingRouter {
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
            },
            onCancel: { controller in
                controller.dismiss(animated: true, completion: nil)
            }
        ))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller, animated: true, completion: nil)
    }

    func presentTemplateSelection(outreachFlowItem: OutreachFlowItem,
                                  getTemplates: @escaping GetTemplatesMethod,
                                  onDone: @escaping (OutreachResult) -> Void) {
        self.presentTemplateSelection(outreachFlowItem: outreachFlowItem,
                                      assetURLs: [],
                                      getTemplates: getTemplates,
                                      onDone: onDone)
    }
}
