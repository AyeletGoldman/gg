//
//  ClientInfoViewModel.swift
//  Zenith Clienteling Dev
//
//  Created by Noy Barak on 12/01/2022.
//
import MaisonKit
import Combine
import Biodag

struct ClientDetailsDisplayable {
    let sections: [FieldsSection]
    let allowEdit: Bool
}

class ClientInfoViewModel: GenericFormViewModel<ClientInfoData> {
    
    private let router: ClientInfoRouter
    private let clientId: String
    private var clientDetailsData: ResultState<[FieldsSection], ErrorDisplayable> = .waiting
    @Published var allowEdit = false
    private var cancellables = Set<AnyCancellable>()
    
    @Inject private var client360InfoAdapter: Client360InfoAdapter

    init(router: ClientInfoRouter, clientId: String) {
        self.router = router
        self.clientId = clientId
        let data: ClientInfoData = .init(clientId: clientId)
        super.init(
            resultFieldsDataSource: data.$fields.eraseToAnyPublisher(),
            data: data,
            isReadOnly: true,
            router: router)
    }
    
    func presentEditForm() {
        guard let clientDetailsDataValue = self.clientDetailsData.value else {
            return
        }
        self.router.presentEditForm(clientId: self.clientId,
                                    clientDetailsData: clientDetailsDataValue,
                                    onDone: { [weak self] didSave in
            if didSave {
                if let clientId = self?.clientId {
                    self?.featchClientInfo(by: clientId)
                }
                Analytics.log(SaveClientInformationEvent())
            }
        })
    }
    
    private func featchClientInfo(by clientId: String) {
        self.clientDetailsData = .loading(nil)
        self.data.setLoadingFields()
        self.client360InfoAdapter.getClientDetails(clientId: self.clientId)
            .catch { error in
                return Just(.failure(ErrorDisplayable(error)))
            }
            .sink(receiveValue: { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.clientDetailsData = .failed(error)
                    self?.data.fields = .failed(error)
                case .success(let displayable):
                    self?.clientDetailsData = .found(displayable.sections)
                    self?.data.setFields(fields: displayable.sections)
                    self?.allowEdit = displayable.allowEdit
                }
            }).store(in: &self.cancellables)
    }
    
    override func onAppear() {
        self.featchClientInfo(by: self.clientId)
    }
}
