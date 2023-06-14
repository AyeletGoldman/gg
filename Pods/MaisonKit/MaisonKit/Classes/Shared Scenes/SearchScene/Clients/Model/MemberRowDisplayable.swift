// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A displayable type used to display data on a list
///
///  |-----------------------------------------------|
///  | Title  [SEG] [SEG]                      |
///  | Subtitle                                            |
///  |-----------------------------------------------|
public struct MemberRowDisplayable: Identifiable {

    /// The client ID.
    public let id: String
    /// The title for the cell that will be displayed.
    /// This title is usually the client name.
    public let title: String
    /// The array of subtitles for the cell that will be displayed.
    /// This is usually a KPI followed by a value. For example you might want to show here
    /// a label of `Last contacted date` and the date at which the client was last contacted.
    public let subtitles: [LabeledValue]
    /// A set of tags to show for the client. This is usually indicators like for example whether the client is a VIP.
    /// These tags are shown on the trailing edge of the `title`.
    public let tags: [String]
    /// Whether this client is assigned to me (the logged in CA) or not.
    public let isMyCustomer: Bool

    /// Creates a new `ClientRowDisplayable`
    /// - Parameters:
    ///   - id: The client ID.
    ///   - title: The title for the cell that will be displayed.
    ///   This title is usually the client name.
    ///   - subtitle: Optional. The subtitle for the cell that will be displayed.
    ///   This is usually a KPI followed by a value. For example you might want to show here
    ///   a label of `Last contacted date` and the date at which the client was last contacted.
    ///   - segments: A set of tags to show for the client. This is usually indicators like for example whether the client is a VIP.
    ///   These tags are shown on the trailing edge of the `title`.
    ///   - isMyCustomer: Whether this client is assigned to me (the logged in CA) or not.
    public init(id: String,
                title: String,
                subtitle: LabeledValue?,
                segments: [String] = [],
                isMyCustomer: Bool = false) {
        self.id = id
        self.title = title
        self.subtitles = subtitle.map { [$0] } ?? []
        self.tags = segments
        self.isMyCustomer = isMyCustomer
    }

    /// Creates a new `ClientRowDisplayable`
    /// - Parameters:
    ///   - id: The client ID.
    ///   - title: The title for the cell that will be displayed.
    ///   This title is usually the client name.
    ///   - subtitles: Optional. The array of subtitles for the cell that will be displayed.
    ///   This is usually a KPI followed by a value. For example you might want to show here
    ///   a label of `Last contacted date` and the date at which the client was last contacted.
    ///   - segments: A set of tags to show for the client. This is usually indicators like for example whether the client is a VIP.
    ///   These tags are shown on the trailing edge of the `title`.
    ///   - isMyCustomer: Whether this client is assigned to me (the logged in CA) or not.
    public init(id: String,
                title: String,
                subtitles: [LabeledValue] = [],
                segments: [String] = [],
                isMyCustomer: Bool = false) {
        self.id = id
        self.title = title
        self.subtitles = subtitles
        self.tags = segments
        self.isMyCustomer = isMyCustomer
    }
}
