//
//  ContentView.swift
//  checklist
//
//  Created by Zimo on 29/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var done = Array(repeating: false, count: 15)
    
    let tasks = [
        "AM7:20 Wake up",
        "AM7:40 Brush teeth",
        "AM8:00 Get dressed",
        "AM8:30 Breakfast",
        "AM8:40 Send child to school",
        "AM8:50 Check emails",
        "AM9:00 Start work",
        "AM12:00 Lunch",
        "PM2:40 Check emails again",
        "PM2:50 Get child back home",
        "PM5:30 Make some dinner",
        "PM6:00 Eat dinner",
        "PM7:30 Shower time",
        "PM8:00 Get ready for bed",
        "PM8:30 Read a book and sleep time"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(tasks.indices, id: \.self) { index in
                HStack {
                    Image(systemName: "\(index + 1).circle")
                    Text(tasks[index])
                    Spacer()
                    Image(systemName: done[index] ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(done[index] ? .green : .gray)
                        .onTapGesture {
                            done[index].toggle()
                        }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

/// Todo for today: add checklist "done" icons maybe via `Circle`
