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

    func saveReminer(using viewContext: NSManagedObjectContext) {
        print("Title \(text), notes: \(notes), date \(dueDate) priority \(priority)")
        CoreDataManger.saveData(title: text, notes: notes, date: dueDate, priority: priority, using: viewContext)
    }
}


class CreateReminderViewModel: Identifiable {
    let id = UUID()
}
