/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct UserInfo: Codable, Equatable {

    let contact: UserInfoContact?
    let displayFields: [TypedValue]
    let store: UserInfoStore
    let user: User

    enum CodingKeys: String, CodingKey {
        case contact = "contact"
        case displayFields = "displayFields"
        case store = "store"
        case user = "user"
    }

    init(contact: UserInfoContact? = nil, displayFields: [TypedValue], store: UserInfoStore, user: User) {
        self.contact = contact
        self.displayFields = displayFields
        self.store = store
        self.user = user
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contact = try container.mkDecodeIfPresent(UserInfoContact.self, forKey: .contact)
        self.displayFields = try container.mkDecode([TypedValue].self, forKey: .displayFields)
        self.store = try container.mkDecode(UserInfoStore.self, forKey: .store)
        self.user = try container.mkDecode(User.self, forKey: .user)
    }
}
