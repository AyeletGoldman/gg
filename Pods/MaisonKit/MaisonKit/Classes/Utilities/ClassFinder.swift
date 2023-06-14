// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// BEWARE: The Objective-C runtime lurks around here.
/// This is a bit of black-magic-fuckery to get around having to add code in the app delegate for every module we have in MaisonKit.
/// What we're going to do is get every class that conforms to a specific protocol and call the protocol's implementation.
/// This gives us the ability to have one line in the app delegate like `MaisonKit.initialize()` that then
/// runs through all installed modules/subspecs and initializes all the ones that want initialized.
struct ClassFinder {

    // Filters down the classes given to only the ones that conform to the given protocol.
    func getClassesImplementingProtocol(from classes: [AnyClass], proto: Protocol) -> [AnyClass] {
        return classes.filter { cls in
            return class_conformsToProtocol(cls, proto)
        }
    }

    // Gets an array of all classes available to the Objective-C runtime.
    func getClassList() -> [AnyClass] {
        // Find out how much memory we'll need, and then double it, for safety's sake.
        let expectedClassCount = objc_getClassList(nil, 0) * 2

        //  Allocate memory for all classes (times two)
        let allClasses = UnsafeMutablePointer<AnyClass>.allocate(capacity: Int(expectedClassCount))

        defer { allClasses.deallocate() }

        // Shouldn't this come for free?
        let autoreleasingAllClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(allClasses)
        // Get the number of classes we need.
        let actualClassCount = objc_getClassList(autoreleasingAllClasses, expectedClassCount)

        // expectedClassCount should always be > than actualClassCount, but, you know, the runtime scares me.
        let count = min(actualClassCount, expectedClassCount)

        // Loop thorugh all the classes we think we have and add them to the array
        var classes = [AnyClass]()
        for index in 0 ..< count {
            let currentClass: AnyClass = allClasses[Int(index)]
            classes.append(currentClass)
        }

        return classes
    }
}
