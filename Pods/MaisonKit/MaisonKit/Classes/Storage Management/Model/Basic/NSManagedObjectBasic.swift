// Copyright © 2020 LVMH. All rights reserved.

import CoreData

protocol NSManagedObjectBasic {
    static var entityName: String {get}
}

extension NSManagedObjectBasic {
    static func getRecord(by id: String, sortDescriptors: [NSSortDescriptor]? = nil) -> NSManagedObject? {
        if let items = getRecords(by: [id], sortDescriptors: sortDescriptors) {
            return items[0]
        }
        return nil
    }

    static func getRecords(by ids: [String]? = nil,
                           sortDescriptors: [NSSortDescriptor]? = nil,
                           context: NSManagedObjectContext =
        CoreDataUtils.sharedInstance.persistentContainer.viewContext) -> [NSManagedObject]? {

        let templatetFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        if let ids = ids {
            let pred = NSPredicate(format: "id IN %@", ids)
            templatetFetch.predicate = pred
        }

        templatetFetch.sortDescriptors = sortDescriptors

        do {
            if let fetchedRecords = try context.fetch(templatetFetch) as? [NSManagedObject] {
                if fetchedRecords.count > 0 {
                    return fetchedRecords
                }
                return nil
            }
            return nil
        } catch {
            return nil
        }
    }
}
