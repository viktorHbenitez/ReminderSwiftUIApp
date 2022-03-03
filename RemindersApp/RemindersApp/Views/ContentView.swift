//
//  ContentView.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 27/02/22.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject private var listViewModel = RemindersListViewModel()
    @State var isShowingCreateModal: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                RemindersView(itemViewModel: self.listViewModel)
            }
            .navigationBarTitle(Text("Reminders"))
            .navigationBarItems(leading: EditButton(), trailing: ReminderUpdate(reminderViewModel: listViewModel))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ReminderUpdate: View {
    @ObservedObject private var reminderListVM: RemindersListViewModel

    init(reminderViewModel: RemindersListViewModel) {
        self.reminderListVM = reminderViewModel
    }

    var body: some View {
        Button(action: reminderListVM.fetchReminderItems) {
            Image(systemName: "plus.circle.fill")
                .foregroundColor(.red)
            Text("Actualizar")
                .font(.headline)
                .foregroundColor(.red)
        }
    }
}

struct ReminderUpdate_Previews: PreviewProvider {
    static var previews: some View {
        ReminderUpdate(reminderViewModel: RemindersListViewModel())
    }
}
