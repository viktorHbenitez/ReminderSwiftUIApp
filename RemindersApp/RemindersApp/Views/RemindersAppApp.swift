//
//  RemindersAppApp.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 27/02/22.
//

import SwiftUI
import CoreData

@main
struct RemindersAppApp: App {
    var persistentCoreContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "Reminders")
      container.loadPersistentStores { (storeDescription, error) in
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      }
      return container
    }()

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentCoreContainer.viewContext)
        }
    }
}
