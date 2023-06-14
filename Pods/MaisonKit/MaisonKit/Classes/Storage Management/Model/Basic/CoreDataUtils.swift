// Copyright © 2020 LVMH. All rights reserved.

import CoreData

class CoreDataUtils {
    static let sharedInstance = CoreDataUtils()
    private let DBName = "local"
    lazy var persistentContainer: NSPersistentContainer = self.loadModel(name: DBName, in: Bundle.maisonKit)

    lazy var backgroundContext: NSManagedObjectContext = {
        let newbackgroundContext = self.persistentContainer.newBackgroundContext()
        newbackgroundContext.automaticallyMergesChangesFromParent = true
        newbackgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return newbackgroundContext
    }()

    func loadModel(name: String, in bundle: Bundle) -> NSPersistentContainer {
        guard let mom = NSManagedObjectModel.mergedModel(from: [bundle]) else {
            fatalError("Not able to find data model")
        }

        let container = NSPersistentContainer(name: name, managedObjectModel: mom)
        container.loadPersistentStores { _, error in
            _ = error.flatMap {_ in
                fatalError("Not able to load store")
            }
        }
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return container
    }

    func saveContext () -> Bool {
        let context = self.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                return true
            } catch {
                return false
            }
        }
        return true
    }

    func rollbackContext() {
        if self.persistentContainer.viewContext.hasChanges {
            self.persistentContainer.viewContext.rollback()
        }
    }

    // TODO: Handle return value in completion block if the recursive save was successful.
    func saveContext(context: NSManagedObjectContext) {
        if context.hasChanges {
            context.performAndWait({
                do {
                    try context.save()
                    if let parent = context.parent {
                        self.saveContext(context: parent)
                    }
                } catch let error as NSError {
                    print("Could not save: \(error)")
                }
            })
        }
    }

    func createChildContext() -> NSManagedObjectContext {
        let childContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        childContext.automaticallyMergesChangesFromParent = true
        childContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        childContext.parent = self.persistentContainer.viewContext

        return childContext
    }

    func deleteAllData (excludeObj: [String]) -> Bool {
        var didSucceed = false
        let entitiesByName = self.persistentContainer.persistentStoreCoordinator.managedObjectModel.entitiesByName
        for (entityName, _) in entitiesByName where !excludeObj.contains(entityName) {
            didSucceed = self.deleteAllInstance(of: entityName)
        }
        return didSucceed && self.saveContext()
    }

    func deleteAllInstance(of entity: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        return self.deleteFetchRequest(fetchRequest)
    }

    func deleteItem(item: NSManagedObject) -> Bool {
        persistentContainer.viewContext.delete(item)
        return self.saveContext()
    }

    func deleteAllObjects(entity: NSEntityDescription) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entity
        return self.deleteFetchRequest(fetchRequest)
    }

    private func deleteFetchRequest(_ request: NSFetchRequest<NSFetchRequestResult>) -> Bool {
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)

        do {
            try self.persistentContainer.persistentStoreCoordinator.execute(deleteRequest,
                                                                            with: persistentContainer.viewContext)
            return self.saveContext()
        } catch {
            return false
        }
    }

    static func createNewObject(_ entityName: String) -> NSManagedObject {
        let context = self.sharedInstance.persistentContainer.viewContext

        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
    }

}
