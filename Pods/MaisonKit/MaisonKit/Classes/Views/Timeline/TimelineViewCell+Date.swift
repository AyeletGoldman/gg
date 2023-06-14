// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension TimelineEntryCellProvider {

    /// Creates a new `TimelineEntryCellProvider` that will display the default, MaisonKit-provided timeline entry view.
    /// - Parameters:
    ///   - date: the date of this entry
    ///   - title: the title to display for this entry
    ///   - subtitle: Optional. The subtitle to display for this entry
    ///   - footer: Optional. A footer to display for this entry.
    ///   - tag: Optional. A tag to display for this entry. This is usually used for a price or price range.
    ///   - tagVariant: Optional. The variant of the tag to display for this entry. This is usually used for a price or price range.   
    ///   - mediaItems: An array of images and videos to display in the entry. Defaults to `[]`.
    ///   - detail: A set of properties to display in the timeline entry. Defaults to `.emtpy`.
    ///   - showDisclosureIndicator: Whether or not a disclosure indicator should be displayed.
    ///   A disclosure indicator should be shown if there is an action associated with this view that will push a new scene onto the stack.
    ///   - requireConfirmation: Whether to show the option to confirm or deny this timeline item.
    init(date: Date,
         title: String,
         subtitle: String? = nil,
         footer: String? = nil,
         tag: String? = nil,
         tagVariant: String? = nil,
         mediaItems: [MediaType] = [],
         detail: TimelineDisplayable.Entry.Detail = .empty,
         showDisclosureIndicator: Bool = false,
         requireConfirmation: Bool = false) {
        self.init { confirmationClosure in
            return TimelineViewCell(date: date,
                                    title: title,
                                    subtitle: subtitle,
                                    footer: footer,
                                    tag: tag,
                                    tagVariant: tagVariant,
                                    mediaItems: mediaItems,
                                    detail: detail,
                                    showDisclosureIndicator: showDisclosureIndicator,
                                    confirmationClosure: requireConfirmation ? confirmationClosure : nil)
        }
    }
}

extension TimelineViewCell {
    init(date: Date,
         title: String,
         subtitle: String? = nil,
         footer: String? = nil,
         tag: String? = nil,
         tagVariant: String? = nil,
         mediaItems: [MediaType] = [],
         detail: TimelineDisplayable.Entry.Detail = .empty,
         showDisclosureIndicator: Bool = false,
         confirmationClosure: TimelineEntryConfirmationClosure? = nil) {
        let defaultIconAttributes = detail.attributes.map {
            TypedField(id: $0.id, title: $0.title, value: $0.value, isCopyable: $0.isCopyable, icon: $0.icon ?? "icon-bullet")
        }
        self.init(title: title,
                  subtitle: subtitle,
                  variant: date > Date() ? "future" : nil,
                  leadingView: {
            TimelineCellDateView(date: date, width: Constants.leadingViewWitdh)
        },
                  footer: footer,
                  tag: tag,
                  tagVariant: tagVariant,
                  mediaItems: mediaItems,
                  detail: TimelineDisplayable.Entry.Detail(attributes: defaultIconAttributes),
                  showDisclosureIndicator: showDisclosureIndicator,
                  confirmationClosure: confirmationClosure)
    }
}
