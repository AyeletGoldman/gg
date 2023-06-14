// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

/// A set of information to display when a client list is presented on-screen.
public struct ClientListDisplayable: Identifiable {

    /// The default list -> summary conversion. Displays only the list's title and background.
    public static let defaultSummaryClosure: SummaryClosure = { displayable in
        return SummaryDisplayable(id: displayable.id,
                                  title: displayable.listInfo.title,
                                  subtitle: nil,
                                  tag: nil,
                                  backgroundImage: displayable.listInfo.backgroundImage)
    }

    /// The list's ID; used when we want to edit or otherwise amend the list.
    public let id: ListID
    /// A set of information about this list.
    public let listInfo: ListInfo
    /// The closure to apply to this list to create a summary version of its data.
    public let summaryDisplayable: SummaryClosure
    /// A list of sorting items used to sort the list members.
    public let sortItems: [SortItem]?
    /// The selected sorting value
    public let selectedSortValue: SelectedSortValue?
    /// The mode this list is in. Will be `.classic` if the members list displays no tabs and should show just one list, or `.tabbed` if there are tabs.
    /// This value is set depending on the initializer that is used.
    public var mode: ClientListMode

    /// Creates a new `ClientListDisplayable` with the given information
    /// - Parameters:
    ///   - id: the list's ID
    ///   - listInfo: a set of information about this list, including its title and subtitle.
    ///   - members: optional. A list of members that are part of this list. Defaults to `nil`.
    ///   - totalNumberOfClients: optional. The total number of clients in the list. If you implement pagination you should populate this value with the total number of clients. Defaults to `nil`.
    ///   - sortItems: optional. A list of sorting items used to sort the list members. Defaults to `nil`.
    ///   - selectedSortValue: optional. The initial selected sorting value. Defaults to `nil`.
    ///   - summaryDisplayable: a closure to apply to this list to create a summary display version of its data.
    ///   Defaults to `ClientListDisplayable.defaultSummaryClosure`
    ///   - currentListCursor: The cursor for the list. Cursors are used to aid in pagination. If the value here is non-nil, the client lists will assume there are more
    ///   pages to be loaded and will return this cursor when requesting the next page. To disable pagination, pass `nil` here. If you have reached the last page, pass `nil` here.
    public init(id: String,
                listInfo: ListInfo,
                members: [ClientMemberDisplayable]? = nil,
                totalNumberOfClients: Int? = nil,
                sortItems: [SortItem]? = nil,
                selectedSortValue: SelectedSortValue? = nil,
                summaryDisplayable: @escaping SummaryClosure = ClientListDisplayable.defaultSummaryClosure,
                currentListCursor: String? = nil) {
        self.id = id
        self.listInfo = listInfo
        self.sortItems = sortItems
        self.selectedSortValue = selectedSortValue
        self.summaryDisplayable = summaryDisplayable
        self.mode = .classic(members: members, currentListCursor: currentListCursor, totalNumberOfClients: totalNumberOfClients)
    }

    /// Creates a new `ClientListDisplayable` with the given information
    /// - Parameters:
    ///   - id: the list's ID
    ///   - listInfo: a set of information about this list, including its title and subtitle.
    ///   - tabs: An array of tabs with members that should be displayed on this list.
    ///   - sortItems: optional. A list of sorting items used to sort the list members. Defaults to `nil`.
    ///   - selectedSortValue: optional. The initial selected sorting value. Defaults to `nil`.
    ///   - summaryDisplayable: a closure to apply to this list to create a summary display version of its data.
    ///   Defaults to `ClientListDisplayable.defaultSummaryClosure`
    public init(id: String,
                listInfo: ListInfo,
                tabs: [ClientMemberListTab]?,
                sortItems: [SortItem]? = nil,
                selectedSortValue: SelectedSortValue? = nil,
                summaryDisplayable: @escaping SummaryClosure = ClientListDisplayable.defaultSummaryClosure) {
        self.id = id
        self.listInfo = listInfo
        self.sortItems = sortItems
        self.selectedSortValue = selectedSortValue
        self.summaryDisplayable = summaryDisplayable
        self.mode = .tabbed(tabs: tabs)
    }

    /// The `ClientListDisplayable`'s information for controling display on-screen.
    public struct ListInfo {
        /// The list's title
        public let title: String
        /// The list's subtitle
        public let subtitle: String?
        /// The list's tag
        public let tag: String?
        /// Whether the list is editable or not
        public let isEditable: Bool
        /// An image to show as the background in the navigation bar
        public let backgroundImage: ImageSource?

        /// Creates a new `ListInfo` with the given properties of a list
        /// - Parameter title: The title of this list.
        /// - Parameter subtitle: The subtitle of this list.
        /// - Parameter backgroundImage: optional. If the background should be an image pass in an image source here.
        ///     If this is `nil` the background will be a the color of the theme.
        /// - Parameter tag: optional. The tag to display on this list.
        /// - Parameter isEditable: whether the list is editable or not. Defaults to `false`.
        public init(title: String,
                    subtitle: String?,
                    backgroundImage: ImageSource?,
                    tag: String?,
                    isEditable: Bool = false) {
            self.title = title
            self.subtitle = subtitle
            self.isEditable = isEditable
            self.tag = tag
            self.backgroundImage = backgroundImage
        }
    }
}
