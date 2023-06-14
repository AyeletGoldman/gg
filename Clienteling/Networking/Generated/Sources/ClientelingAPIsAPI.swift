/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.
///
/// Clienteling APIs
/// Clienteling APIs.
/// Version: v1

import Foundation
import Combine
import Moya
import Combine

open class ClientelingAPIsAPI: MoyaProvider<MultiTarget> {

    override init(endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
                  requestClosure: @escaping RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
                  stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
                  callbackQueue: DispatchQueue? = nil,
                  session: Session = MoyaProvider<Target>.defaultAlamofireSession(),
                  plugins: [PluginType] = [],
                  trackInflights: Bool = false) {

        super.init(endpointClosure: endpointClosure,
                   requestClosure: requestClosure,
                   stubClosure: stubClosure,
                   callbackQueue: callbackQueue,
                   session: session,
                   plugins: plugins,
                   trackInflights: trackInflights)
    }

    /// There is authentication via http Authorization header defined
    /// You can use this initializer to pass in a tokenClosure and use the default
    /// Moya `AccessTokenPlugin`.
    public init(endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
                requestClosure: @escaping RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
                stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
                tokenClosure: @escaping (AccessTokenAuthorizable) -> String,
                callbackQueue: DispatchQueue? = nil,
                session: Session = MoyaProvider<Target>.defaultAlamofireSession(),
                plugins: [PluginType] = [],
                trackInflights: Bool = false) {

        let allPlugins = plugins + [AccessTokenPlugin(tokenClosure: { target in
            guard let target = target as? AccessTokenAuthorizable else { return "" }
            return tokenClosure(target)
        })]

        super.init(endpointClosure: endpointClosure,
                   requestClosure: requestClosure,
                   stubClosure: stubClosure,
                   callbackQueue: callbackQueue,
                   session: session,
                   plugins: allPlugins,
                   trackInflights: trackInflights)
    }

    public func buildRequest(for target: TargetType) -> AnyPublisher<Response, MoyaError> {
        return self.requestPublisher(MultiTarget(target))
            .filterSuccessfulStatusCodes()
    }
}

