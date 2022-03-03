//
//  RemindersView.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 27/02/22.
//

import SwiftUI
import CoreData

struct RemindersView: View {
    @State var isShowingCreateModal: Bool = false
    @ObservedObject private var itemListVM: RemindersListViewModel

    init(itemViewModel: RemindersListViewModel) {
        self.itemListVM = itemViewModel
    }

    var body: some View {
        VStack {
            List {
                Section {
                    ForEach(itemListVM.listItems, id: \.title) { item in
                        ReminderRow(reminder: item)
                    }
                    .onDelete(perform: itemListVM.deleteReminderItem)
                }
            }
            .listStyle(.plain)
            .background(.white)
            HStack {
                NewReminderButtonView(isShowingCreateView: $isShowingCreateModal, itemViewModel: itemListVM)
                Spacer()
            }
            .padding(.leading)
        }
        .navigationBarTitle(Text("Reminders"))
    }
}

struct RemindersView_Previews: PreviewProvider {
    static var previews: some View {
        return RemindersView(itemViewModel: RemindersListViewModel())
    }
}
