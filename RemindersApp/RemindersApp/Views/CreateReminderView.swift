//
//  CreateReminderView.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 27/02/22.
//

import SwiftUI
import CoreData

struct CreateReminderView: View {
    // MARK: - @Environment @State @ObservedObject
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject private var createReminderVM = CreateReminderListViewModel()
    @State var shouldRemind: Bool = false
    @State var isFormCompleted: Bool = false

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
                Section {
                    if isFormCompleted {
                        Text("Necesitas llenar los campos de texto y nota")
                            .font(.headline)
                            .foregroundColor(.blue)
                    } else {
                        Text("")
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitle(Text("Create Event"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                guard createReminderVM.isEmptyReminderItem() else {
                    isFormCompleted.toggle()
                    return
                }
                createReminderVM.saveReminer()
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
