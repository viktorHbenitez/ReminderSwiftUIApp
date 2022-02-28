//
//  RemindersView.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 27/02/22.
//

import SwiftUI

struct RemindersView: View {
  @State var isShowingCreateModal: Bool = false

  var body: some View {
    VStack {
      List {
        Section {
          ForEach(1...10, id: \.self) { _ in
            Text("Cell List")
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
