//
//  NewReminderButtonView.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 27/02/22.
//

import SwiftUI

struct NewReminderButtonView: View {
  
  @Binding var isShowingCreateView: Bool
  
  var body: some View {
    Button(action: { isShowingCreateView.toggle() }) {
      Image(systemName: "plus.circle.fill")
        .foregroundColor(.red)
      Text("New Reminder")
        .font(.headline)
        .foregroundColor(.red)
    }
    .sheet(isPresented: $isShowingCreateView) {
      CreateReminderView()
    }
  }
}

struct NewReminderButtonView_Previews: PreviewProvider {
  static var previews: some View {
    NewReminderButtonView(isShowingCreateView: .constant(false))
  }
}
