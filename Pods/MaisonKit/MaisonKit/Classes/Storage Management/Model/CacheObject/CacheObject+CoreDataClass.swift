// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import CoreData

class CacheObject: NSManagedObject, NSManagedObjectBasic {
    static var entityName: String = "CacheObject"

    @discardableResult
    static func upsertCacheObject<AnyCodable: Codable>(id: String, data: AnyCodable?, type: String? = nil) -> CacheObject? {
        guard let data = data, let json = ModelUtils.toJson(data: data) else {
            return nil
        }
        return upsertCacheObject(id: id, json: json, type: type)
    }

    static func upsertCacheObject(id: String, json: String, type: String? = nil) -> CacheObject? {
        var cacheEntity = getRecord(by: id) as? CacheObject
        if cacheEntity == nil {
            cacheEntity =  CoreDataUtils.createNewObject(entityName) as? CacheObject
        }

        cacheEntity?.id = id
        cacheEntity?.json = json
        cacheEntity?.createdDate = Date()
        cacheEntity?.type = type

        _ = CoreDataUtils.sharedInstance.saveContext()
        return cacheEntity
    }

    static func getLocalCache<AnyCodable: Codable>(by id: String, validityHours: Int) -> AnyCodable? {

        guard let cacheObj = CacheObject.getRecord(by: id) as? CacheObject else {
            return nil
        }

        if validateHourDifference(createdDate: cacheObj.createdDate, difference: validityHours) {
            return nil
        }

        return getCacheJson(by: id)
    }

    static private func validateHourDifference(createdDate: Date, difference: Int) -> Bool {
        let hourDifference = getDateDiff(savedDate: createdDate)
        return difference > hourDifference
    }

    static func getCacheJson<AnyCodable: Codable>(by id: String) -> AnyCodable? {
        if let record = CacheObject.getRecord(by: id) as? CacheObject {
            return ModelUtils.fromJson(stringData: record.json) as AnyCodable?
        }
        return nil
    }

    // TODO: create general Date extension for these type of fuctions?
    static func getDateDiff(savedDate: Date) -> Int {
        let cal = Calendar.current
        let components = cal.dateComponents([.hour], from: savedDate, to: Date())
        let diff = components.hour!
        return diff
    }
}
