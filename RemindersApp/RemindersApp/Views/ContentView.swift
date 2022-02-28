//
//  ContentView.swift
//  RemindersApp
//
//  Created by Victor Hugo Benitez Bosques on 27/02/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      RemindersView()
        .navigationBarTitle(Text("Reminders"))
        .navigationBarItems(leading: EditButton())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
