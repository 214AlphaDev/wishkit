//
//  WishKitDatabaseFactory.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/14/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import RealmSwift

public struct WishKitDatabaseFactory {
    
    public static func buildDatabase(subjectId: String) throws -> Realm {
        var config = Realm.Configuration.defaultConfiguration
        
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(subjectId)_wishkit")
        
        config.schemaVersion = 1
        config.migrationBlock = { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                // Realm updates everything automatically
            }
        }
        
        return try Realm(configuration: config)
    }
    
}
