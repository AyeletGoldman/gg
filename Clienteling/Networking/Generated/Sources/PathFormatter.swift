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

 struct PathFormatter {

     init() { }

     func format(value: Any) -> String {
         if let arr = value as? [Any] {
             return arr.map { String(describing: $0) }.joined(separator: ",")
         }
         return String(describing: value)
     }

 }