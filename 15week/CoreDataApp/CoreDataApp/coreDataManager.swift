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
        persistentContainer.loadPersistentStores { <#NSPersistentStoreDescription#>, <#(any Error)?#> in
            <#code#>
        }
    }
}
