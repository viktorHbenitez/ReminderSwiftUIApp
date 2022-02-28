//
//  ReminderPrioritySelectionViewModel.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 28/02/22.
//  
//
import Combine
import Foundation

// ObservableObject: the ViewModel can be an observation target and can send information to the entire application.
class ReminderPrioritySelectionListViewModel: ObservableObject {

    // Add the @Published properties to all the properties of the ViewModel that can trigger an update in the UI.
    @Published var selections: Array = Array(repeating: false, count: ReminderPriority.allCases.count)

    func setDefaultArrayitems() {
        selections = Array(repeating: false, count: ReminderPriority.allCases.count)
    }

    func getReminderPriorityFullDisplay(from index: Int) -> String {
        ReminderPriority.allCases[index].fullDisplay
    }

    func setReminderPriority(from index: Int) -> ReminderPriority {
        ReminderPriority.allCases[index]
    }

    func setSelectionReminderPriority(from index: Int) {
        selections[index] = true
    }

    func isSelected(index: Int) -> Bool {
        selections[index] == true
    }
}

enum ReminderPriority: Int16, CaseIterable {
  case none = 0
  case low = 1
  case medium = 2
  case high = 3
}

extension ReminderPriority {
  var shortDisplay: String {
    switch self {
    case .none: return ""
    case .low: return "!"
    case .medium: return "!!"
    case .high: return "!!!"
    }
  }

  var fullDisplay: String {
    switch self {
    case .none: return "None"
    case .low: return "Low"
    case .medium: return "Medium"
    case .high: return "High"
    }
  }
}
