// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import CoreData

extension CacheObject {

    @nonobjc class func fetchRequest() -> NSFetchRequest<CacheObject> {
        return NSFetchRequest<CacheObject>(entityName: CacheObject.entityName)
    }

    @NSManaged var id: String
    @NSManaged var type: String?
    @NSManaged var json: String
    @NSManaged var createdDate: Date

}
