// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// The main displayable for Client360 data
public struct Client360Displayable { }

extension Client360Displayable {
    /// A model used to give meaning to each of the tags displayed in the header
    public struct HeaderTag: Hashable {
        /// The text to display in the tag
        public let title: String
        /// The type of tag this is. Options are `.primary` or `.secondary`
        public let variant: Variant

        /// Creates a new `HeaderTag`
        /// - Parameters:
        ///   - title: The text to display in the tag
        ///   - variant: The type of tag this is. Options are `.primary` or `.secondary`
        public init(title: String, variant: Variant = .primary) {
            self.title = title
            self.variant = variant
        }
    }
}

extension Client360Displayable.HeaderTag {
    /// Tags can have either a primary or secondary variant
    public enum Variant {
        /// A primary tag
        case primary
        /// A secondary tag
        case secondary
    }
}

extension Client360Displayable {

    /// Model used for holding and displaying all header information
    public struct Header {

        /// The client's ID
        let clientId: String?
        /// The client's name
        let clientName: String
        /// The client's local name
        let clientLocalName: String?
        /// The array of segments a user belongs to
        let segments: [Client360Displayable.HeaderTag]
        /// The array of additional information the client has
        let additionalInformation: [TypedField]
        /// Whether this client is my client or not
        let isMyCustomer: Bool

        /// Creates a new Header to be used in the timeline part in Client360 screen
        /// - Parameters:
        ///   - clientId: The client's ID to present
        ///   - clientName: The client's name
        ///   - clientLocalName: The client's local name. In some localities, such as Japan, the client might have a Local Name that can be useful to display for the CA.
        ///   - segments: The array of segments a user belongs to
        ///   - additionalInformation: The array of additional information the client has
        ///   - isMyCustomer: A boolean indicating whether this customer is a the customer of the currently-logged-in customer advisor
        public init(clientId: String? = nil,
                    clientName: String,
                    clientLocalName: String? = nil,
                    segments: [Client360Displayable.HeaderTag] = [],
                    additionalInformation: [TypedField] = [],
                    isMyCustomer: Bool = false) {
            self.clientId = clientId
            self.clientName = clientName
            self.clientLocalName = clientLocalName?.isEmpty == true ? nil : clientLocalName
            self.segments = segments
            self.additionalInformation = additionalInformation
            self.isMyCustomer = isMyCustomer
        }
    }
}

extension Client360Displayable {

    /// Model used for holding and displaying all notes associated to a client
    public struct Notes {

        /// The array containing all the notes as `NoteDisplayable`
        let items: [NoteDisplayable]

        /// Creates a new Notes to be used in `Client360NotesAndPreferencesView`
        /// - Parameters:
        ///   - items: An array containing notes as `NoteDisplayable`
        public init(items: [NoteDisplayable] = []) {
            self.items = items
        }
    }
}

extension Client360Displayable {

    /// Model used for holding and displaying all preferences associated to a client
    public struct Preferences {

        /// The array containing all the preferences as `TypedField`
        let items: [TypedField]

        /// Creates a new Preferences to be used in `Client360NotesAndPreferencesView`
        /// - Parameters:
        ///   - items: An array containing preferences as `TypedField`
        public init(items: [TypedField] = []) {
            self.items = items
        }
    }
}

extension Client360Displayable {

    /// Model used for holding and displaying detailed informations of the client
    public struct Details {

        /// List of various detailed sections regarding the client
        public let sections: [FormTypedFieldSection]

        /// Creates a new Details to be used in `Client360DetailsView`
        /// - Parameters:
        ///   - items: List of various detailed sections regarding the client
        @available(*, unavailable, message: "Deprecated on version 0.22.0. `FormView` has been deprecated in favor of `GenericFormView`. Use an array of `FormTypedFieldSection` rather than `FormView.DetailsSection`.")
        init(items: [FormView.DetailsSection]) {
            self.sections = items.map { FormTypedFieldSection(title: $0.title, fields: $0.fields) }
        }

        /// Creates a new Details to be used in `Client360DetailsView`
        /// - Parameters:
        ///   - items: List of various detailed sections regarding the client
        public init(items: [FormTypedFieldSection] = []) {
            self.sections = items
        }
    }
}
