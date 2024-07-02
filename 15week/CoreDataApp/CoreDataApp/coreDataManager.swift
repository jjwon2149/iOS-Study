//
//  coreDataManager.swift
//  CoreDataApp
//
//  Created by 정종원 on 7/2/24.
//

import Foundation
import CoreData

class coreDataManager {
    let persistentContainer: NSPersistentContainer
    init() {
        persistentContainer = NSPersistentContainer(name: "CoreDataApp")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Failed to Initialize \(error.localizedDescription)")
            }
        }
    }
}
