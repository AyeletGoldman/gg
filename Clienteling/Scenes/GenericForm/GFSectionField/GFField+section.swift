// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import MaisonKit

extension GFField {
    
    static func section(title: String, buttonsData: [ButtonData] = []) -> GFField {
        return GFField(validationClosure: nil) { object, _ in
            GFSectionFieldView(title: title, buttonsData: buttonsData)
        }
    }
    
    static func section(title: String, actions: [ContextualAction]) -> GFField {
            return GFField(validationClosure: nil) { (_, _, onPresentScene: @escaping ((AnyScene) -> Void)) -> GFSectionFieldView in
                let buttonsData: [ButtonData] = actions.map { anyAction in
                    let buttonAction = {
                        switch anyAction.type {
                        case .sceneProvider(let sceneFactory, _):
                            onPresentScene(sceneFactory({ _ in }))
                        case .actionExecutor(let action):
                            action()
                        default:
                            break
                        }
                    }
                    return ButtonData(label: anyAction.localizedTitle, icon: anyAction.imageIdentifier, action: buttonAction)
                }
                return GFSectionFieldView(title: title, buttonsData: buttonsData)
            }
        }
    
}
