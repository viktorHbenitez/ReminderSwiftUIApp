import CoreData

// Create a manage objects subclass for the reminder entity
extension Reminder {
    // @NSManaged var title = this property is handled by Core Data
    @NSManaged var title: String
    @NSManaged var isCompleted: Bool
    @NSManaged var notes: String?
    @NSManaged var dueDate: Date?
    @NSManaged var priority: Int16

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminder> {
        return NSFetchRequest<Reminder>(entityName: "Reminder")
    }
}
