// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI
import SwiftUI

/// A struct to hold the generic form field.
public struct GFField<Object> {
    /// This makeBody function which creates the main field view.
    let makeBody: (Binding<Object>, Bool, @escaping (ActionType) -> Void) -> AnyView

    /// Validation closure manages the field validation.
    let validationClosure: ((Object) -> Bool)?

    /// A constructor to create the generic form field and in addition to recieve a closure to open a scene in a different page.
    /// - Parameters:
    ///   - validationClosure: Optional field validation.
    ///   - makeBody: A closure that should build and return the field view.
    ///   This closure gets the binding data, a boolean for isReadOnly and action type to perform.
    public init<ViewType: View>(validationClosure: ((Object) -> Bool)? = nil,
                                makeBody: @escaping (Binding<Object>, Bool, @escaping (ActionType) -> Void) -> ViewType) {
        self.makeBody = { binding, isReadOnly, closure in
            let wrappedClosure: (ActionType) -> Void = { (actionType: ActionType) in
                closure(actionType)
            }
            return makeBody(binding, isReadOnly, wrappedClosure).eraseToAnyView()
        }
        self.validationClosure = validationClosure
    }
}

public extension GFField {

    /// A constructor to create the generic form field and in addition to recieve a closure to open a scene in a different page.
    /// - Parameters:
    ///   - validationClosure: Optional field validation.
    ///   - makeBody: A closure that should build and return the field view.
    ///   This closure gets the binding data, a boolean for isReadOnly and present scene function to open a scene in a different page.
    init<ViewType: View, SceneType: Scene>(validationClosure: ((Object) -> Bool)? = nil,
                                           makeBody: @escaping (Binding<Object>, Bool, @escaping (SceneType) -> Void) -> ViewType) {
        self.makeBody = { binding, isReadOnly, closure in
            let wrappedClosure: (SceneType) -> Void = { (scene: SceneType) in
                let actionType: ActionType = .sceneProvider(sceneFactory: { _ in AnyScene(scene: scene) },
                                                            preferredPresentationStyle: .modal)
                closure(actionType)
            }
            return makeBody(binding, isReadOnly, wrappedClosure).eraseToAnyView()
        }
        self.validationClosure = validationClosure
    }

    /// A constructor to create the generic form field.
    /// - Parameters:
    ///   - validationClosure: Optional field validation.
    ///   - makeBody: A closure that should build and return the field view. This closure gets the binding data and a boolean for isReadOnly.
    init<ViewType: View>(validationClosure: ((Object) -> Bool)? = nil,
                         makeBody: @escaping (Binding<Object>, Bool) -> ViewType) {
        self.makeBody = { binding, isReadOnly, _ in
            return makeBody(binding, isReadOnly).eraseToAnyView()
        }
        self.validationClosure = validationClosure
    }
}

public extension GFField {
    /// A static function to convert validation by a specific key path to validation closure on the full data object.
    /// - Parameters:
    ///   - validator: The validation struct for a specific value.
    ///   - keyPath: The object key path the validation should be applyed on.
    /// - Returns: The validation closure that gets the generic for object and return whether the object is valid or not.
    static func buildValidationClosure<T>(for validator: Validation<T>?,
                                          keyPath: WritableKeyPath<Object, T>) -> ((Object) -> Bool)? {
        guard let validator = validator else { return nil }
        return { object in
            return validator.closure(object[keyPath: keyPath])
        }
    }
}

/// A struct to handle field validation by the field type.
public struct Validation<T> {
    /// A closure to define the field validation by the field value.
    public let closure: (T) -> Bool
    /// Whether to show the required field indicator or not.
    public let showIndicator: Bool

    /// A constructor to create the field validation by the field type.
    /// - Parameters:
    ///   - closure: A closure to define the field validation by the field value.
    ///   - showIndicator: Whether to show the required field indicator or not.
    public init(closure: @escaping (T) -> Bool, showIndicator: Bool) {
        self.closure = closure
        self.showIndicator = showIndicator
    }
}
