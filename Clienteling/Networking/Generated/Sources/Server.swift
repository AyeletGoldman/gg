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

struct Server {
    let url: URL

    init(url: URL) {
        self.url = url
    }
}

extension Server {
    static var selected: Server?
}

extension Server {
    /// Defaults to `Server.selected`.
    /// Set this static var to select custom server for a given operation name.
    static var selectedServerForOperationName: ((String) -> Server) = { _ in
        guard let server = Self.selected else { 
            fatalError("You must set a selected server via `Server.selected`") 
        }
        return server
    }
}

extension Server {
    /// Development server
    static let development = Server(url: URL(string: "https://apis.dev.kenzo.clienteling.lvmhda.com")!)
    /// Staging server
    static let staging = Server(url: URL(string: "https://clienteling-uat.kenzo.com")!)
    /// Production server
    static let production = Server(url: URL(string: "https://clienteling.kenzo.com")!)
}
