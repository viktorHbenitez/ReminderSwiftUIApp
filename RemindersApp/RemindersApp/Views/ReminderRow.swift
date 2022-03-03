//

import SwiftUI
import CoreData

struct ReminderRow: View {
    let reminder: ReminderViewModel
    @State var isCompleted: Bool = false

    var body: some View {
        HStack {
            Button(action: {
                isCompleted.toggle()
            }) {
                ReminderStatusView(isChecked: $isCompleted)
            }
            Text("\(reminder.priority.shortDisplay) \(reminder.title)")
            Spacer()
        }
    }
}

struct ReminderRow_Previews: PreviewProvider {
    static var previews: some View {
        let container = NSPersistentContainer(name: "Reminders")
        container.loadPersistentStores { (storeDescription, error) in
          if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
          }
        }
        let context = container.viewContext
        let newReminder = Reminder(context: context)
        newReminder.title = "Some task"
        return ReminderRow(reminder: ReminderViewModel(itemModel: newReminder))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
