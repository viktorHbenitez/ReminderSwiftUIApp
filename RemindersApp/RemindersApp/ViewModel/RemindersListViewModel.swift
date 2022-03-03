//
//  RemindersViewModelViewModel.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 28/02/22.
//  
//
import Combine
import CoreData
import Foundation
import SwiftUI

// ObservableObject: the ViewModel can be an observation target and can send information to the entire application.
class RemindersListViewModel: ObservableObject {
    // Add the @Published properties to all the properties of the ViewModel that can trigger an update in the UI.
    @Published var listItems = [ReminderViewModel]()
    let manager = CoreDataManger.instance

    init() {
        fetchReminderItems()
    }

    func fetchReminderItems() {
        listItems = manager.fetchData().map(ReminderViewModel.init)
    }

    func deleteReminderItem(index: IndexSet) {
        guard let index = index.first else {
            return
        }
        let item = listItems[index]
        let reminderModel = item.itemModel
        deleteReminderItem(with: reminderModel)
    }

    func deleteReminderItem(with item: Reminder) {
        manager.deleteData(item: item)
        fetchReminderItems()
    }

    func updateReminderItem(with item: ReminderViewModel) {
        let reminderModel = item.itemModel
        let currentTitle = reminderModel.title
        let newTitle = currentTitle + " Reminder"
        reminderModel.title = newTitle
        manager.saveData()
        fetchReminderItems()
    }
}


class ReminderViewModel: Identifiable {
    var itemModel: Reminder

    init(itemModel: Reminder) {
        self.itemModel = itemModel
    }

    var priority: ReminderPriority {
        return ReminderPriority(rawValue: self.itemModel.priority) ?? .none
    }

    var title: String {
        itemModel.title
    }
}
