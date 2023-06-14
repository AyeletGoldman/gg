// MH Private Clienteling
// 17/08/2022

import Foundation

extension Sequence {
    /// Sort Sequence by a keyPath and a compare operator
    func sorted<T: Comparable>(
        by keyPath: KeyPath<Element, T>,
        _ compare: (T, T) -> Bool = (<)
    ) -> [Element] {
        sorted { lhs, rhs in
            compare(lhs[keyPath: keyPath], rhs[keyPath: keyPath])
        }
    }
}
