// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class OutreachRoutes: NSObject, RouteRegistering {
    /// Registers all outreach routes.
    /// - Parameter registry: a `SceneRegistry` to register the routes onto.
    static func registerRoutes(onto registry: SceneRegistry) {
        self.registerSMSComposerRoute(onto: registry)
        self.registerMailComposerRoute(onto: registry)
        self.registerTemplateSelectionRoute(onto: registry)
        self.registerLanguageSelectionRoute(onto: registry)
        self.registerOutreachMessageFormRoute(onto: registry)
        self.registerInstructionsRoute(onto: registry)
        self.registerOutreachSelectionRoute(onto: registry)
        self.registerShareDataRoute(onto: registry)
    }
}

/// Convenienve to register all routes required for the outreach.
private extension OutreachRoutes {

    static func registerTemplateSelectionRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: TemplateSelectionRouteDescriptor) in
            return TemplateSelectionScene(outreachFlowItem: descriptor.outreachFlowItem,
                                          assetURLs: descriptor.assetURLs,
                                          getTemplates: descriptor.getTemplates,
                                          onDone: descriptor.onDone,
                                          onCancel: descriptor.onCancel)
        }
    }

    static func registerLanguageSelectionRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: LanguageSelectionRouteDescriptor) in
            return LanguageSelectionScene(languages: descriptor.languages,
                                          selectedLanguageId: descriptor.selectedLanguageId,
                                          onSelectLanguage: descriptor.onSelectLanguage)
        }
    }

    static func registerOutreachMessageFormRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: OutreachMessageFormRouteDescriptor) in
            return OutreachMessageFormScene(outreachType: descriptor.outreachType,
                                            assetURLs: descriptor.assetURLs,
                                            clientId: descriptor.clientId,
                                            recipient: descriptor.recipient,
                                            template: descriptor.template,
                                            validator: descriptor.validator,
                                            onDone: descriptor.onDone)
        }
    }

    static func registerSMSComposerRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: SMSComposerRouteDescriptor) in
            return SMSComposerScene(messageData: descriptor.messageData, onDone: descriptor.onDone)
        }
    }

    static func registerMailComposerRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: MailComposerRouteDescriptor) in
            return MailComposerScene(emailData: descriptor.emailData, onDone: descriptor.onDone)
        }
    }

    static func registerInstructionsRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: InstructionsRouteDescriptor) in
            return InstructionsScene(instructionsData: descriptor.instructionsData)
        }
    }

    static func registerOutreachSelectionRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: OutreachSelectionRouteDescriptor) in
            if let onItemSelected = descriptor.onItemSelected {
                return OutreachSelectionScene(getOutreachActions: descriptor.getOutreachActions,
                                              onCancel: descriptor.onCancel,
                                              onSelected: onItemSelected)
            } else if let templateSelecting = descriptor.outreachFlowContainer {
                return OutreachSelectionScene(getOutreachActions: descriptor.getOutreachActions,
                                              onCancel: descriptor.onCancel,
                                              outreachFlowContainer: templateSelecting)
            }
            return nil
        }
    }

    static func registerShareDataRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: ShareDataRouteDescriptor) in
            return ShareDataScene(title: descriptor.title,
                                  assets: descriptor.assets,
                                  adapter: descriptor.adapter,
                                  onClose: descriptor.onClose)
        }
    }
}
