//
//  ContentView.swift
//  checklist
//
//  Created by Zimo on 29/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Label("AM7:20 Wake up", systemImage: "1.circle")
            Label("AM7:40 Brush teeth", systemImage: "2.circle")
            Label("AM8:00 Get dressed", systemImage: "3.circle")
            Label("AM8:30 Breakfast", systemImage: "4.circle")
            Label("AM8:40 Send child to school", systemImage: "5.circle")
            Label("AM8:50 Check emails", systemImage: "6.circle")
            Label("AM9:00 Start work", systemImage: "7.circle")
            Label("AM12:00 Lunch", systemImage: "8.circle")
            Label("PM2:40 Check emails again", systemImage: "9.circle")
            Label("PM2:50 Get child back home", systemImage: "10.circle")
            Label("PM5:30 Make some dinner", systemImage: "11.circle")
            Label("PM6:00 Eat dinner", systemImage: "12.circle")
            Label("PM7:30 Shower time", systemImage: "13.circle")
            Label("PM8:00 Get ready for bed", systemImage: "14.circle")
            Label("PM8:30 Read a book and sleep time", systemImage: "15.circle")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
