// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// Typealias to represent a closure with a controller and a result as parameters
public typealias OutreachResultClosure = (UIViewController, OutreachResult) -> Void

/// The route descriptor for the template selection scene.
public struct TemplateSelectionRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "TemplateSelectionRouteDescriptor"

    /// Outreach flow informations
    public let outreachFlowItem: OutreachFlowItem

    /// The assets to share
    public let assetURLs: [URL]

    /// A function to perform to get the templates to show
    public let getTemplates: GetTemplatesMethod

    /// Closure invoked when the outreach finished
    public let onDone: OutreachResultClosure

    /// Closure invoked when tapping to cancel
    public let onCancel: ((UIViewController) -> Void)?

    /// Creates an instance of `TemplateSelectionRouteDescriptor`
    /// - Parameters:
    ///   - outreachFlowItem: Outreach flow informations
    ///   - assetURLs: The assets to share
    ///   - getTemplates: A function to perform to get the templates to show
    ///   - onDone: Closure invoked when the outreach will finish
    ///   - onCancel: Closure invoked when tapping to cancel
    public init(outreachFlowItem: OutreachFlowItem,
                assetURLs: [URL],
                getTemplates: @escaping GetTemplatesMethod,
                onDone: @escaping OutreachResultClosure,
                onCancel: ((UIViewController) -> Void)? = nil) {
        self.outreachFlowItem = outreachFlowItem
        self.assetURLs = assetURLs
        self.getTemplates = getTemplates
        self.onDone = onDone
        self.onCancel = onCancel
    }
}
