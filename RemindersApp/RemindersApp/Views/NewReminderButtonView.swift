//
//  NewReminderButtonView.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 27/02/22.
//

import SwiftUI
import CoreData

struct NewReminderButtonView: View {
    // Definition:
    // @Environment allow us to share data around the app
    // we can access to the value using the key path
    @Environment (\.managedObjectContext) var context: NSManagedObjectContext
    @Binding var isShowingCreateView: Bool
    @ObservedObject var itemViewModel: RemindersListViewModel
    var body: some View {
        Button(action: { isShowingCreateView.toggle() }) {
            Image(systemName: "plus.circle.fill")
                .foregroundColor(.red)
            Text("New Reminder")
                .font(.headline)
                .foregroundColor(.red)
        }
        .sheet(isPresented: $isShowingCreateView, onDismiss: {
            itemViewModel.fetchReminderItems()
        }, content: {
            CreateReminderView()
        })
    }
}

struct NewReminderButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NewReminderButtonView(isShowingCreateView: .constant(false), itemViewModel: RemindersListViewModel())
    }
}
