// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

struct SafeBinding<T: RandomAccessCollection & MutableCollection, C: View>: View {

   typealias BoundElement = Binding<T.Element>
   private let binding: BoundElement
   private let content: (BoundElement) -> C

   init(_ binding: Binding<T>, index: T.Index, @ViewBuilder content: @escaping (BoundElement) -> C) {
      self.content = content
      self.binding = .init(get: { binding.wrappedValue[index] },
                           set: { binding.wrappedValue[index] = $0 })
   }

   var body: some View {
       self.content(self.binding)
   }
}
