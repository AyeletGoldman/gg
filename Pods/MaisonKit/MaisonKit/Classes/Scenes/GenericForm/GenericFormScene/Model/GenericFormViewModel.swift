// Copyright © 2021 LVMH. All rights reserved.

import Combine

private enum Labels {
    static let saveErrorAlertTitle = MKLocalizedString("generic-form.save.error.title",
                                                       comment: "Title for alert shown when saving a generic form")
    static let saveErrorAlertMessageFormat = MKLocalizedString("generic-form.save.error.message",
                                                               comment: "Message for alert shown when saving a generic form")
}

/// Viewmodel is used to manage the logic and the interactions for the generic form.
open class GenericFormViewModel<Object>: ObservableObject {

    /// Holds the sections in the form
    @Published public var sections: ResultState<[FormSection<Object>], ErrorDisplayable> = .waiting

    /// Holds the fields in the form.
    @available(*, unavailable, message: "Deprecated on version 0.21.0. Use sections instead")
    @Published public var fields: ResultState<[GFField<Object>], ErrorDisplayable> = .waiting
    /// The data object that would be applied into the fields by KeyPath
    @Published public var data: Object

    /// Whether the form should be only for read or if it's editable
    let isReadOnly: Bool

    private let router: GenericFormRouter

    /// While the form is in the process of saving the data. The form should be disabled until the process is done.
    @Published public var isSaving = false
    /// Whether the form data is valid or not. The save button should be disabled in case the form data is invalid.
    @Published public private(set) var isValidForm = false
    /// The alert context of the generic form, to present alert popups.
    @Published public var alertContext: AlertContext?

    private var cancellables = Set<AnyCancellable>()

    /// Creates a new simple GenericFormViewModel
    /// - Parameters:
    ///   - data: The data object that would be applyed into the fields by KeyPath
    ///   - isReadOnly: Whether the form should be only for read or if it's editable
    ///   - router: The generic form router
    public init(data: Object,
                isReadOnly: Bool = false,
                router: GenericFormRouter) {
        self.data = data
        self.isReadOnly = isReadOnly
        self.router = router

        self.setupValidationSubscription()
    }

    /// Create a new `GenericFormViewModel` with the given sections.
    /// - Parameters:
    ///   - sections: the sections to display in this form.
    ///   - data: The data object that would be applyed into the fields by KeyPath
    ///   - isReadOnly: Whether the form should be only for read or if it's editable
    ///   - router: The generic form router
    public init(sections: [FormSection<Object>],
                data: Object,
                isReadOnly: Bool = false,
                router: GenericFormRouter) {
        self.data = data
        self.isReadOnly = isReadOnly
        self.router = router
        self.sections = .found(sections)

        self.setupValidationSubscription()
    }

    /// Create a new `GenericFormViewModel` with the given publisher that will define the content of the sections.
    /// - Parameters:
    ///   - sectionsDataSource: a publisher that this view model will observe to populate the sections for the form.
    ///   - data: The data object that would be applyed into the fields by KeyPath
    ///   - isReadOnly: Whether the form should be only for read or if it's editable
    ///   - router: The generic form router
    public init(sectionsDataSource: AnyPublisher<[FormSection<Object>], Never>,
                data: Object,
                isReadOnly: Bool = false,
                router: GenericFormRouter) {
        self.data = data
        self.isReadOnly = isReadOnly
        self.router = router

        sectionsDataSource
            .map { .found($0) }
            .weakAssign(to: \.sections, on: self)
            .store(in: &self.cancellables)

        self.setupValidationSubscription()
    }

    /// Creates a new GenericFormViewModel with fields data source
    /// - Parameters:
    ///   - resultSectionsDataSource: A publisher with a result state list of sections to show
    ///   - data: The data object that would be applyed into the fields by KeyPath
    ///   - isReadOnly: Whether the form should be only for read or if it's editable
    ///   - router: The generic form router
    public init(resultSectionsDataSource: AnyPublisher<ResultState<[FormSection<Object>], ErrorDisplayable>, Never>,
                data: Object,
                isReadOnly: Bool = false,
                router: GenericFormRouter) {
        self.data = data
        self.isReadOnly = isReadOnly
        self.router = router

        resultSectionsDataSource
            .weakAssign(to: \.sections, on: self)
            .store(in: &self.cancellables)

        self.setupValidationSubscription()
    }

