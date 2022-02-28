//

import SwiftUI

struct ReminderPrioritySelectionView: View {
    @ObservedObject private var reminderPrioritySelectionVM = ReminderPrioritySelectionListViewModel()
    @Binding var priority: ReminderPriority
    var body: some View {
        List {
            ForEach(0..<ReminderPriority.allCases.count) { index in
                Button(action: {
                    priority = reminderPrioritySelectionVM.setReminderPriority(from: index)
                    reminderPrioritySelectionVM.setDefaultArrayitems()
                    reminderPrioritySelectionVM.setSelectionReminderPriority(from: index)
                }) {
                    HStack {
                        Text(reminderPrioritySelectionVM.getReminderPriorityFullDisplay(from: index))
                            .foregroundColor(.black)
                        Spacer()

                        if reminderPrioritySelectionVM.isSelected(index: index) {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        }
    }
}

struct ReminderPrioritySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderPrioritySelectionView(priority: .constant(.none))
    }
}
