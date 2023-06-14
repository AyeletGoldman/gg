/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import Moya

/// @summary Get all clients.
/// @description Get all clients.
/// 
/// **How to use pagination?**
/// 
/// If the request results size is larger than the provided `pageSize` value, `nextCursor` and  `totalNumberOfPages` will be added to the response object.
/// 
/// Assuming the following request returns more than the requested `(pageSize=200)` amount of results -
/// 
/// > `GET https://domain.com/path?pageSize=200&pageIndex=0`
/// > ```
/// > RESPONSE
/// > {
/// >   "status": "success",
/// >   "data": {
/// >     "source": "Example Plugin",
/// >     "actionId": "00000000",
/// >     "result": {
/// >       "clients": [
/// >         { ... }
/// >       ],
/// >       "totalNumberOfPages": 2,
/// >       "next_cursor": "01g5E00001Ned2tQAB"
/// >     }
/// >   }
/// > }
/// > ```
/// To paginate further results, the next request should specify the original's query page size, next page index and cursor -
/// 
/// > `GET https://domain.com/path?pageSize=200&pageIndex=1&cursor=01g5E00001Ned2tQAB`
struct ClientsControllerFindAll: TargetType {
    ///Free text search field. Searches through all of the data related to the clients.
    let query: String?
    ///Client list ID to filter the results by.
    let clientlistId: String?
    ///Used to determine how to filter clients.
    let searchScope: SearchScope?
    ///The index of the page to query. Counting starts from 0
    let pageIndex: Int?
    ///The amount of result to receive in one query. Minimum - 200
    let pageSize: Int?
    ///A cursor to keep track of pagination data in case changes were made after fetching results.
    let cursor: String?

    init(query: String?, clientlistId: String?, searchScope: SearchScope?, pageIndex: Int?, pageSize: Int?, cursor: String?) {
        self.query = query
        self.clientlistId = clientlistId
        self.searchScope = searchScope
        self.pageIndex = pageIndex
        self.pageSize = pageSize
        self.cursor = cursor
    }

    var headers: [String: String]? {
        return nil
    }

    var path: String {
        return "/clients/v1/clients"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        // Formatting request parameters is tricky business because Moya (or Alamofire?) doesn't have the ability to format
        // each parameter individually. So we always format the value beforehand and then pass it into the url encoder
        let queryEncoder = URLQueryEncoder()
        queryEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        queryEncoder.encode(self.query,
                            forKey: "query",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.clientlistId,
                            forKey: "clientlistId",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.searchScope,
                            forKey: "searchScope",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.pageIndex,
                            forKey: "pageIndex",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.pageSize,
                            forKey: "pageSize",
                            explode: true,
                            isDeepObject: false)
        queryEncoder.encode(self.cursor,
                            forKey: "cursor",
                            explode: true,
                            isDeepObject: false)
        // We pass in empty parameters because they are encoded by URLQueryEncoder
        return .requestParameters(parameters: [:],
                                  encoding: queryEncoder)
    }

    var baseURL: URL {
        return Server.selectedServerForOperationName("ClientsControllerFindAll").url
    }
}

extension ClientsControllerFindAll: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
}

