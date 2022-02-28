//
//  CreateReminderView.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 27/02/22.
//

import SwiftUI
import CoreData

struct CreateReminderView: View {
    // MARK: - State -
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext: NSManagedObjectContext

    @State var shouldRemind: Bool = false
    @ObservedObject private var createReminderVM = CreateReminderListViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $createReminderVM.text)
                    TextField("Notes", text: $createReminderVM.notes)
                }
                Section {
                    HStack {
                        Toggle(isOn: $shouldRemind) {
                            Text("Remind me")
                        }
                        .onTapGesture {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                        }
                    }
                    if shouldRemind {
                        DatePicker(selection: $createReminderVM.dueDate, displayedComponents: .date) {
                            Text("Date")
                        }
                    }
                }
                Section {
                    NavigationLink(destination: ReminderPrioritySelectionView(priority: $createReminderVM.priority)) {
                        Text("Priority")
                        Spacer()
                        Text(createReminderVM.priority.fullDisplay)
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitle(Text("Create Event"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                createReminderVM.saveReminer(using: viewContext)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
                    .fontWeight(.bold)
            })
        }
    }
}

struct CreateReminderView_Previews: PreviewProvider {
    static var previews: some View {
        CreateReminderView()
    }
}
