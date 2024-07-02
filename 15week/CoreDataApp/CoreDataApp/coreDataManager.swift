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
    
    // Create
    func savePet(name: String, breed: String) {
        let pet = Animal(context: persistentContainer.viewContext)
        pet.name = name
        pet.breed = breed
        do {
            try persistentContainer.viewContext.save()
            print("pet saved!")
        } catch {
            print("Failed to save \(error.localizedDescription)")
        }
    }
    
    // Read
    func getAllPets() -> [Animal] {
        let fetchRequest: NSFetchRequest<Animal> = Animal.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    // Delete
    func deletePet(animal: Animal) {
        persistentContainer.viewContext.delete(animal)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save Error \(error.localizedDescription)")
        }
    }
}
