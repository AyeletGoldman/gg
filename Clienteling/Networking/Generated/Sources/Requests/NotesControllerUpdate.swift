/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Edit a note by note id.
/// @description Edit a note by note id.
struct NotesControllerUpdate: TargetType {
    ///The note ID to edit.
    let noteId: String
    let body: ClientNoteEdit

    init(noteId: String, body: ClientNoteEdit) {
        self.noteId = noteId
        self.body = body
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        var path = "/clients/v1/notes/{noteId}"
        let formatter = PathFormatter()
        let noteIdSafe = formatter.format(value: self.noteId)
        path = path.replacingOccurrences(of: "{noteId}", with: noteIdSafe)
        return path
    }

    var method: Moya.Method {
        return .patch
    }

    var task: Task {
        return .requestCustomJSONEncodable(self.body, encoder: JSONEncoder.withISO8601Date)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("NotesControllerUpdate").url
    }
}

extension NotesControllerUpdate: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

