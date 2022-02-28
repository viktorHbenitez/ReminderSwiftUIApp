//
//  RemindersViewModelViewModel.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 28/02/22.
//  
//
import Combine
import Foundation

// ObservableObject: the ViewModel can be an observation target and can send information to the entire application.
class RemindersListViewModel: ObservableObject {

    // Add the @Published properties to all the properties of the ViewModel that can trigger an update in the UI.
    @Published var listItems = [RemindersViewModel]()

    // Call data in the init() method
    init() {
        fetchItems()
    }

    func fetchItems() {
        // TODO: change and get the method from CoreDataManager if you use Core Data
//        self.listItems = CoreDataManager.shared.getAllItems().map(RemindersViewModel.init)
        self.listItems = RemindersViewModel.getDummyData()
    }
}


class RemindersViewModel: Identifiable {
    var title = ""

    init(title: String) {
        self.title = title
    }

    static func getDummyData() -> [RemindersViewModel] {
        [RemindersViewModel(title: "Recordatorio 1"),
         RemindersViewModel(title: "Recordatorio 2"),
         RemindersViewModel(title: "Recordatorio 3"),
         RemindersViewModel(title: "Recordatorio 4")]
    }
}
