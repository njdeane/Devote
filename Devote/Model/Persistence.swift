//
//  Persistence.swift
//  Devote
//
//  Created by Nic Deane on 25/9/21.
//

import CoreData

struct PersistenceController {
  
  // MARK: - 1. PERSISTENT CONTROLLER (Singleton for entire app to use)
  static let shared = PersistenceController()
  
  // MARK: - 2. PERSISTENT CONTAINTER (Storage container)
  let container: NSPersistentContainer
  
  // MARK: - 3. INITIALIZATION (Load the persistent store)
  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "Devote")
    if inMemory {
      container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null") // This is temporary memory (Good for testing)
    }
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in // This is persistent storage (SQLite store)
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
  }
  
  // MARK: - 4. PREVIEW (Test config for SwiftUI Preview)
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    for _ in 0..<10 {
      let newItem = Item(context: viewContext)
      newItem.timestamp = Date()
    }
    do {
      try viewContext.save()
    } catch {
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
    return result
  }()
}