    /// Creates a new simple GenericFormViewModel
    /// - Parameters:
    ///   - fields: A list of fields to show
    ///   - data: The data object that would be applyed into the fields by KeyPath
    ///   - isReadOnly: Whether the form should be only for read or if it's editable
    ///   - router: The generic form router
    public init(fields: [GFField<Object>],
                data: Object,
                isReadOnly: Bool = false,
                router: GenericFormRouter) {
        self.data = data
        self.isReadOnly = isReadOnly
        self.router = router

        self.sections = .found([FormSection(fields: fields)])

        self.setupValidationSubscription()
    }

    /// Creates a new GenericFormScene with fields data source
    /// - Parameters:
    ///   - fieldsDataSource: A publisher with a list of fields to show
    ///   - data: The data object that would be applyed into the fields by KeyPath
    ///   - isReadOnly: Whether the form should be only for read or if it's editable
    ///   - router: The generic form router
    public init(fieldsDataSource: AnyPublisher<[GFField<Object>], Never>,
                data: Object,
                isReadOnly: Bool = false,
                router: GenericFormRouter) {
        self.data = data
        self.isReadOnly = isReadOnly
        self.router = router

        fieldsDataSource
            .map { .found([FormSection(fields: $0)]) }
            .weakAssign(to: \.sections, on: self)
            .store(in: &self.cancellables)

        self.setupValidationSubscription()
    }

    /// Creates a new GenericFormViewModel with fields data source
    /// - Parameters:
    ///   - resultFieldsDataSource: A publisher with a result state list of fields to show
    ///   - data: The data object that would be applyed into the fields by KeyPath
    ///   - isReadOnly: Whether the form should be only for read or if it's editable
    ///   - router: The generic form router
    public init(resultFieldsDataSource: AnyPublisher<ResultState<[GFField<Object>], ErrorDisplayable>, Never>,
                data: Object,
                isReadOnly: Bool = false,
                router: GenericFormRouter) {
        self.data = data
        self.isReadOnly = isReadOnly
        self.router = router

        resultFieldsDataSource
            .map {
                switch $0 {
                case .found(let fields):
                    return .found([FormSection(fields: fields)])
                case .waiting:
                    return .waiting
                case .failed(let error):
                    return .failed(error)
                case .loading(let fields):
                    return .loading(fields.map { [FormSection(fields: $0)] })
                }
            }
            .weakAssign(to: \.sections, on: self)
            .store(in: &self.cancellables)

        self.setupValidationSubscription()
    }

    private func setupValidationSubscription() {
        self.$data
            .map { [weak self] data in
                guard let self = self, !self.isReadOnly else { return true }
                guard let sections = self.sections.value else { return false }
                return sections.flatMap { $0.fields }
                    .map { $0.validationClosure?(data) }
                    .filter { $0 == false }.isEmpty
            }.assign(to: &self.$isValidForm)
    }

    /// Shows the given error in a system alert.
    /// - Parameter error: the error from which we will get the title and message for the alert.
    /// If any of the properties are missing or empty, MaisonKit will show a default value.
    open func showSavingError(_ error: ErrorDisplayable) {
        let title: String = {
            if let title = error.localizedTitle {
                return title.isEmpty ? Labels.saveErrorAlertTitle : title
            } else {
                return Labels.saveErrorAlertTitle
            }
        }()
        self.alertContext = AlertContext(
            title: title,
            message: String(format: Labels.saveErrorAlertMessageFormat, error.localizedDescription),
            primaryButton: .ok()
        )
    }

    /// A function designed to be overridden by subclasses of this view model
    /// This function is called when the form first appears, to allow the view model to fetch the data it requires
    open func onAppear() { }
}

extension GenericFormViewModel: ActionHandlerViewModel {
    var actionHandlingRouter: ActionScenePresenterRouter { return self.router }
}
