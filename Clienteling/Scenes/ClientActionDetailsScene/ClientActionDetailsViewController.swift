//
//  ClientActionDetailsViewController.swift
//  Zenith Clienteling
//

import MaisonKit

final class ClientActionDetailsViewController: StylableViewController<ClientActionDetailsView> {

    var actionTitle: String!

    var actionContent: String! {
        didSet {
            self.childView = ClientActionDetailsView(actionContent: self.actionContent)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.actionTitle
    }
}
