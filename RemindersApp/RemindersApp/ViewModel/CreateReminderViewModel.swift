//
//  CreateReminderViewModel.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 28/02/22.
//  
//
import Combine
import CoreData
import Foundation

// ObservableObject: the ViewModel can be an observation target and can send information to the entire application.
class CreateReminderListViewModel: ObservableObject {

    // Add the @Published properties to all the properties of the ViewModel that can trigger an update in the UI.
    var text: String = ""
    var notes: String = ""
    var dueDate: Date = Date()
    @Published var priority: ReminderPriority = .none
    let manager = CoreDataManger.instance

    func saveReminer(isCompleted: Bool = false) {
//        guard text?.isEmpty, notes?.isEmpty else {
//            print("text: \(text), note: \(notes) some of them are empty")
//            return
//        }
//        print("Title \(text), notes: \(notes), date \(dueDate) priority \(priority)")

        let item = Reminder(context: manager.context)
        item.title = text
        item.notes = notes
        item.dueDate = dueDate
        item.priority = priority.rawValue
        item.isCompleted = isCompleted
        manager.saveData()
    }

    func isEmptyReminderItem() -> Bool {
        guard !text.isEmpty, !notes.isEmpty else {
            return false
        }
        return true
    }
}


class CreateReminderViewModel: Identifiable {
    let id = UUID()
}
