/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Create client's note
/// @description Create client's note
struct ClientsControllerCreateClient360NotesByClientId: TargetType {
    ///The client ID to add a note to
    let clientId: String
    let body: ClientNoteEdit

    init(clientId: String, body: ClientNoteEdit) {
        self.clientId = clientId
        self.body = body
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/clients/v1/clients/{clientId}/notes"
        let formatter = PathFormatter()
        let clientIdSafe = formatter.format(value: self.clientId)
        path = path.replacingOccurrences(of: "{clientId}", with: clientIdSafe)
        return path
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.body, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("ClientsControllerCreateClient360NotesByClientId").url
    }
}

extension ClientsControllerCreateClient360NotesByClientId: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