extension ClientelingAPIsAPI {
    /// @summary Create a client list.
    /// @description Create a client list.
    func clientListsControllerCreate(body: CreateClientList) -> AnyPublisher<ClientListsControllerCreateResponses, MoyaError> {
        let target = ClientListsControllerCreate(body: body)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(CreateClientListSuccessResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Delete a client list by ID.
    /// @description Delete a client list by ID.
    func clientListsControllerDelete(listId: String) -> AnyPublisher<ClientListsControllerDeleteResponses, MoyaError> {
        let target = ClientListsControllerDelete(listId: listId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get all client lists.
    /// @description Get all client lists.
    func clientListsControllerFindAll() -> AnyPublisher<ClientListsControllerFindAllResponses, MoyaError> {
        let target = ClientListsControllerFindAll()
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ClientListsJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get a client list by ID.
    /// @description Get a client list by ID.
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
    func clientListsControllerFindOne(listId: String, pageIndex: Int?, pageSize: Int?, cursor: String?, sort: SortKeyValue?) -> AnyPublisher<ClientListsControllerFindOneResponses, MoyaError> {
        let target = ClientListsControllerFindOne(listId: listId, pageIndex: pageIndex, pageSize: pageSize, cursor: cursor, sort: sort)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ClientListJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Update a client list.
    /// @description Update a client list. `memberIds` property can only *add* member Ids to an existing list, but can not remove them.
    /// 
    /// In a scenario where no `memberIds` were provided in request's body, the existing `memberIds` will not change.
    /// If `memberIds` were provided in request's body, these memberIds will be added in addition to the existing memberIds list.
    /// 
    /// `memberIds` and `criteria` are incompatible with each other. Only one of them can exist in a request.
    /// 
    /// ***-criteria*** attribute is currently not being used or have any implementation.
    func clientListsControllerPut(listId: String, body: CreateClientList) -> AnyPublisher<ClientListsControllerPutResponses, MoyaError> {
        let target = ClientListsControllerPut(listId: listId, body: body)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Delete client list member by member ID.
    /// @description Delete client list member by member ID.
    func clientListsMembersControllerDelete(memberId: String) -> AnyPublisher<ClientListsMembersControllerDeleteResponses, MoyaError> {
        let target = ClientListsMembersControllerDelete(memberId: memberId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Create client's note
    /// @description Create client's note
    func clientsControllerCreateClient360NotesByClientId(clientId: String, body: ClientNoteEdit) -> AnyPublisher<ClientsControllerCreateClient360NotesByClientIdResponses, MoyaError> {
        let target = ClientsControllerCreateClient360NotesByClientId(clientId: clientId, body: body)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(EmptyJSONJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

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
    func clientsControllerFindAll(query: String?, clientlistId: String?, searchScope: SearchScope?, pageIndex: Int?, pageSize: Int?, cursor: String?) -> AnyPublisher<ClientsControllerFindAllResponses, MoyaError> {
        let target = ClientsControllerFindAll(query: query, clientlistId: clientlistId, searchScope: searchScope, pageIndex: pageIndex, pageSize: pageSize, cursor: cursor)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ClientsJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get detailled information of one client by ID.
    /// @description Get detailled information of one client by ID.
    func clientsControllerFindDetailsOne(clientId: String) -> AnyPublisher<ClientsControllerFindDetailsOneResponses, MoyaError> {
        let target = ClientsControllerFindDetailsOne(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ClientDetailsJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get headers information of one client by ID.
    /// @description Returns Client360 page header section data.
    func clientsControllerFindHeaderOne(clientId: String) -> AnyPublisher<ClientsControllerFindHeaderOneResponses, MoyaError> {
        let target = ClientsControllerFindHeaderOne(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ClientHeaderJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get client's KPIs.
    /// @description Returns Client360 page KPI section data.
    func clientsControllerFindKpiOne(clientId: String) -> AnyPublisher<ClientsControllerFindKpiOneResponses, MoyaError> {
        let target = ClientsControllerFindKpiOne(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ClientKPIJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get client's notes.
    /// @description Get client's notes.
    func clientsControllerFindNotesOne(clientId: String) -> AnyPublisher<ClientsControllerFindNotesOneResponses, MoyaError> {
        let target = ClientsControllerFindNotesOne(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ClientNotesJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get client's outreach channels.
    /// @description Get client's outreach channels by client ID.
    func clientsControllerFindOutreachOne(clientId: String, channels: [OutreachChannels]?) -> AnyPublisher<ClientsControllerFindOutreachOneResponses, MoyaError> {
        let target = ClientsControllerFindOutreachOne(clientId: clientId, channels: channels)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ClientOutreachJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get client's preferences.
    /// @description Get client's preferences.
    func clientsControllerFindPreferencesOne(clientId: String) -> AnyPublisher<ClientsControllerFindPreferencesOneResponses, MoyaError> {
        let target = ClientsControllerFindPreferencesOne(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ClientPreferencesJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get client's timeline actions.
    /// @description Returns Client360 page timeline actions options.
    func clientsControllerFindTimelineActionsOne(clientId: String) -> AnyPublisher<ClientsControllerFindTimelineActionsOneResponses, MoyaError> {
        let target = ClientsControllerFindTimelineActionsOne(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ClientTimelineActionsJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get client's timeline V2.
    /// @description Returns Client360 page timeline section data, such as - interactions, transactions, outreaches
    func clientsControllerFindTimelineOne(clientId: String) -> AnyPublisher<ClientsControllerFindTimelineOneResponses, MoyaError> {
        let target = ClientsControllerFindTimelineOne(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ClientTimelineV2.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get client's timeline V1.
    /// @description Returns Client360 page timeline section data, such as - interactions, transactions, outreaches
    func clientsControllerFindTimelineOneV1(clientId: String) -> AnyPublisher<ClientsControllerFindTimelineOneV1Responses, MoyaError> {
        let target = ClientsControllerFindTimelineOneV1(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ClientTimelineV1JSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary update a client by ID.
    /// @description update a client by ID.
    func clientsControllerPatchOne(clientId: String, body: CreateClientData) -> AnyPublisher<ClientsControllerPatchOneResponses, MoyaError> {
        let target = ClientsControllerPatchOne(clientId: clientId, body: body)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(EmptyJSONJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Add multiple products to a given curation.
    func curationControllerAddProduct(curationId: String, addProductsBody: AddProductsBody) -> AnyPublisher<CurationControllerAddProductResponses, MoyaError> {
        let target = CurationControllerAddProduct(curationId: curationId, addProductsBody: addProductsBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 409:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .conflictError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Create a curation.
    /// @description Create a curation.
    func curationControllerCreate(createOrUpdateCurationBody: CreateOrUpdateCurationBody) -> AnyPublisher<CurationControllerCreateResponses, MoyaError> {
        let target = CurationControllerCreate(createOrUpdateCurationBody: createOrUpdateCurationBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(DefaultSuccessResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Delete a curation by id.
    func curationControllerDelete(curationId: String) -> AnyPublisher<CurationControllerDeleteResponses, MoyaError> {
        let target = CurationControllerDelete(curationId: curationId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Duplicate an existing curation.
    func curationControllerDuplicate(curationId: String) -> AnyPublisher<CurationControllerDuplicateResponses, MoyaError> {
        let target = CurationControllerDuplicate(curationId: curationId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(DefaultSuccessResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Empty products list of the given curation.
    func curationControllerEmptyCuration(curationId: String) -> AnyPublisher<CurationControllerEmptyCurationResponses, MoyaError> {
        let target = CurationControllerEmptyCuration(curationId: curationId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get the list of all curations.
    /// @description Get the list of all curations.
    func curationControllerFindAll(shopId: String?, acceptLanguage: String?) -> AnyPublisher<CurationControllerFindAllResponses, MoyaError> {
        let target = CurationControllerFindAll(shopId: shopId, acceptLanguage: acceptLanguage)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(Curations.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get a curation by Curation or User id.
    func curationControllerFindOne(curationId: String, shopId: String?, currencyCode: CurrencyCode?, acceptLanguage: String?) -> AnyPublisher<CurationControllerFindOneResponses, MoyaError> {
        let target = CurationControllerFindOne(curationId: curationId, shopId: shopId, currencyCode: currencyCode, acceptLanguage: acceptLanguage)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(Curation.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Mark a curation a read only.
    func curationControllerFreeze(curationId: String) -> AnyPublisher<CurationControllerFreezeResponses, MoyaError> {
        let target = CurationControllerFreeze(curationId: curationId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Update a single field of a curation by its id.
    func curationControllerPatch(curationId: String, patchCurationBody: PatchCurationBody) -> AnyPublisher<CurationControllerPatchResponses, MoyaError> {
        let target = CurationControllerPatch(curationId: curationId, patchCurationBody: patchCurationBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Delete a single product in a given curation.
    func curationControllerRemoveProduct(curationId: String, productId: String) -> AnyPublisher<CurationControllerRemoveProductResponses, MoyaError> {
        let target = CurationControllerRemoveProduct(curationId: curationId, productId: productId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Update a curation by Curation id.
    func curationControllerUpdateOne(curationId: String, createOrUpdateCurationBody: CreateOrUpdateCurationBody) -> AnyPublisher<CurationControllerUpdateOneResponses, MoyaError> {
        let target = CurationControllerUpdateOne(curationId: curationId, createOrUpdateCurationBody: createOrUpdateCurationBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Upload personal assets for a given curation.
    func curationControllerUploadAssets(curationId: String, uploadAssetBody: UploadAssetBody) -> AnyPublisher<CurationControllerUploadAssetsResponses, MoyaError> {
        let target = CurationControllerUploadAssets(curationId: curationId, uploadAssetBody: uploadAssetBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(UploadAssetResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Return dashboard information, by user ID.
    /// @description Get dashboards by user Id.
    func dashboardsControllerFindAll(userId: String, filters: JSON?) -> AnyPublisher<DashboardsControllerFindAllResponses, MoyaError> {
        let target = DashboardsControllerFindAll(userId: userId, filters: filters)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(DashboardJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Return dashboard information
    /// @description Get dashboards by User Id, with an optional parameter for running user
    func dashboardsControllerFindOneByDashboardId(userId: String, runningUser: String?, refreshDashboard: Bool?) -> AnyPublisher<DashboardsControllerFindOneByDashboardIdResponses, MoyaError> {
        let target = DashboardsControllerFindOneByDashboardId(userId: userId, runningUser: runningUser, refreshDashboard: refreshDashboard)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(IDashboardsV2JSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Delete an appointment
    /// @description Delete an appointment
    func deleteAppointmentsV1AppointmentsAppointmentId(appointmentId: String) -> AnyPublisher<DeleteAppointmentsV1AppointmentsAppointmentIdResponses, MoyaError> {
        let target = DeleteAppointmentsV1AppointmentsAppointmentId(appointmentId: appointmentId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Unregister agent's token(s) when the user logs out of the app.
    /// @description Unregister agent's tokens when the user logs out of the app (Sightcall).
    func deleteConsultationV1ConsultationVideoToken() -> AnyPublisher<DeleteConsultationV1ConsultationVideoTokenResponses, MoyaError> {
        let target = DeleteConsultationV1ConsultationVideoToken()
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get the list of all events.
    /// @description Get the list of all events.
    /// 
    /// There are several filters available at the moment.
    /// Three of them (appointmentTopicId, appointmentChannel, storeId) can be applied only if the eventType is appointment.
    /// In case you specify one of these three filters without passing eventType=Appointment as well, an error is thrown.
    /// 
    /// Note: If you consider sending multiple values for a single filter,
    /// the recommend way to that is to separate them using a comma `,`.
    func eventsControllerFindAll(eventType: EventsControllerFindAll.EventType?, filters: [String: [String]]?) -> AnyPublisher<EventsControllerFindAllResponses, MoyaError> {
        let target = EventsControllerFindAll(eventType: eventType, filters: filters)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(Events.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get the list of all available filters.
    /// @description Return the list of all available filters
    func filtersControllerFindAll(eventType: FiltersControllerFindAll.EventType?, acceptLanguage: String?) -> AnyPublisher<FiltersControllerFindAllResponses, MoyaError> {
        let target = FiltersControllerFindAll(eventType: eventType, acceptLanguage: acceptLanguage)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(EventFilters.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get appointments for the current logged in user
    /// @description Get appointments for the current logged in user
    func getAppointmentsV1Appointments() -> AnyPublisher<GetAppointmentsV1AppointmentsResponses, MoyaError> {
        let target = GetAppointmentsV1Appointments()
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(GetAppointmentsResponseV1.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get appointment channels
    /// @description Get appointment channels
    func getAppointmentsV1AppointmentsChannels() -> AnyPublisher<GetAppointmentsV1AppointmentsChannelsResponses, MoyaError> {
        let target = GetAppointmentsV1AppointmentsChannels()
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(GetAppointmentChannelsResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get appointment territories for the current logged in user
    /// @description Get appointment territories for the current logged in user
    func getAppointmentsV1AppointmentsTerritories(topicId: String) -> AnyPublisher<GetAppointmentsV1AppointmentsTerritoriesResponses, MoyaError> {
        let target = GetAppointmentsV1AppointmentsTerritories(topicId: topicId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(GetAppointmentTerritoriesResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get appointment channels for the currently logged in user
    /// @description Get available timeslots for the currently logged in user
    /// 
    /// This endpoint takes two optional parameters: `beginPeriod` and `endPeriod`. These two params form a pair, that means if one is specified, you need to specify the other.
    /// In case you only provide one of these parameters, you'll receive a 400 bad request asking to provide the other parameter.
    func getAppointmentsV1AppointmentsTerritoriesTimeslots(territoryId: String, topicId: String, beginPeriod: ISO8601DateString?, endPeriod: ISO8601DateString?) -> AnyPublisher<GetAppointmentsV1AppointmentsTerritoriesTimeslotsResponses, MoyaError> {
        let target = GetAppointmentsV1AppointmentsTerritoriesTimeslots(territoryId: territoryId, topicId: topicId, beginPeriod: beginPeriod, endPeriod: endPeriod)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(GetAppointmentTimeSlotsResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get appointment topics
    /// @description Get appointment topics
    func getAppointmentsV1AppointmentsTopics() -> AnyPublisher<GetAppointmentsV1AppointmentsTopicsResponses, MoyaError> {
        let target = GetAppointmentsV1AppointmentsTopics()
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(GetAppointmentTopicsResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get unassigned appointments for a given store
    /// @description Get unassigned appointments for a given store
    func getAppointmentsV1AppointmentsUnassigned(territoryOwnerId: String?, territoryId: String?, startDate: UTCDate?, endDate: UTCDate?, type: String?) -> AnyPublisher<GetAppointmentsV1AppointmentsUnassignedResponses, MoyaError> {
        let target = GetAppointmentsV1AppointmentsUnassigned(territoryOwnerId: territoryOwnerId, territoryId: territoryId, startDate: startDate, endDate: endDate, type: type)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(GetUnassignedAppointmentsResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get appointment by id
    /// @description Get appointment by id
    func getAppointmentsV1AppointmentsAppointmentId(appointmentId: String) -> AnyPublisher<GetAppointmentsV1AppointmentsAppointmentIdResponses, MoyaError> {
        let target = GetAppointmentsV1AppointmentsAppointmentId(appointmentId: appointmentId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(AppointmentDetail.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get appointments for the current logged in user
    /// @description Get appointments for the current logged in user
    func getAppointmentsV2Appointments(advisorId: String?, clientId: String?, territoryOwnerId: String?, territoryId: String?, startDate: UTCDate?, endDate: UTCDate?, type: String?) -> AnyPublisher<GetAppointmentsV2AppointmentsResponses, MoyaError> {
        let target = GetAppointmentsV2Appointments(advisorId: advisorId, clientId: clientId, territoryOwnerId: territoryOwnerId, territoryId: territoryId, startDate: startDate, endDate: endDate, type: type)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(GetAppointmentsResponseV2.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get a device token to interact with the consultation service.
    /// @description Get a device token to interact with the consultation service (Sightcall).
    func getConsultationV1ConsultationVideoToken() -> AnyPublisher<GetConsultationV1ConsultationVideoTokenResponses, MoyaError> {
        let target = GetConsultationV1ConsultationVideoToken()
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(RegistrationTokenResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 422:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unprocessableEntity(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get one to one consultation links for given ids
    /// @description Get one to one consultation links for given ids
    func getConsultationV2ConsultationConnectLinksExternalIds(externalIds: [String]) -> AnyPublisher<GetConsultationV2ConsultationConnectLinksExternalIdsResponses, MoyaError> {
        let target = GetConsultationV2ConsultationConnectLinksExternalIds(externalIds: externalIds)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(GetConnectLinkByExternalIdResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .status500(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get an order by id
    /// @description Get an order by id.
    func getOrdersV1OrdersOrderId(orderId: String) -> AnyPublisher<GetOrdersV1OrdersOrderIdResponses, MoyaError> {
        let target = GetOrdersV1OrdersOrderId(orderId: orderId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(Order.self, using: JSONDecoder.withISO8601Date)
                    return .getOrderByIdResponse(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .status500(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get a payment link by id
    /// @description Get a payment link by id.
    func getOrdersV1PaymentsLinksLinkId(linkId: String) -> AnyPublisher<GetOrdersV1PaymentsLinksLinkIdResponses, MoyaError> {
        let target = GetOrdersV1PaymentsLinksLinkId(linkId: linkId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(PaymentLink.self, using: JSONDecoder.withISO8601Date)
                    return .getPaymentLinkResponse(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get an order by id
    /// @description Get an order by id. Deprecation: use `/v2/transactions/{transactionId}` instead.
    func getOrdersV2OrdersOrderId(orderId: String) -> AnyPublisher<GetOrdersV2OrdersOrderIdResponses, MoyaError> {
        let target = GetOrdersV2OrdersOrderId(orderId: orderId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(TransactionV2.self, using: JSONDecoder.withISO8601Date)
                    return .getOrderByIdResponseV2(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get list of sub-categories of a category
    /// @description This endpoint allows you to get a list of sub-categories of a given category.
    func getProductsV1Categories(categoryId: String?, acceptLanguage: String?) -> AnyPublisher<GetProductsV1CategoriesResponses, MoyaError> {
        let target = GetProductsV1Categories(categoryId: categoryId, acceptLanguage: acceptLanguage)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(CategoriesReduceResult.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get list of products
    /// @description This endpoint allows you to get a list of products. Free text search, filter by category and filter by attributes can be combined.
    func getProductsV1Products(shopId: String, currencyCode: CurrencyCode, query: String?, categoryId: String?, fetchSubcategories: Bool?, similarTo: String?, filters: ProductFilterRequestQueryParameter?, sortKey: String?, pageSize: Int?, pageIndex: Int?, acceptLanguage: String?) -> AnyPublisher<GetProductsV1ProductsResponses, MoyaError> {
        let target = GetProductsV1Products(shopId: shopId, currencyCode: currencyCode, query: query, categoryId: categoryId, fetchSubcategories: fetchSubcategories, similarTo: similarTo, filters: filters, sortKey: sortKey, pageSize: pageSize, pageIndex: pageIndex, acceptLanguage: acceptLanguage)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ProductsSearchResult.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary DEPRECATED - Get possible values for attributes of a product master or a bundle.
    /// @description **DEPRECATED** This endpoint will be removed in a future release.
    /// 
    /// This endpoint can be used to get the possible values of attributes of a product master,
    /// given values for a set of attributes.
    /// 
    /// When the given selection of attributes gives a single product, the product ID is returned.
    /// 
    /// For each attribute selected in the request, the list of possible values when this attribute is unselected are given. 
    /// 
    /// For example, it can be used to get all the possible sizes of products for a given master, with a *blue* color and a *gold* material.
    /// 
    /// ```
    /// selectedAttributes={
    ///   ATTRIBUTE1:VALUE1,
    ///   ATTRIBUTE2:VALUE2
    /// }
    /// ```
    func getProductsV1ProductsMasterIdAttributesValues(masterId: String, shopId: String, selectedAttributes: [String: String]?, acceptLanguage: String?) -> AnyPublisher<GetProductsV1ProductsMasterIdAttributesValuesResponses, MoyaError> {
        let target = GetProductsV1ProductsMasterIdAttributesValues(masterId: masterId, shopId: shopId, selectedAttributes: selectedAttributes, acceptLanguage: acceptLanguage)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(AttributesSearchResult.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get the details of a product, a product master or a bundle
    /// @description This endpoint allows you to get the full details about a product, a master or a bundle.
    /// 
    /// ## Attributes
    /// 
    /// Attributes are the values configurable for a product.
    /// 
    /// For a master, the attributes are given without specifying their values.
    /// 
    /// For a bundle, the attributes are grouped by elements of the bundle.
    /// 
    /// ## Properties
    /// 
    /// Properties are values not configurable, like descriptions.
    /// ```
    func getProductsV1ProductsProductIdsOrUpcs(productIdsOrUpcs: [String], shopId: String?, currencyCode: CurrencyCode?, ignoreNotFoundErrors: Bool?, attributes: [String: String]?, acceptLanguage: String?) -> AnyPublisher<GetProductsV1ProductsProductIdsOrUpcsResponses, MoyaError> {
        let target = GetProductsV1ProductsProductIdsOrUpcs(productIdsOrUpcs: productIdsOrUpcs, shopId: shopId, currencyCode: currencyCode, ignoreNotFoundErrors: ignoreNotFoundErrors, attributes: attributes, acceptLanguage: acceptLanguage)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ProductsDetailsResult.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get the stock details for a product
    /// @description This endpoint allows you to get the full details about stocks for a product.
    /// ```
    func getProductsV1StocksProductId(productId: String, shopId: String?, acceptLanguage: String?) -> AnyPublisher<GetProductsV1StocksProductIdResponses, MoyaError> {
        let target = GetProductsV1StocksProductId(productId: productId, shopId: shopId, acceptLanguage: acceptLanguage)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(ProductStockResult.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get the device tokens of an advisor.
    /// @description Get the device tokens of an advisor. By default, returns the device tokens of the connected user. If `advisorId` query parameter is supplied, returns his device tokens.
    func getNotificationsRegistrationsTokens(advisorId: String?) -> AnyPublisher<GetNotificationsRegistrationsTokensResponses, MoyaError> {
        let target = GetNotificationsRegistrationsTokens(advisorId: advisorId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(GetNotificationsRegistrationsTokensResponse.self, using: JSONDecoder.withISO8601Date)
                    return .getNotificationsRegistrationsTokens(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Create an interaction.
    /// @description Create an interaction.
    func interactionsControllerCreate(body: CreateInteractionV2) -> AnyPublisher<InteractionsControllerCreateResponses, MoyaError> {
        let target = InteractionsControllerCreate(body: body)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(DefaultSuccessResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Create an interaction.
    /// @description Create an interaction.
    func interactionsControllerCreateV1(body: CreateInteraction) -> AnyPublisher<InteractionsControllerCreateV1Responses, MoyaError> {
        let target = InteractionsControllerCreateV1(body: body)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(DefaultSuccessResponseJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get a list of interactions.
    /// @description Get a list of interactions.
    func interactionsControllerFindAll(clientId: String?) -> AnyPublisher<InteractionsControllerFindAllResponses, MoyaError> {
        let target = InteractionsControllerFindAll(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(InteractionsV2.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get a list of interactions.
    /// @description Get a list of interactions.
    func interactionsControllerFindAllV1(clientId: String?) -> AnyPublisher<InteractionsControllerFindAllV1Responses, MoyaError> {
        let target = InteractionsControllerFindAllV1(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(InteractionsJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get a list of newsletters.
    /// @description Get a list of newsletters.
    func newslettersControllerFindAll(clientId: String?) -> AnyPublisher<NewslettersControllerFindAllResponses, MoyaError> {
        let target = NewslettersControllerFindAll(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(NewslettersJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get a list of newsletters.
    /// @description Get a list of newsletters.
    func newslettersControllerFindAllV2(clientId: String?) -> AnyPublisher<NewslettersControllerFindAllV2Responses, MoyaError> {
        let target = NewslettersControllerFindAllV2(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(NewslettersV2.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Delete a note by note id.
    /// @description Delete a note by note id.
    func notesControllerDelete(noteId: String) -> AnyPublisher<NotesControllerDeleteResponses, MoyaError> {
        let target = NotesControllerDelete(noteId: noteId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(EmptyJSONJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Edit a note by note id.
    /// @description Edit a note by note id.
    func notesControllerUpdate(noteId: String, body: ClientNoteEdit) -> AnyPublisher<NotesControllerUpdateResponses, MoyaError> {
        let target = NotesControllerUpdate(noteId: noteId, body: body)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(EmptyJSONJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Create a notification.
    /// @description Create a notification.
    func notificationsControllerCreate(createNotificationBody: CreateNotificationBody) -> AnyPublisher<NotificationsControllerCreateResponses, MoyaError> {
        let target = NotificationsControllerCreate(createNotificationBody: createNotificationBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(DefaultSuccessResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get the list of all notifications.
    /// @description Get the list of all notifications.
    func notificationsControllerFindAll(read: Bool?, createdAfter: ISO8601DateTime?, createdBefore: ISO8601DateTime?) -> AnyPublisher<NotificationsControllerFindAllResponses, MoyaError> {
        let target = NotificationsControllerFindAll(read: read, createdAfter: createdAfter, createdBefore: createdBefore)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(Notifications.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Update some notification fields.
    /// @description Update some notification fields.
    func notificationsControllerPatch(notificationId: String, patchNotificationBody: PatchNotificationBody) -> AnyPublisher<NotificationsControllerPatchResponses, MoyaError> {
        let target = NotificationsControllerPatch(notificationId: notificationId, patchNotificationBody: patchNotificationBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get the list of all NPS Feedbacks.
    /// @description Get the list of all NpsFeedbacks for a given client.
    func npsControllerFindAll(clientId: String) -> AnyPublisher<NpsControllerFindAllResponses, MoyaError> {
        let target = NpsControllerFindAll(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(NpsFeedbacks.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get one NpsFeedback from its id.
    /// @description Get one NpsFeedback from its id
    func npsControllerFindOne(npsId: String) -> AnyPublisher<NpsControllerFindOneResponses, MoyaError> {
        let target = NpsControllerFindOne(npsId: npsId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(NpsFeedbackDetails.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Update an appointment with a CA id or a Store id
    /// @description Update an appointment with a CA id or a Store id
    func patchAppointmentsV1AppointmentsUnassignedAppointmentId(appointmentId: String, assignAppointmentBody: AssignAppointmentBody) -> AnyPublisher<PatchAppointmentsV1AppointmentsUnassignedAppointmentIdResponses, MoyaError> {
        let target = PatchAppointmentsV1AppointmentsUnassignedAppointmentId(appointmentId: appointmentId, assignAppointmentBody: assignAppointmentBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(DefaultSuccessResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Edit an appointment
    /// @description Edit an appointment
    func patchAppointmentsV1AppointmentsAppointmentId(appointmentId: String, editAppointmentBody: EditAppointmentBody) -> AnyPublisher<PatchAppointmentsV1AppointmentsAppointmentIdResponses, MoyaError> {
        let target = PatchAppointmentsV1AppointmentsAppointmentId(appointmentId: appointmentId, editAppointmentBody: editAppointmentBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Create an appointment for the currently logged in user
    /// @description Create an appointment for the currently logged in user
    func postAppointmentsV1Appointments(createAppointmentBody: CreateAppointmentBody) -> AnyPublisher<PostAppointmentsV1AppointmentsResponses, MoyaError> {
        let target = PostAppointmentsV1Appointments(createAppointmentBody: createAppointmentBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(DefaultSuccessResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Create a new link for a one to one consultation.
    /// @description Create a new link for a one to one consultation using Bambuser.
    func postConsultationV2ConsultationConnectLinks(createConnectLinkBody: CreateConnectLinkBody) -> AnyPublisher<PostConsultationV2ConsultationConnectLinksResponses, MoyaError> {
        let target = PostConsultationV2ConsultationConnectLinks(createConnectLinkBody: createConnectLinkBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(DefaultSuccessResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Create an order
    /// @description Create an order.
    func postOrdersV1Orders(orderCreationBody: OrderCreationBody) -> AnyPublisher<PostOrdersV1OrdersResponses, MoyaError> {
        let target = PostOrdersV1Orders(orderCreationBody: orderCreationBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(OrderCreationResponse.self, using: JSONDecoder.withISO8601Date)
                    return .orderCreationResponse(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Create a payment link
    /// @description Create a payment link.
    func postOrdersV1PaymentsLinks(paymentCreationBody: PaymentCreationBody) -> AnyPublisher<PostOrdersV1PaymentsLinksResponses, MoyaError> {
        let target = PostOrdersV1PaymentsLinks(paymentCreationBody: paymentCreationBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(PaymentLink.self, using: JSONDecoder.withISO8601Date)
                    return .paymentLinkCreationResponse(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Process payment service provider payment response
    /// @description Process the response of the payment service provider (PSP) regarding a payment.
    /// The process might include updating an Order Management System (OMS) and notifying clients about the status of the payment.
    /// ```
    func postOrdersV1PaymentsLinksCallback(paymentNotificationWebhookBody: PaymentNotificationWebhookBody?) -> AnyPublisher<PostOrdersV1PaymentsLinksCallbackResponses, MoyaError> {
        let target = PostOrdersV1PaymentsLinksCallback(paymentNotificationWebhookBody: paymentNotificationWebhookBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(String.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(String.self, using: JSONDecoder.withISO8601Date)
                    return .status500(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Update link for a one to one consultation.
    /// @description Update a link for a one to one consultation within Bambuser.
    func putConsultationV2ConsultationConnectLinksExternalId(externalId: String, updateConnectLinkBody: UpdateConnectLinkBody) -> AnyPublisher<PutConsultationV2ConsultationConnectLinksExternalIdResponses, MoyaError> {
        let target = PutConsultationV2ConsultationConnectLinksExternalId(externalId: externalId, updateConnectLinkBody: updateConnectLinkBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Register device's token to the connected user.
    /// @description Register device's Firebase token to the connected user.
    /// * If the token already exists for the requesting user, updates its last_updated field.
    /// * If the token already exists for a different user, deletes the token from his user and adds it to the requesting user.
    func registerToNotifications(registerToNotificationsBody: RegisterToNotificationsBody?) -> AnyPublisher<RegisterToNotificationsResponses, MoyaError> {
        let target = RegisterToNotifications(registerToNotificationsBody: registerToNotificationsBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get current user subscription.
    /// @description Get current user subscription.
    func subscriptionControllerFind() -> AnyPublisher<SubscriptionControllerFindResponses, MoyaError> {
        let target = SubscriptionControllerFind()
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(Subscription.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Update some fields of current user subscription.
    /// @description Update some fields of current user subscription. The subscription is created for current user if none exists.
    func subscriptionControllerPatch(patchSubscriptionBody: PatchSubscriptionBody) -> AnyPublisher<SubscriptionControllerPatchResponses, MoyaError> {
        let target = SubscriptionControllerPatch(patchSubscriptionBody: patchSubscriptionBody)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get saved templates.
    /// @description Get saved templates.
    func templatesControllerFindAll(category: TemplatesControllerFindAll.Category?) -> AnyPublisher<TemplatesControllerFindAllResponses, MoyaError> {
        let target = TemplatesControllerFindAll(category: category)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(OutreachTemplatesJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get a list of transactions.
    /// @description Get a list of transactions.
    func transactionsControllerFindAll(clientId: String?) -> AnyPublisher<TransactionsControllerFindAllResponses, MoyaError> {
        let target = TransactionsControllerFindAll(clientId: clientId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(TransactionsJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get a list of transactions.
    /// @description Get a list of transactions.
    func transactionsControllerFindAllV2(transactionIds: String?, paymentIds: String?) -> AnyPublisher<TransactionsControllerFindAllV2Responses, MoyaError> {
        let target = TransactionsControllerFindAllV2(transactionIds: transactionIds, paymentIds: paymentIds)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(TransactionsV2.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get a transaction by id.
    func transactionsControllerFindOne(transactionId: String, externalImages: Bool?) -> AnyPublisher<TransactionsControllerFindOneResponses, MoyaError> {
        let target = TransactionsControllerFindOne(transactionId: transactionId, externalImages: externalImages)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(TransactionJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get an transaction by id
    func transactionsControllerFindOneV2(transactionId: String) -> AnyPublisher<TransactionsControllerFindOneV2Responses, MoyaError> {
        let target = TransactionsControllerFindOneV2(transactionId: transactionId)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(TransactionV2.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 400:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .badRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .notFoundError(val)
                case 500:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .internalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Unregister a token from the connected user.
    /// @description Unregister a Firebase token from the connected user.
    func unregisterToNotifications(token: Token) -> AnyPublisher<UnregisterToNotificationsResponses, MoyaError> {
        let target = UnregisterToNotifications(token: token)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 204:
                    let val: Void = ()
                    return .status204(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Generate a new unique link for current advisor.
    /// @description Generate a new unique link for current advisor.
    func urlControllerBuildUniqueUrl() -> AnyPublisher<UrlControllerBuildUniqueUrlResponses, MoyaError> {
        let target = UrlControllerBuildUniqueUrl()
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 201:
                    let val = try response.mkMap(CreateLinkResponse.self, using: JSONDecoder.withISO8601Date)
                    return .status201(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Redirect to the full link from given link id.
    /// @description Redirect to the full link from given link id.
    func urlControllerRedirect(q: String) -> AnyPublisher<UrlControllerRedirectResponses, MoyaError> {
        let target = UrlControllerRedirect(q: q)
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 302:
                    let val: Void = ()
                    return .status302(val)
                case 400:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendBadRequestError(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 404:
                    let val = try response.mkMap(JSendFail.self, using: JSONDecoder.withISO8601Date)
                    return .jSendNotFoundError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

    /// @summary Get information about the logged in user.
    /// @description Get information about the logged in user.
    func usersControllerFindCurrent() -> AnyPublisher<UsersControllerFindCurrentResponses, MoyaError> {
        let target = UsersControllerFindCurrent()
        return self.buildRequest(for: target)
            .tryMap { response in
                switch response.statusCode {
                case 200:
                    let val = try response.mkMap(UserInfoJSendSuccess.self, using: JSONDecoder.withISO8601Date)
                    return .status200(val)
                case 401:
                    let val = try response.mkMap(JSON.self, using: JSONDecoder.withISO8601Date)
                    return .unauthorizedError(val)
                case 500:
                    let val = try response.mkMap(JSendError.self, using: JSONDecoder.withISO8601Date)
                    return .jSendInternalServerError(val)
                default:
                    throw MoyaError.statusCode(response)
                }
            }
            .mapError { return $0 as? MoyaError ?? MoyaError.underlying($0, nil) }
            .eraseToAnyPublisher()
    }

}
