//

import Foundation
import CoreData
import SwiftUI

class CoreDataManger {
//    @Environment (\.managedObjectContext) var context: NSManagedObjectContext
    static let instance = CoreDataManger()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext

    private init() {
        container = NSPersistentContainer(name: "Reminders")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading Core Data \(error)")
            }
        }
        context = container.viewContext
    }

    func fetchData() -> [Reminder] {
        do {
            return try context.fetch(basicFetchRequest())
        } catch let error as NSError {
            fatalError("Error to fetch \(error), \(error.userInfo)")
        }
    }

    func saveData() {
        do {
            try context.save()
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }

    func deleteData(item: Reminder) {
        context.delete(item)
        saveData()
    }

    func basicFetchRequest() -> NSFetchRequest<Reminder> {
        let request = NSFetchRequest<Reminder>(entityName: "Reminder")
        request.sortDescriptors = []
        return request
    }

    func fetchRequestSortedByTitleAndPriority() -> NSFetchRequest<Reminder> {
        let titleSortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        let request: NSFetchRequest<Reminder> = Reminder.fetchRequest()
        request.sortDescriptors = [titleSortDescriptor]
        return request
    }
}
