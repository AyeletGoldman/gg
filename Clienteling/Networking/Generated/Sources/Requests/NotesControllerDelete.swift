/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Delete a note by note id.
/// @description Delete a note by note id.
struct NotesControllerDelete: TargetType {
    ///The note ID to delete.
    let noteId: String

    init(noteId: String) {
        self.noteId = noteId
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
        return .delete
    }

    var task: Task {
        return .requestPlain
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("NotesControllerDelete").url
    }
}

extension NotesControllerDelete: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

