//

import Foundation
import CoreData

class CoreDataManger {
    static func saveData(title: String,
                         notes: String?,
                         date: Date?,
                         priority: ReminderPriority,
                         isCompleted: Bool = false,
                         using viewContext: NSManagedObjectContext) {

        let item = Reminder(context: viewContext)
        item.title = title
        item.notes = notes
        item.dueDate = date
        item.priority = priority.rawValue
        item.isCompleted = isCompleted

        do {
            try viewContext.save()
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
}
