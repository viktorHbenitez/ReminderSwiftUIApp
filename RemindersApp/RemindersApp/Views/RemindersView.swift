//
//  RemindersView.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 27/02/22.
//

import SwiftUI

struct RemindersView: View {
    @ObservedObject var itemListVM: RemindersListViewModel = RemindersListViewModel()
    @State var isShowingCreateModal: Bool = false

    var body: some View {
        VStack {
            List {
                Section {
                    ForEach(itemListVM.listItems, id: \.title) { item in
                        Text(item.title)
                    }
                }
            }
            .listStyle(.plain)
            .background(.white)
            HStack {
                NewReminderButtonView(isShowingCreateView: $isShowingCreateModal)
                Spacer()
            }
            .padding(.leading)
        }
        .navigationBarTitle(Text("Reminders"))
    }
}

struct RemindersView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersView()
    }
}
